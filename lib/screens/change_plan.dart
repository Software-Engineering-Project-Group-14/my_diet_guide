import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_diet_guide/models/Plan.dart';
import 'package:my_diet_guide/screens/elements/plan_card.dart';

class ChangePlan extends StatefulWidget {
  const ChangePlan({Key? key}) : super(key: key);

  @override
  State<ChangePlan> createState() => _ChangePlanState();
}

class _ChangePlanState extends State<ChangePlan> {

  //Get from database
  List<Plan> recommendedPlans = <Plan>[
    Plan("Super plan", "A very good plan", "veg.png", "Hard", "Frequent"),
    Plan("Super plan", "A very good plan", "meat.png", "Easy", "Frequent"),
    Plan("Super plan", "A very good plan", "fruit.png", "Hard", "Rare"),
    Plan("Super plan", "A very good plan", "veg.png", "Medium", "Frequent"),
  ];

  Plan currentPlan = Plan("Current Plan", "Nice one", "veg.png", "easy", "Average");

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
                        Expanded(child: PlanCard(plan:currentPlan))
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
                  SingleChildScrollView(
                      child: ListView.separated(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(8),
                        itemCount: recommendedPlans.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                              child: PlanCard(
                                  plan: recommendedPlans[index]
                              )
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) => const Divider(),
                      )
                  ),
                ],
              )
            ],
          ),
        )
    );


  }




}