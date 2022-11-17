
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_diet_guide/widgets/plan_card.dart';
import 'package:my_diet_guide/widgets/web_widgets/web_plan_card.dart';

import '../../common/messgae_constants.dart';
import '../../controllers/Controller.dart';
import '../../models/DietPlan.dart';
import '../../models/UserBiometrics.dart';



class WebRecommendedPlans extends StatefulWidget {

  late String? currentPlanId;
  final List<DietPlanModel> recommendedPlans;

  WebRecommendedPlans({Key? key, this.currentPlanId, required this.recommendedPlans }) : super(key: key);
  @override
  State<WebRecommendedPlans> createState() => _WebRecommendedPlansState();
}

class _WebRecommendedPlansState extends State<WebRecommendedPlans> {


  List<Widget> recommendedPlanArea(List<DietPlanModel> l){
    List<Widget> widgetList = [];
    for(int i=0;i<l.length;i+=2){
      Widget leftElement = Padding(
        padding: const EdgeInsets.all(8.0),
        child: WebPlanCard(
          dietPlanModel: l[i],
          planSelect: widget.currentPlanId == null,
          nonGesture: false,
        ),
      );
      Widget rightElement = SizedBox(width: 50,);
      if(i+1<l.length){
        rightElement = Padding(
          padding: const EdgeInsets.all(8.0),
          child: WebPlanCard(
            dietPlanModel: l[i+1],
            planSelect: widget.currentPlanId == null,
            nonGesture: false,
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
    if (widget.recommendedPlans.length == 0) {
      content = Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 25, 10, 10),
            child: Text(
              MessageConstants.noRecommendedPlan,
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
        children: recommendedPlanArea(widget.recommendedPlans),
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
                "Recommended plans",
                style: GoogleFonts.poppins(
                    fontSize: 45,
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
