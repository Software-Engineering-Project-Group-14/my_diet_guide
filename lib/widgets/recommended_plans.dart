
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_diet_guide/widgets/plan_card.dart';

import '../common/messgae_constants.dart';
import '../models/DietPlan.dart';

class RecommendedPlans extends StatefulWidget {

  late String? currentPlanId;
  final List<DietPlanModel> recommendedPlans;

  RecommendedPlans({Key? key, this.currentPlanId, required this.recommendedPlans }) : super(key: key);
  @override
  State<RecommendedPlans> createState() => _RecommendedPlansState();
}

class _RecommendedPlansState extends State<RecommendedPlans> {

  @override
  Widget build(BuildContext context) {
    Widget content;
    if(widget.recommendedPlans.length==0){
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
    }else{
      content = Column(
        children: widget.recommendedPlans.asMap().entries.map((entry){
          return Padding(
            padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
            child: PlanCard(dietPlanModel: entry.value, planSelect: widget.currentPlanId==null, nonGesture: false,),
          );
        }).toList().cast(),
      );
    }
    return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Recommended plans",
                      style: GoogleFonts.poppins(
                          fontSize: 22,
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