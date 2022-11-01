import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_diet_guide/models/Plan.dart';
import 'package:my_diet_guide/screens/user_dashboard.dart';
import 'package:my_diet_guide/widgets/background_image.dart';
import 'package:my_diet_guide/widgets/plan_card.dart';

import '../models/UserBiometrics.dart';

class SelectPlan extends StatefulWidget {

  final UserBiometrics userBiometrics;

  const SelectPlan({Key? key, required this.userBiometrics}) : super(key: key);

  @override
  State<SelectPlan> createState() => _SelectPlanState();
}

class _SelectPlanState extends State<SelectPlan> {


  late Stream<QuerySnapshot> recommendedPlanStream;
  late String userDietaryPreference;
  late String userAgeGroup;
  late String userIntensity;
  late String userActiveness;
  late String userGender;
  late String userId;

  @override
  void initState() {
    userDietaryPreference = widget.userBiometrics.dietaryPreference;
    userAgeGroup = DietPlanModel.getAgeGroup(widget.userBiometrics.age);
    userIntensity = widget.userBiometrics.intensity;
    userActiveness = widget.userBiometrics.activeness;
    userGender = widget.userBiometrics.gender;
    userId = widget.userBiometrics.user_id;
    //print(userDietaryPreference);
    //print(userAgeGroup);
    //print(userIntensity);
    //print(userActiveness);
   // print(userGender);
    recommendedPlanStream = DietPlanModel.getPlanStream(userDietaryPreference, userAgeGroup,userGender, userIntensity, userActiveness);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        BackgroundImage(),

        Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Recommended Plans",
                          style: TextStyle(fontSize: 22),
                        )
                      ],
                    ),
                    StreamBuilder<QuerySnapshot>(
                      stream: recommendedPlanStream,
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){

                        if (snapshot.hasError) {
                          return const Text('Something went wrong');
                        }
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        List<DietPlanModel> l = DietPlanModel.getMostReccomendedPlans(snapshot, userAgeGroup, userIntensity, userActiveness, null);
                        if(l.length == 0){
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 25, 10, 10),
                                child: Text(
                                  "There are no available diet plans for your biometrics.",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 20
                                  ),
                                ),
                              )
                            ],
                          );
                        }else{
                        return Column(
                          children: l.map((DietPlanModel planModel){
                            return GestureDetector(
                              child: PlanCard(dietPlanModel: planModel),
                              onTap: () async {
                                bool success = true;
                                String msg = "";
                                try{
                                  await FirebaseFirestore.instance.collection('user')
                                      .doc(userId).set({
                                    'current_plan':planModel.planId
                                  }, SetOptions(merge: true));
                                  msg = "Plan selected successfully.";
                                }catch(error){
                                  success = false;
                                  msg = "An error occurred. Please try again.";
                                }
                                showDialog<void>(
                                  context: context,
                                  barrierDismissible: false, // user must tap button!
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Plan Select'),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: [
                                            Text(msg),
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text('OK'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            if(success){
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => UserDashboard()));
                                            }
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            );
                          }).toList().cast(),
                        );
                        }
                      },

                    ),

                  ],
                )
              ],
            ),
          )
        ),
      ]
    );


  }




}

