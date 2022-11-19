import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_diet_guide/common/route_constants.dart';
import 'package:my_diet_guide/models/DietPlan.dart';

import '../../controllers/Controller.dart';


class WebPlanUpdateCard extends StatelessWidget {

  final DietPlanModel dietPlanModel;

  const WebPlanUpdateCard({Key? key, required this.dietPlanModel}) : super(key: key);

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
                    padding: const EdgeInsets.all(20.0),
                    child: Text('Plan ${dietPlanModel.planId}', style: const TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.left,),
                  ),

                ],
              ),
              Row(
                  children:[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        dietPlanModel.dietary_preference,
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ]
              ),
              const SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, RouteConstants.planViewSelectRoute,
                              arguments: dietPlanModel
                          );

                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "See More",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 17
                            ),
                          ),
                        )
                    ),
                    SizedBox(width: 10,),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.teal.shade900
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () async {
                            showDialog(
                                context: context,
                                builder: (BuildContext context){
                                  return AlertDialog(
                                    title: Text(
                                      "Confirmation",
                                      style: TextStyle(
                                          fontSize: 32
                                      ),
                                    ),
                                    content: Text(
                                      "Do you want to update this diet plan?",
                                      style: TextStyle(
                                          fontSize: 32
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        child: Text(
                                          "Yes",
                                          style: TextStyle(
                                              fontSize: 32
                                          ),
                                        ),
                                        onPressed: ()async{
                                          Navigator.pushNamed(context, RouteConstants.planUpdateRoute, arguments: dietPlanModel);
                                        },
                                      ),
                                      TextButton(
                                        child: Text(
                                          "No",
                                          style: TextStyle(
                                              fontSize: 32
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
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Update",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Image(
                  image: AssetImage(dietPlanModel.imgPath),
                  fit: BoxFit.cover,
                  width: 150,
                  height: 150,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}