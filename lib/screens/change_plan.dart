import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_diet_guide/models/DietPlan.dart';
import 'package:my_diet_guide/models/UserBiometrics.dart';
import 'package:my_diet_guide/screens/user_dashboard.dart';
import 'package:my_diet_guide/widgets/plan_card.dart';

import '../widgets/blurred_background_image.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/side_bar.dart';

class ChangePlan extends StatefulWidget {

  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  const ChangePlan({Key? key, required this.firestore, required this.auth}) : super(key: key);

  @override
  State<ChangePlan> createState() => _ChangePlanState();
}

class _ChangePlanState extends State<ChangePlan> {

  late Stream<DietPlanModel> currentPlanStream;
  late Stream<UserBiometrics> userBiometricsStream;

  @override
  void initState() {
    currentPlanStream = DietPlanModel.getDietPlanForUser(firestore:widget.firestore , user_id:widget.auth.currentUser!.uid).asStream();
    userBiometricsStream = UserBiometrics.getUserBiometrics(firestore:widget.firestore , user_id:widget.auth.currentUser!.uid).asStream();
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
                                Stream<QuerySnapshot> recommendedplanStream = DietPlanModel.getPlanStream(
                                    firestore: widget.firestore,
                                    dietary_preference: userBiometrics.dietaryPreference,
                                    age_group: DietPlanModel.getAgeGroup(userBiometrics.age),
                                    gender: userBiometrics.gender,
                                    intensity: userBiometrics.intensity,
                                    activeness: userBiometrics.activeness
                                );
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

                                        List<DietPlanModel> l = DietPlanModel.getMostReccomendedPlans(
                                            snapshot: snapshot,
                                            age_group: DietPlanModel.getAgeGroup(userBiometrics.age),
                                            activeness: userBiometrics.activeness,
                                            currentPlanId: currentPlan.planId,
                                            intensity: userBiometrics.intensity
                                        );
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
                                            children: l.asMap().entries.map((entry){
                                              //  print(planModel);
                                              return GestureDetector(
                                                key: Key("recommend-plan-card-${entry.key}"),
                                                child: PlanCard(dietPlanModel: entry.value),
                                                onTap: () async {
                                                  bool success = await entry.value.select(
                                                      firestore: widget.firestore,
                                                      user_id: widget.auth.currentUser!.uid
                                                  );
                                                  String msg = "";
                                                  if(success)
                                                    msg = "Plan changed successfully.";
                                                  else
                                                    msg = "An error occurred. Please try again.";
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
        bottomNavigationBar: BottomBar(user_id: widget.auth.currentUser!.uid),
      ),
    );


  }




}