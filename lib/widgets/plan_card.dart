import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_diet_guide/common/route_constants.dart';
import 'package:my_diet_guide/models/DietPlan.dart';

import '../controllers/Controller.dart';

class PlanCard extends StatelessWidget {

  final DietPlanModel dietPlanModel;
  final bool planSelect;
  final bool nonGesture;

  const PlanCard({Key? key, required this.dietPlanModel, required this.planSelect, required this.nonGesture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.white24, Colors.white10],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
          ),
          borderRadius: BorderRadius.circular(28),
          border: Border.all(width: 2, color: Colors.white10)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Plan ${dietPlanModel.planId}', style: const TextStyle(fontSize: 19, color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.left,),
                  ),

                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(dietPlanModel.dietary_preference, style: const TextStyle(fontSize: 16, color: Colors.white), textAlign: TextAlign.left,),
                  ),
                ],
              ),

              !nonGesture? Row(
                children: [

                  GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, RouteConstants.planViewSelectRoute,
                            arguments: dietPlanModel
                        );

                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "See More",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16
                          ),
                        ),
                      )
                  ),
                  SizedBox(width: 10,),
                  GestureDetector(
                    onTap: () async {
                      showDialog(
                          context: context,
                          builder: (BuildContext context){
                            return AlertDialog(
                              title: Text(
                                "Confirmation",
                                style: TextStyle(
                                  fontSize: 24
                                ),
                              ),
                              content: Text(
                                "Do you want to set this as your diet plan?",
                                style: TextStyle(
                                  fontSize: 19
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: Text(
                                    "Yes",
                                    style: TextStyle(
                                      fontSize: 22
                                    ),
                                  ),
                                  onPressed: ()async{
                                    bool success = await dietPlanModel.select(
                                        user_id:   Controller.auth!.currentUser!.uid
                                    );
                                    String msg = "";
                                    String? successMsg;
                                    if(planSelect){
                                      successMsg = "Plan selected successfully";
                                    }else{
                                      successMsg = "Plan changed successfully";
                                    }
                                    if(success)
                                      msg = successMsg;
                                    else
                                      msg = "An error occurred. Please try again.";
                                    Navigator.of(context).pop();
                                    showDialog<void>(
                                      context: context,
                                      barrierDismissible: false, // user must tap button!
                                      builder: (BuildContext context) {
                                        String? actionMessage;
                                        if(planSelect){
                                          actionMessage = "Plan Select";
                                        }else{
                                          actionMessage = "Plan Change";
                                        }
                                        return AlertDialog(
                                          title: Text(
                                              actionMessage,
                                            style: TextStyle(
                                              fontSize: 24
                                            ),
                                          ),
                                          content: Text(
                                              msg,
                                            style: TextStyle(
                                              fontSize: 19
                                            ),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              child: const Text(
                                                  'OK',
                                                style: TextStyle(
                                                  fontSize: 22
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                if(success){
                                                  Navigator.pushNamed(context, '/');
                                                }
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                                TextButton(
                                  child: Text(
                                      "No",
                                    style: TextStyle(
                                      fontSize: 22
                                    ),
                                  ),
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          }
                      );

                    },

                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.teal.shade900
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Select",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  )
                ],
              ):const Text('')
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Image(
                  image: AssetImage(dietPlanModel.imgPath),
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}