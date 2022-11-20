import 'package:flutter/material.dart';
import 'package:my_diet_guide/widgets/background_image.dart';
import 'package:my_diet_guide/widgets/blurred_background_image.dart';
import 'package:my_diet_guide/widgets/recommended_plans.dart';

import '../controllers/Controller.dart';
import '../models/DietPlan.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/side_bar.dart';

class SelectPlan extends StatefulWidget {

  final List<DietPlanModel> recommendedPlans;

  const SelectPlan({Key? key, required this.recommendedPlans,
  }) : super(key: key);

  @override
  State<SelectPlan> createState() => _SelectPlanState();
}

class _SelectPlanState extends State<SelectPlan> {


  @override
  Widget build(BuildContext context) {

    return SafeArea(
      top: true,
      minimum: EdgeInsets.only(top: 20),
      child: Scaffold(
        backgroundColor: Colors.teal.shade900,
        body: Stack(
          children: [
            BlurredBackground(),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    RecommendedPlans(recommendedPlans: widget.recommendedPlans,)
                  ],
                ),
              ),
            )
          ],
        ),

      ),
    );


  }




}