import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_diet_guide/models/Plan.dart';
import 'package:my_diet_guide/widgets/plan_card.dart';

class ChangePlan extends StatefulWidget {
  const ChangePlan({Key? key}) : super(key: key);

  @override
  State<ChangePlan> createState() => _ChangePlanState();
}

class _ChangePlanState extends State<ChangePlan> {


  late Stream<QuerySnapshot> recommendedplanStream;
  DietPlanModel currentPlan = DietPlanModel(
      name: "Plan1",
      desc: "aaaaaa",
      dietary_preference: "meat",
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

    return Scaffold(

        backgroundColor: Colors.green.shade100,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                              fontSize: 20
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
                        ),
                      )
                    ],
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: recommendedplanStream,
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){

                      if (snapshot.hasError) {
                        return const Text('Something went wrong');
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text('Loading');
                      }
                      // print("aaaaa");
                      List<DietPlanModel> l = DietPlanModel.getMostReccomendedPlans(snapshot, currentPlan.intensity, currentPlan.activeness, currentPlan.age_group);
                      //print("bbbbb");
                      //print(l);
                      //print(snapshot.data!.docs);
                      return Column(
                        children: l.map((DietPlanModel planModel){
                          //  print(planModel);
                          return PlanCard(dietPlanModel: planModel);
                        }).toList().cast(),
                      );
                    },

                  ),

                ],
              )
            ],
          ),
        )
    );


  }




}