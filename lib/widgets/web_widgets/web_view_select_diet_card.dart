import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_diet_guide/common/route_constants.dart';
import 'package:my_diet_guide/models/DietPlan.dart';

class WebViewSelectDietCard extends StatelessWidget {

  final String day;
  final DietPlanModel dietPlanModel;
  const WebViewSelectDietCard({Key? key, required this.day, required this.dietPlanModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(45.0),
      child: GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, RouteConstants.dietViewSelectRoute,
                arguments: <String, String>{
                  'day':day,
                  'breakfast_id': dietPlanModel.breakfast_id,
                  'lunch_id': dietPlanModel.lunch_id,
                  'dinner_id': dietPlanModel.dinner_id
                }
            );
          },
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.white24, Colors.white10],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight
                      ),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Center(
                    child: Text(
                      "$day Diet Plan",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24
                      ),
                    ),
                  )
              ),
            ),
          )
      ),
    );
  }
}