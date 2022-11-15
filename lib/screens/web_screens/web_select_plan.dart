import 'package:flutter/material.dart';
import 'package:my_diet_guide/widgets/background_image.dart';
import 'package:my_diet_guide/widgets/recommended_plans.dart';

import '../../widgets/web_widgets/web_recommended_plans.dart';


class WebSelectPlan extends StatefulWidget {


  const WebSelectPlan({Key? key,
  }) : super(key: key);

  @override
  State<WebSelectPlan> createState() => _WebSelectPlanState();
}

class _WebSelectPlanState extends State<WebSelectPlan> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.teal.shade900,
      appBar: AppBar(
        backgroundColor: Colors.teal.shade900,
        elevation: 0,
        title: const Text('Select Diet Plan'),
      ),
      body: Stack(
        children: [
          BackgroundImage(),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  WebRecommendedPlans()
                ],
              ),
            ),
          )
        ],
      ),

    );


  }




}
