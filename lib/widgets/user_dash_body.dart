import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:my_diet_guide/screens/record_progress_screen.dart';
import 'package:my_diet_guide/widgets/today_meal_card.dart';
import 'package:my_diet_guide/widgets/user_dash_header.dart';

class UserDashBody extends StatelessWidget {

  final String user_id;

  const UserDashBody({Key? key, required this.user_id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;   // total height and width of the screen
    return SingleChildScrollView(
      child: Column(
        children: [

          Header(size: size),


          Container(
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5,),
                  child: Text(
                    "Today's Diet Plan",
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold, color: Colors.white.withOpacity(0.8)),
                  ),
                ),
              ],
            ),
          ),


          SizedBox(height: 15,),


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


                    MealCard(title: "Breakfast", mealName: "Oatmeal with banana", imageLocation: 'assets/images/dishes/smoothie01.jpg', navigate: RecordProgressScreen(meal: 'Breakfast', dishImage: 'assets/images/dishes/smoothie01.jpg', dishName: 'Oatmeal with banana', user_id: user_id)),


                    SizedBox(height: 15,),

                    Divider(color: Colors.white , thickness: 2, indent: 20, endIndent: 20,),

                    SizedBox(height: 15,),


                    MealCard(title: "Lunch", mealName: "Oatmeal with banana", imageLocation: 'assets/images/dishes/smoothie01.jpg', navigate: RecordProgressScreen(meal: 'Lunch', dishImage: 'assets/images/dishes/smoothie01.jpg', dishName: 'Oatmeal with banana', user_id:user_id),),


                    SizedBox(height: 15,),

                    Divider(color: Colors.white , thickness: 2, indent: 20, endIndent: 20,),

                    SizedBox(height: 15,),


                    MealCard(title: "Dinner", mealName: "Oatmeal with banana", imageLocation: 'assets/images/dishes/smoothie01.jpg', navigate: RecordProgressScreen(meal: 'Dinner', dishImage: 'assets/images/dishes/smoothie01.jpg', dishName: 'Oatmeal with banana', user_id: user_id,),),


                    SizedBox(height: 30,),
                  ],
                ),
              ),
            ),
          ),


          SizedBox(height: 50,),


        ],
      ),
    );
  }
}







