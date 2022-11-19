import 'package:flutter/material.dart';
import 'package:my_diet_guide/screens/web_screens/web_admin_nav_bar.dart';
import 'package:my_diet_guide/widgets/background_image.dart';
import 'package:my_diet_guide/widgets/recommended_plans.dart';
import 'package:my_diet_guide/widgets/web_widgets/web_blurred_backgound.dart';

import '../../models/DietPlan.dart';
import '../../widgets/web_widgets/web_all_plans.dart';
import '../../widgets/web_widgets/web_recommended_plans.dart';


class WebAllPlansView extends StatefulWidget {

  final List<DietPlanModel> allPlans;

  const WebAllPlansView({Key? key, required this.allPlans,
  }) : super(key: key);

  @override
  State<WebAllPlansView> createState() => _WebAllPlansViewState();
}

class _WebAllPlansViewState extends State<WebAllPlansView> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.teal.shade900,
      appBar: WebAdminNavBar(),
      body: Stack(
        children: [
          WebBlurredBackground(),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  WebAllPlans(allPlans: widget.allPlans)
                ],
              ),
            ),
          )
        ],
      ),

    );


  }




}