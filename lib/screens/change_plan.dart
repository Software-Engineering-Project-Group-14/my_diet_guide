import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_diet_guide/models/Plan.dart';
import 'package:my_diet_guide/widgets/plan_card.dart';

import '../widgets/blurred_background_image.dart';
import '../widgets/bottom_bar.dart';

class ChangePlan extends StatefulWidget {
  const ChangePlan({Key? key}) : super(key: key);

  @override
  State<ChangePlan> createState() => _ChangePlanState();
}

class _ChangePlanState extends State<ChangePlan> {

  final dietUser = FirebaseAuth.instance.currentUser;
  late String user_id = dietUser!.uid;

  late Stream<QuerySnapshot> recommendedplanStream;
  DietPlanModel currentPlan = DietPlanModel(
      name: "Plan1",
      desc: "aaaaaa",
      dietary_preference: "Classical",
      gender: "male",
      intensity: "hard",
      activeness: "active",
      age_group: "26-45",
      breakfast_id: "d",
      lunch_id: "3",
      dinner_id: "4"
  );


  @override
  void initState() {
    recommendedplanStream = DietPlanModel.getPlanStream(currentPlan.dietary_preference, currentPlan.age_group, currentPlan.gender,currentPlan.intensity,currentPlan.activeness);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.teal.shade900,
          appBar: AppBar(
            backgroundColor: Colors.teal.shade900,
            elevation: 0,
            title: Text("Change my diet plan"),
            toolbarHeight: 100
          ),
          body: Stack(
            children: [
              BlurredBackground(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Current plan",
                                style: GoogleFonts.poppins(
                                    fontSize: 20,
                                  color: Colors.white
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(child: PlanCard(dietPlanModel:currentPlan))
                            ],
                          )
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Other recommended plans",
                              style: GoogleFonts.poppins(
                                fontSize: 22,
                                color: Colors.white
                              ),
                            )
                          ],
                        ),
                        StreamBuilder<QuerySnapshot>(
                          stream: recommendedplanStream,
                          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){

                            if (snapshot.hasError) {
                              return const Text(
                                  'Something went wrong',
                                style: TextStyle(
                                  color: Colors.white
                                ),
                              );
                            }
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return Text(
                                  'Loading',
                                style: TextStyle(
                                    color: Colors.white
                                ),
                              );
                            }
                            List<DietPlanModel> l = DietPlanModel.getMostReccomendedPlans(snapshot, currentPlan.intensity, currentPlan.activeness, currentPlan.age_group);
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
                                  //  print(planModel);
                                  return PlanCard(dietPlanModel: planModel);
                                }).toList().cast(),
                              );
                            }
                          },

                        ),

                      ],
                    )
                  ],
                ),
              ),
            ]
          ),
        bottomNavigationBar: BottomBar(user_id: user_id),
      ),
    );


  }




}