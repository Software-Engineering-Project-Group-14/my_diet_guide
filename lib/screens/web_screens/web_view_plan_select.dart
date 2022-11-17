import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_diet_guide/common/image_path_constants.dart';
import 'package:my_diet_guide/screens/web_screens/web_view_diet_day_when_select.dart';
import 'package:my_diet_guide/widgets/blurred_background_image.dart';
import 'package:my_diet_guide/widgets/bottom_bar.dart';

import '../../controllers/Controller.dart';
import '../../models/Dish.dart';


class WebViewPlanWhenSelect extends StatefulWidget {

  final Map<String, Map<String, Dish?>> dietDetails;

  const WebViewPlanWhenSelect({Key? key, required this.dietDetails, }) : super(key: key);

  @override
  State<WebViewPlanWhenSelect> createState() => _WebViewPlanWhenSelectState();
}

class _WebViewPlanWhenSelectState extends State<WebViewPlanWhenSelect> {

  List<Widget> getWidgetList(){
    List<Widget> l =[];
    List<String> days = ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"];
    days.forEach((day) {
      l.add(Column(
        children: [
          Text(
            day[0].toUpperCase()+day.substring(1),
            style: TextStyle(
              color: Colors.white,
              fontSize: 45
            ),
          ),
          WebViewDietWhenSelect(
              dishBreakfast: widget.dietDetails[day]!['breakfast']!,
              dishLunch: widget.dietDetails[day]!['lunch']!,
              dishDinner: widget.dietDetails[day]!['dinner']!,
              day: day
          ),
        ],
      ));
    });
    return l;
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.teal.shade900,
      appBar: AppBar(
        backgroundColor: Colors.teal.shade900,
        elevation: 0,),

      body: Stack(
        children: [
          BlurredBackground(),

         // SingleChildScrollView(
          //  child:
        SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                    children: getWidgetList().sublist(0,4),

                  ),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.center,
                    children: getWidgetList().sublist(4),
                  )
                ],
              )

            ),
          //  ),
        ],
      ),

    );
  }
}