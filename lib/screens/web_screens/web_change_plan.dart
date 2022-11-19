import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_diet_guide/models/DietPlan.dart';
import 'package:my_diet_guide/widgets/web_widgets/web_user_navigation_bar.dart';

import '../../widgets/blurred_background_image.dart';
import '../../widgets/web_widgets/web_blurred_backgound.dart';
import '../../widgets/web_widgets/web_plan_card.dart';
import '../../widgets/web_widgets/web_recommended_plans.dart';



class WebChangePlan extends StatefulWidget {

  final DietPlanModel currentPlan;
  final List<DietPlanModel> recommendedPlans;

  const WebChangePlan({Key? key, required this.currentPlan, required this.recommendedPlans, }) : super(key: key);

  @override
  State<WebChangePlan> createState() => _WebChangePlanState();
}

class _WebChangePlanState extends State<WebChangePlan> {

  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      key: const Key('change-diet-plan'),
      backgroundColor: Colors.teal.shade900,
      appBar: WebUserNavBar(),
      body: Stack(
          children: [

            WebBlurredBackground(),

            SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child:
                  Center(
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Text("Change Diet Plan", style: TextStyle(color: Colors.white, fontSize: 32),),

                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Current plan",
                                      style: TextStyle(
                                          fontSize: 24,
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
                        WebRecommendedPlans(currentPlanId: widget.currentPlan.planId, recommendedPlans: widget.recommendedPlans,)
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