import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_diet_guide/screens/view_diet_details.dart';
import 'package:my_diet_guide/widgets/view_diet_card.dart';

import '../widgets/blurred_background_image.dart';
import '../widgets/bottom_bar.dart';

class ViewDietPlan extends StatefulWidget {

  final String user_id;

  const ViewDietPlan({Key? key, required this.user_id}) : super(key: key);



  @override
  State<ViewDietPlan> createState() => _ViewDietPlanState();
}

class _ViewDietPlanState extends State<ViewDietPlan> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Scaffold(
          // extendBodyBehindAppBar: true,
          backgroundColor: Colors.teal.shade900,
          appBar: AppBar(
            backgroundColor: Colors.teal.shade900,
            title: Text('View Diet Plan'),
            elevation: 0,
          ),

        body: Stack(
          children: [
            BlurredBackground(),
            SafeArea(
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
                  ViewDietCard(day: 'Monday', user_id: widget.user_id,),

                  //tuesday
                  ViewDietCard(day: 'Tuesday', user_id: widget.user_id,),

                  //wednesday
                  ViewDietCard(day: 'Wednesday', user_id: widget.user_id,),

                  //thursday
                  ViewDietCard(day: 'Thursday', user_id: widget.user_id,),

                  //Friday
                  ViewDietCard(day: 'Friday', user_id: widget.user_id,),

                  //saturday
                  ViewDietCard(day: 'Saturday', user_id: widget.user_id,),

                  //sunday
                  ViewDietCard(day: 'Sunday' , user_id: widget.user_id,),
                  SizedBox(height: 20,),


                ],
              ),
            ),
          ),]
        ),
        bottomNavigationBar: BottomBar(user_id: widget.user_id),
      ),
    ]
    );
  }
}
