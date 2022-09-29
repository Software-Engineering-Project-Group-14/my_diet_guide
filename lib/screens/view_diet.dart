import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_diet_guide/screens/view_diet_details.dart';
import 'package:my_diet_guide/widgets/view_diet_card.dart';

import '../widgets/blurred_background_image.dart';

class ViewDietPlan extends StatefulWidget {
  const ViewDietPlan({Key? key}) : super(key: key);



  @override
  State<ViewDietPlan> createState() => _ViewDietPlanState();
}

class _ViewDietPlanState extends State<ViewDietPlan> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlurredBackground(),
        Scaffold(
          extendBodyBehindAppBar: true,
            backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('View Diet Plan',),
        ),

        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                      child: Text('Diet Plan',
                      style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold, color: Colors.white.withOpacity(0.8)),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                      child: Text('Dietary preference :',
                        style: TextStyle(
                          fontSize: 20,
                            fontWeight: FontWeight.bold, color: Colors.white.withOpacity(0.8)

                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                      child: Text('Intensity :',
                        style: TextStyle(
                          fontSize: 20,
                            fontWeight: FontWeight.bold, color: Colors.white.withOpacity(0.8)
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                      child: Text('Activeness :',
                        style: TextStyle(
                          fontSize: 20,
                            fontWeight: FontWeight.bold, color: Colors.white.withOpacity(0.8)

                        ),
                      ),
                    ),
                  ],
                ),


                SizedBox(height: 20),
                //monday
                ViewDietCard(day: 'Monday'),

                //tuesday
                ViewDietCard(day: 'Tuesday'),

                //wednesday
                ViewDietCard(day: 'Wednesday'),

                //thursday
                ViewDietCard(day: 'Thrusday'),

                //Friday
                ViewDietCard(day: 'Friday'),

                //saturday
                ViewDietCard(day: 'Saturday'),

                //sunday
                ViewDietCard(day: 'Sunday'),
                SizedBox(height: 20,),


              ],
            ),
          ),
        )
      ),
    ]
    );
  }
}
