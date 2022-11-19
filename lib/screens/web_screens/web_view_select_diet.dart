
import 'package:flutter/material.dart';
import 'package:my_diet_guide/widgets/web_widgets/web_user_navigation_bar.dart';
import 'package:my_diet_guide/widgets/web_widgets/web_view_select_diet_card.dart';

import '../../models/DietPlan.dart';
import '../../models/ViewDiet.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/web_widgets/web_blurred_backgound.dart';
import '../../widgets/web_widgets/web_view_diet_card.dart';

class WebViewPlanSelect extends StatefulWidget {

  final DietPlanModel dietPlanModel;

  const WebViewPlanSelect({Key? key, required this.dietPlanModel, }) : super(key: key);

  @override
  State<WebViewPlanSelect> createState() => _WebViewPlanSelectState();
}

class _WebViewPlanSelectState extends State<WebViewPlanSelect> {

  Widget viewPlan(){

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 10),
              child: Center(
                child: Text('Weekly Diet Plan for Plan ${widget.dietPlanModel.planId}',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Text('Dietary preference : ${widget.dietPlanModel.dietary_preference}',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold, color: Colors.white.withOpacity(0.8)

                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 5),

        Row(
          children: [
            //monday
            Container(
                height: 30.h,
                width: 25.w,
                child: WebViewSelectDietCard(day: 'Monday', dietPlanModel: widget.dietPlanModel, )),
            //tuesday
            Container(
                height: 30.h,
                width: 25.w,
                child: WebViewSelectDietCard(day: 'Tuesday', dietPlanModel: widget.dietPlanModel,)),
            //wednesday
            Container(
                height: 30.h,
                width: 25.w,
                child: WebViewSelectDietCard(day: 'Wednesday', dietPlanModel: widget.dietPlanModel,)),
            //thursday
            Container(
                height: 30.h,
                width: 25.w,
                child: WebViewSelectDietCard(day: 'Thursday',dietPlanModel: widget.dietPlanModel,)),
          ],
        ),
        Row(
          children: [
            SizedBox(width: 15.w,),
            //Friday
            Container(
                height: 30.h,
                width: 25.w,
                child: WebViewSelectDietCard(day: 'Friday', dietPlanModel: widget.dietPlanModel,)),
            //saturday
            Container(
                height: 30.h,
                width: 25.w,
                child: WebViewSelectDietCard(day: 'Saturday', dietPlanModel: widget.dietPlanModel,)),
            //sunday
            Container(
                height: 30.h,
                width: 25.w,
                child: WebViewSelectDietCard(day: 'Sunday' ,dietPlanModel: widget.dietPlanModel,)),
          ],
        ),
        SizedBox(height: 50,),


      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    return Stack(
        children: [

          Scaffold(
            // extendBodyBehindAppBar: true,
            backgroundColor: Colors.teal.shade900,
            appBar: WebUserNavBar(),

            body: Stack(
                children: [
                  WebBlurredBackground(),
                  SafeArea(
                    child: SingleChildScrollView(
                      child: viewPlan()
                    ),
                  ),]
            ),
          ),
        ]
    );
  }
}
