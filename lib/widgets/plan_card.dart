import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/DietPlan.dart';

class PlanCard extends StatefulWidget {
  DietPlanModel dietPlanModel;

  PlanCard({Key? key, required this.dietPlanModel}) : super(key: key);

  @override
  State<PlanCard> createState() => _PlanCardState();
}

class _PlanCardState extends State<PlanCard> {
  var plan;

  @override
  void initState() {
    this.plan = widget.dietPlanModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        color: Colors.white,
        borderOnForeground: true,
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Container(
                child: Image(
                  image: AssetImage('assets/images/diet_plan/' + plan.img),
                  fit: BoxFit.cover,
                  //width: 110,
                  //height: 110,
                ),
              ),
              title: Center(child: Text("Plan ${plan.planId}", style: TextStyle(color: Colors.green, fontSize: 20))),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: [
                      Text(
                        'Intensity Level: ' + plan.intensity,
                        style: TextStyle(color: Colors.red, fontSize: 15),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'For ' + plan.activeness + ' users',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      )
                    ],
                  )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}