import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/Plan.dart';

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
    return Card(
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
            title: Text("Plan ${plan.planId}", style: TextStyle(color: Colors.green)),
            subtitle: Text(
              "Description",
              style: TextStyle(color: Colors.orangeAccent),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 3, 0, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Intensity Level: ' + plan.intensity,
                  style: TextStyle(color: Colors.white, fontSize: 13),
                ),
                const SizedBox(width: 8),
                Text(
                  'For ' + plan.activeness + ' users',
                  style: TextStyle(color: Colors.white, fontSize: 13),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
