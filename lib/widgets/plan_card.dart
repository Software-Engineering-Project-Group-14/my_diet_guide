import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/Plan.dart';

class PlanCard extends StatefulWidget {

  Plan plan;

  PlanCard({Key? key, required this.plan}) : super(key: key);

  @override
  State<PlanCard> createState() => _PlanCardState();
}


class _PlanCardState extends State<PlanCard> {

  var plan;

  @override
  void initState() {
    this.plan = widget.plan;
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
                image: AssetImage(
                    'assets/images/diet_plan/'+plan.img),
                fit: BoxFit.cover,
                //width: 110,
                //height: 110,
              ),
            ),
            title: Text("${plan.name}",
                style: TextStyle(color: Colors.green)),
            subtitle: Text(
              "${plan.desc}",
              style: TextStyle(color: Colors.orangeAccent),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 3, 0, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Intensity Level: '+plan.intensity,
                  style: GoogleFonts.poppins(
                      color: Colors.red,
                      fontSize: 13
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'For '+plan.activeness+' users',
                  style: GoogleFonts.poppins(
                      color: Colors.blue,
                      fontSize: 13
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );

  }

}