import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_diet_guide/widgets/user_dash_header.dart';

class UserDashBody extends StatelessWidget {
  const UserDashBody({Key? key}) : super(key: key);

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


                    SizedBox(height: 20,),



                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 125),
                                child: Text("Breakfast", style: TextStyle(fontSize: 19, color: Colors.white),),
                              ),
                              SizedBox(height: 20,),
                              Text("Meal : Oatmeal with banana", style: TextStyle(color: Colors.white, fontSize: 16),),
                            ],
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image(
                              image: AssetImage('assets/images/dishes/smoothie01.jpg'),
                              fit: BoxFit.cover,
                              width: 100,
                              height: 100,
                            ),
                          )
                        ],
                      ),
                    ),



                    SizedBox(height: 30,),



                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 125),
                                child: Text("Breakfast", style: TextStyle(fontSize: 19, color: Colors.white),),
                              ),
                              SizedBox(height: 20,),
                              Text("Meal : Oatmeal with banana", style: TextStyle(color: Colors.white, fontSize: 16),),
                            ],
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image(
                              image: AssetImage('assets/images/dishes/smoothie01.jpg'),
                              fit: BoxFit.cover,
                              width: 100,
                              height: 100,
                            ),
                          )
                        ],
                      ),
                    ),



                    SizedBox(height: 30,),



                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}







