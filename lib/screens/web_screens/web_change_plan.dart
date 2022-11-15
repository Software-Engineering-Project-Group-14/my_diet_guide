import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_diet_guide/models/DietPlan.dart';
import 'package:my_diet_guide/models/UserBiometrics.dart';
import 'package:my_diet_guide/widgets/plan_card.dart';
import 'package:my_diet_guide/widgets/recommended_plans.dart';

import '../../controllers/Controller.dart';
import '../../widgets/blurred_background_image.dart';
import '../../widgets/web_widgets/web_plan_card.dart';
import '../../widgets/web_widgets/web_recommended_plans.dart';



class WebChangePlan extends StatefulWidget {

  final DietPlanModel currentPlan;

  const WebChangePlan({Key? key, required this.currentPlan, }) : super(key: key);

  @override
  State<WebChangePlan> createState() => _WebChangePlanState();
}

class _WebChangePlanState extends State<WebChangePlan> {

  late Stream<UserBiometrics> userBiometricsStream;

  @override
  void initState() {
    userBiometricsStream = UserBiometrics.getUserBiometrics(user_id:Controller.auth!.currentUser!.uid).asStream();
    super.initState();
  }


  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      key: const Key('change-diet-plan'),
      backgroundColor: Colors.teal.shade900,
      appBar: AppBar(
        backgroundColor: Colors.teal.shade900,
        elevation: 0,
        title: const Text('Change Diet Plan'),
      ),
      body: Stack(
          children: [

            const BlurredBackground(),
            SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child:
                  Center(
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Current plan",
                                      style: GoogleFonts.poppins(
                                          fontSize: 45,
                                          color: Colors.white
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  WebPlanCard(dietPlanModel:widget.currentPlan, planSelect: true, nonGesture: true,)
                                ],
                              )
                            ],
                          ),
                        ),
                        WebRecommendedPlans(currentPlanId: widget.currentPlan.planId,)
                      ],
                    ),
                  )
              ),
            ),
          ]

      ),
    );


  }




}