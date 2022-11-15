import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_diet_guide/common/messgae_constants.dart';
import 'package:my_diet_guide/models/DietPlan.dart';
import 'package:my_diet_guide/models/UserBiometrics.dart';
import 'package:my_diet_guide/widgets/plan_card.dart';
import 'package:my_diet_guide/widgets/recommended_plans.dart';

import '../controllers/Controller.dart';
import '../widgets/blurred_background_image.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/plan_card.dart';
import '../widgets/side_bar.dart';

class ChangePlan extends StatefulWidget {

  final DietPlanModel currentPlan;

  const ChangePlan({Key? key, required this.currentPlan, }) : super(key: key);

  @override
  State<ChangePlan> createState() => _ChangePlanState();
}

class _ChangePlanState extends State<ChangePlan> {

  late Stream<UserBiometrics> userBiometricsStream;

  @override
  void initState() {
    userBiometricsStream = UserBiometrics.getUserBiometrics(user_id:"6gDkTTdr4jXWMtq5ZEJngXx7PjP2").asStream();
    super.initState();
  }


  @override
  Widget build(BuildContext context)  {
    return SafeArea(
      top: true,
      minimum: EdgeInsets.only(top: 20),
      child: Scaffold(
        key: const Key('change-diet-plan'),
        backgroundColor: Colors.teal.shade900,
        appBar: AppBar(
          backgroundColor: Colors.teal.shade900,
          elevation: 0,
          title: const Text('Change Diet Plan'),
        ),
        drawer: const NavigationDrawer(),
        body: Stack(
            children: [

              const BlurredBackground(),
              SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child:
                    Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
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
                              ),
                              Row(
                                children: [
                                  Expanded(child: PlanCard(dietPlanModel:widget.currentPlan, planSelect: true, nonGesture: true,))
                                ],
                              )
                            ],
                          ),
                        ),
                        RecommendedPlans(currentPlanId: widget.currentPlan.planId,)
                      ],
                    )
                ),
              ),
            ]

        ),
        bottomNavigationBar: BottomBar(key: Key('bottom-bar'),user_id: Controller.auth!.currentUser!.uid),
      ),
    );


  }




}