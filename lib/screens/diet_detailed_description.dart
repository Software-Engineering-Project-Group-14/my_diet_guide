import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_diet_guide/models/ProgressRecorder.dart';
import 'package:my_diet_guide/widgets/blurred_background_image.dart';
import 'package:my_diet_guide/widgets/bottom_bar.dart';
import 'package:my_diet_guide/widgets/side_bar.dart';

class DietDetailsDescription extends StatefulWidget {

  final String user_id;
  final String meal;
  final String dishName;
  final String dishImage;
  final String description;

  const DietDetailsDescription({Key? key, required this.user_id, required this.meal, required this.dishName, required this.dishImage, required this.description}) : super(key: key);

  @override
  State<DietDetailsDescription> createState() => _DietDetailsDescriptionState();
}

class _DietDetailsDescriptionState extends State<DietDetailsDescription> {

/*
  Future recordProgress(String user_id, ) async {

  }
*/

  @override
  Widget build(BuildContext context) {

    var today_day_int = DateTime.now().weekday;
    late String today_day;

    if(today_day_int==1){
      today_day='Monday';
    } else if(today_day_int==2){
      today_day='Tuesday';
    } else if(today_day_int==3){
      today_day='Wednesday';
    }else if(today_day_int==4){
      today_day='Thursday';
    }else if(today_day_int==5){
      today_day='Friday';
    }else if(today_day_int==6){
      today_day='Saturday';
    }else if(today_day_int==7){
      today_day='Sunday';
    }

    String month = DateTime.now().month.toString().padLeft(2, '0');
    String date = DateTime.now().day.toString().padLeft(2, '0');
    String today_date = '${DateTime.now().year}/$month/$date';

    return Scaffold(
      backgroundColor: Colors.teal.shade900,
      appBar: AppBar(
        backgroundColor: Colors.teal.shade900,
        elevation: 0,),
      drawer: NavigationDrawer(),

      body: Stack(
        children: [
          BlurredBackground(),

          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(28),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: Center(
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
                            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                            child: Text(widget.meal, style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                            child: Text("$today_date - $today_day", style: TextStyle(fontSize: 19, color: Colors.white,),),
                          ),

                          SizedBox(height: 30,),

                          Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: Image(
                                image: AssetImage(widget.dishImage),
                                fit: BoxFit.cover,
                                width: 200,
                                height: 200,
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(widget.dishName, style: TextStyle(color: Colors.white, fontSize: 19,), textAlign: TextAlign.center,),
                          ),

                          SizedBox(height: 20,),

                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child:
                              // Padding(
                              //   padding: const EdgeInsets.only(left: 20),
                              //   child: Text("Description : ", style: TextStyle(color: Colors.white, fontSize: 16),),
                              // ),
                              Container(
                                width: 220,
                                child: Text(widget.description, style: TextStyle(color: Colors.white, fontSize: 16), textAlign: TextAlign.justify,),
                              )
                          ),

                          SizedBox(height: 20,),

                          SizedBox(height: 40,),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomBar(user_id: widget.user_id),
    );
  }
}
