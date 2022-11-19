
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_diet_guide/widgets/web_widgets/web_plan_card_update.dart';

import '../../common/messgae_constants.dart';
import '../../models/DietPlan.dart';



class WebAllPlans extends StatefulWidget {
  
  final List<DietPlanModel> allPlans;

  WebAllPlans({Key? key, required this.allPlans }) : super(key: key);
  @override
  State<WebAllPlans> createState() => _WebAllPlansState();
}

class _WebAllPlansState extends State<WebAllPlans> {


  List<Widget> allPlanArea(List<DietPlanModel> l){
    List<Widget> widgetList = [];
    for(int i=0;i<l.length;i+=2){
      Widget leftElement = Padding(
        padding: const EdgeInsets.all(8.0),
        child: WebPlanUpdateCard(
          dietPlanModel: l[i],
        ),
      );
      Widget rightElement = SizedBox(width: 50,);
      if(i+1<l.length){
        rightElement = Padding(
          padding: const EdgeInsets.all(8.0),
          child: WebPlanUpdateCard(
            dietPlanModel: l[i+1],
          ),
        );
      }
      widgetList.add(SingleChildScrollView(
        scrollDirection:Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            leftElement,
            rightElement
          ],
        ),
      ));
    }
    return widgetList;
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (widget.allPlans.length == 0) {
      content = Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 25, 10, 10),
            child: Text(
              MessageConstants.noPlan,
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 20
              ),
            ),
          )
        ],
      );
    } else {
      content = Column(
        children: allPlanArea(widget.allPlans),
      );
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "All plans",
                style: GoogleFonts.poppins(
                    fontSize: 32,
                    color: Colors.white
                ),
              )
            ],
          ),
        ),
        content
      ],
    );


  }
}
