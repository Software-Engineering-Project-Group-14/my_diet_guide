import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_diet_guide/screens/record_progress_screen.dart';
import 'package:my_diet_guide/widgets/blurred_background_image.dart';

import '../widgets/bottom_bar.dart';
import '../widgets/today_meal_card.dart';

class DietDetails extends StatefulWidget {
  final String user_id;
  const DietDetails({Key? key, required this.user_id}) : super(key: key);

  @override
  State<DietDetails> createState() => _DietDetailsState();
}

class _DietDetailsState extends State<DietDetails> {
  @override
  Widget build(BuildContext context) {
    String user_id = widget.user_id;
    return Stack(
      children:[
        // BlurredBackground(),
        Scaffold(
          // extendBodyBehindAppBar: true,
          // backgroundColor: Colors.transparent,
          backgroundColor: Colors.teal.shade900,
          appBar: AppBar(
            backgroundColor: Colors.teal.shade900,
            title: Text('Diet Details'),
            elevation: 0,
          ),
        body: Stack(
          children: [
            BlurredBackground(),
            SafeArea(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 10,),

                        ClipRRect(
                          borderRadius: BorderRadius.circular(28),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              width: 360,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [Colors.white24, Colors.white10],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight
                                  ),
                                  borderRadius: BorderRadius.circular(28),
                                  border: Border.all(width: 2, color: Colors.white10)
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15, right: 125),
                                    child: Text("2022/09/27 - Tuesday", style: TextStyle(fontSize: 19, color: Colors.white,),),
                                  ),

                                  Divider(color: Colors.white , thickness: 2, indent: 20, endIndent: 20,),


                                  SizedBox(height: 20,),


                                  MealCard(title: "Breakfast", mealName: "Oatmeal with banana", imageLocation: 'assets/images/dishes/smoothie01.jpg', navigate: RecordProgressScreen(meal: 'Breakfast', dishImage: 'assets/images/dishes/smoothie01.jpg', dishName: 'Oatmeal with banana', user_id: user_id, description: '',)),


                                  SizedBox(height: 15,),

                                  Divider(color: Colors.white , thickness: 2, indent: 20, endIndent: 20,),

                                  SizedBox(height: 15,),


                                  MealCard(title: "Lunch", mealName: "Oatmeal with banana", imageLocation: 'assets/images/dishes/smoothie01.jpg', navigate: RecordProgressScreen(meal: 'Lunch', dishImage: 'assets/images/dishes/smoothie01.jpg', dishName: 'Oatmeal with banana', user_id:user_id, description: '',),),


                                  SizedBox(height: 15,),

                                  Divider(color: Colors.white , thickness: 2, indent: 20, endIndent: 20,),

                                  SizedBox(height: 15,),


                                  MealCard(title: "Dinner", mealName: "Oatmeal with banana", imageLocation: 'assets/images/dishes/smoothie01.jpg', navigate: RecordProgressScreen(meal: 'Dinner', dishImage: 'assets/images/dishes/smoothie01.jpg', dishName: 'Oatmeal with banana', user_id: user_id, description: '',),),


                                  SizedBox(height: 30,),
                                ],
                              ),
                            ),
                          ),
                        ),



                      ],
                  ),
                ),
              ),
            ),
          ],
        ),
          bottomNavigationBar: BottomBar(user_id: widget.user_id),
      ),
      ]
    );
  }
}
