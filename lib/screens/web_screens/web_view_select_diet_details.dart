import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_diet_guide/screens/web_screens/web_admin_nav_bar.dart';
import 'package:my_diet_guide/widgets/blurred_background_image.dart';
import 'package:my_diet_guide/widgets/web_widgets/web_select_diet_details_card.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/Controller.dart';
import '../../models/Dish.dart';
import '../../widgets/bottom_bar.dart';
import '../../widgets/side_bar.dart';

class WebViewDietWhenSelect extends StatefulWidget {

  final String day;
  final Dish dishBreakfast;
  final Dish dishLunch;
  final Dish dishDinner;
  const WebViewDietWhenSelect({Key? key, required this.day, required this.dishBreakfast, required this.dishLunch, required this.dishDinner}) : super(key: key);

  @override
  State<WebViewDietWhenSelect> createState() => _WebViewDietWhenSelectState();
}

class _WebViewDietWhenSelectState extends State<WebViewDietWhenSelect> {

  late String day = widget.day;

  Widget buildMeals(){

    String month = DateTime.now().month.toString().padLeft(2, '0');
    String date = DateTime.now().day.toString().padLeft(2, '0');
    String today = '${DateTime.now().year}/$month/$date';

    return ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 25.w,
              height: 600,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.white24, Colors.white10],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight
                  ),
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(width: 2, color: Colors.white10)
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15, right: 125),
                      // child: Text("$today - $today_day", style: TextStyle(fontSize: 19, color: Colors.white,),),
                    ),


                    WebSelectDietDetailsCard(
                      meal: 'Breakfast',
                      dish: widget.dishBreakfast,
                    )
                  ],
                ),
              ),
            ),

            SizedBox(width: 5.w,),

            Container(
              width: 25.w,
              height: 600,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.white24, Colors.white10],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight
                  ),
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(width: 2, color: Colors.white10)
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15, right: 125),
                      // child: Text("$today - $today_day", style: TextStyle(fontSize: 19, color: Colors.white,),),
                    ),

                    WebSelectDietDetailsCard(
                      meal: 'Lunch',
                      dish: widget.dishLunch,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(width: 5.w,),

            Container(
              width: 25.w,
              height: 600,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.white24, Colors.white10],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight
                  ),
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(width: 2, color: Colors.white10)
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15, right: 125),
                      // child: Text("$today - $today_day", style: TextStyle(fontSize: 19, color: Colors.white,),),
                    ),

              WebSelectDietDetailsCard(
                meal: 'Dinner',
                dish: widget.dishDinner,
              )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.teal.shade900,

      appBar: WebAdminNavBar(),

      body: Stack(
        children: [

          BlurredBackground(),

          SingleChildScrollView(
            child: Center(
              child: Column(
                children: [

                  SizedBox(height: 15,),

                  //current days diet plan
                  Container(
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5,),
                          child: Text(
                            day+"'s Diet Plan",
                            style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold, color: Colors.white.withOpacity(0.8)),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 15,),


                  buildMeals(),


                  SizedBox(height: 50,),
                ],
              ),
            ),
          )

        ],
      ),

      bottomNavigationBar: BottomBar(user_id: Controller.auth!.currentUser!.uid),
    );
  }
}

