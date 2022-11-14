import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_diet_guide/models/DietPlan.dart';

class PlanCard extends StatelessWidget {

  final DietPlanModel dietPlanModel;

  const PlanCard({Key? key, required this.dietPlanModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.white24, Colors.white10],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
          ),
          borderRadius: BorderRadius.circular(28),
          border: Border.all(width: 2, color: Colors.white10)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Plan ${dietPlanModel.planId}', style: const TextStyle(fontSize: 19, color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.left,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(dietPlanModel.dietary_preference, style: const TextStyle(fontSize: 16, color: Colors.white), textAlign: TextAlign.left,),
                  ),
                ],
              ),

              const SizedBox(height: 20,),

              Row(
                children: [
                  Row(
                    children: [
                      Text("Intensity : ${dietPlanModel.intensity} ", style: TextStyle(color: Colors.white, fontSize: 16),),

                    ],
                  ),
                ],
              ),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Image(
                  image: AssetImage(dietPlanModel.img),
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}