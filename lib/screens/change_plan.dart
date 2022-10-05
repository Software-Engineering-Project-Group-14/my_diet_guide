import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_diet_guide/models/Plan.dart';
import 'package:my_diet_guide/models/UserBiometrics.dart';
import 'package:my_diet_guide/screens/user_dashboard.dart';
import 'package:my_diet_guide/widgets/plan_card.dart';

import '../widgets/blurred_background_image.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/side_bar.dart';

class ChangePlan extends StatefulWidget {
  const ChangePlan({Key? key}) : super(key: key);

  @override
  State<ChangePlan> createState() => _ChangePlanState();
}

class _ChangePlanState extends State<ChangePlan> {

  final dietUser = FirebaseAuth.instance.currentUser;
  late String user_id = dietUser!.uid;


  late Stream<DietPlanModel> currentPlanStream;
  late Stream<UserBiometrics> userBiometricsStream;
  /*
  DietPlanModel currentPlan1 = DietPlanModel(
      planId: "10",
      dietary_preference: "Vegetarian",
      gender: "Male",
      intensity: "Easy",
      activeness: "Active",
      age_group: "26-45",
      breakfast_id: "7",
      lunch_id: "3",
      dinner_id: "4"
  );
*/
  @override
  void initState() {
    currentPlanStream = DietPlanModel.getDietPlanForUser(user_id).asStream();
    userBiometricsStream = UserBiometrics.getUserBiometrics(user_id).asStream();
    //currentPlanStream = DietPlanModel.getCurrentPlanStream();
    //  print(currentPlanStream);
    super.initState();
  }


  @override
  Widget build(BuildContext context)  {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal.shade900,
        appBar: AppBar(
            backgroundColor: Colors.teal.shade900,
            elevation: 0,
            title: Text("Change my diet plan"),
            toolbarHeight: 80
        ),
        drawer: NavigationDrawer(),
        body: SingleChildScrollView(
          child: Stack(
              children: [
                BlurredBackground(),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: StreamBuilder<DietPlanModel>(
                    stream: currentPlanStream,
                    builder: (context, AsyncSnapshot<DietPlanModel> snapshot) {
                      if (snapshot.hasError) {
                        return const Text(
                          'Something went wrong',
                          style: TextStyle(
                              color: Colors.white
                          ),
                        );
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      //print("\nCurrent plan snapshot");

                      DietPlanModel currentPlan = snapshot.data!;
                      //  final currentPlan = snapshot.data;
                      //  print(currentPlan);
                      return Column(
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
                          StreamBuilder<UserBiometrics>(
                              stream: userBiometricsStream,
                              builder: (context, snapshot) {
                                if (snapshot.hasError) {
                                  return const Text(
                                    'Something went wrong in loading user biometrics',
                                    style: TextStyle(
                                        color: Colors.white
                                    ),
                                  );
                                }
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                //print("\nCurrent plan snapshot");

                                UserBiometrics userBiometrics = snapshot.data!;
                                Stream<QuerySnapshot> recommendedplanStream = DietPlanModel.getPlanStream(userBiometrics.dietaryPreference, DietPlanModel.getAgeGroup(userBiometrics.age), userBiometrics.gender,userBiometrics.intensity,userBiometrics.activeness);
                                return Column(
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
                                          return Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        }

                                        List<DietPlanModel> l = DietPlanModel.getMostReccomendedPlans(snapshot, DietPlanModel.getAgeGroup(userBiometrics.age), userBiometrics.intensity, userBiometrics.activeness, currentPlan.planId);

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
                                              return GestureDetector(
                                                child: PlanCard(dietPlanModel: planModel),
                                                onTap: () async {
                                                  bool success = true;
                                                  String msg = "";
                                                  try{
                                                    await FirebaseFirestore.instance.collection('user')
                                                        .doc(user_id).set({
                                                      'current_plan':planModel.planId
                                                    }, SetOptions(merge: true));
                                                    msg = "Plan changed successfully.";
                                                  }catch(error){
                                                    success = false;
                                                    msg = "An error occurred. Please try again.";
                                                  }
                                                  showDialog<void>(
                                                    context: context,
                                                    barrierDismissible: false, // user must tap button!
                                                    builder: (BuildContext context) {
                                                      return AlertDialog(
                                                        title: Text('Plan Change'),
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
                                );
                              }
                          )
                        ],
                      );
                    }
                  ),
                ),
              ]
          ),
        ),
        bottomNavigationBar: BottomBar(user_id: user_id),
      ),
    );


  }




}