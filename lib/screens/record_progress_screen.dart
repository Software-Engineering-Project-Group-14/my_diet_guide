import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:my_diet_guide/widgets/blurred_background_image.dart';
import 'package:my_diet_guide/widgets/bottom_bar.dart';
import 'package:my_diet_guide/widgets/side_bar.dart';

class RecordProgressScreen extends StatefulWidget {

  final String user_id;
  final String meal;
  final String dishName;
  final String dishImage;

  const RecordProgressScreen({Key? key, required this.user_id, required this.meal, required this.dishName, required this.dishImage}) : super(key: key);

  @override
  State<RecordProgressScreen> createState() => _RecordProgressScreenState();
}

class _RecordProgressScreenState extends State<RecordProgressScreen> {

  Future getMealDescription() async {
    return '';
  }


  @override
  Widget build(BuildContext context) {
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
                          child: Text("2022/09/27 - Tuesday", style: TextStyle(fontSize: 19, color: Colors.white,),),
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
                          child: Text(widget.dishName, style: TextStyle(color: Colors.white, fontSize: 19,),),
                        ),

                        SizedBox(height: 20,),

                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text("Description : ", style: TextStyle(color: Colors.white, fontSize: 16),),
                            ),
                            Container(
                              width: 220,
                              child: Text("dsi fvewi fvewqrp frnwq frwqnji vnfwqj vfnwq vfnwqj", style: TextStyle(color: Colors.white, fontSize: 16), textAlign: TextAlign.justify,),
                            )
                          ],
                        ),

                        SizedBox(height: 20,),

                        Divider(color: Colors.white , thickness: 2, indent: 20, endIndent: 20,),

                        SizedBox(height: 20,),

                        Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 120, bottom: 20),
                                child: Text("Record Your Progress", style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold)),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          GestureDetector(
                                            onTap: (){},
                                            child: Container(
                                              padding: EdgeInsets.only(bottom: 5),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(25),
                                                color: Colors.yellow.shade300,
                                              ),
                                              width: 25,
                                              height: 25,
                                            ),
                                          ),
                                          SizedBox(height: 10,),
                                          Text("Did not complete", style: TextStyle(color: Colors.white, fontSize: 15),)
                                        ],
                                      ),
                                      SizedBox(height: 30,),
                                      Column(
                                        children: [
                                          GestureDetector(
                                            onTap: (){},
                                            child: Container(
                                              padding: EdgeInsets.only(bottom: 5),
                                              width: 25,
                                              height: 25,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(25),
                                                color:Colors.lime.shade400,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10,),
                                          Text("Partially Completed", style: TextStyle(color: Colors.white, fontSize: 15),)
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Column(
                                        children: [
                                          GestureDetector(
                                            onTap: (){},
                                            child: Container(
                                              padding: EdgeInsets.only(bottom: 5),
                                              width: 25,
                                              height: 25,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(25),
                                                  color: Colors.green.shade300,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10,),
                                          Text("Completed", style: TextStyle(color: Colors.white, fontSize: 15),)
                                        ],
                                      ),
                                      SizedBox(height: 30,),
                                      Column(
                                        children: [
                                          GestureDetector(
                                            onTap: (){},
                                            child: Container(
                                              padding: EdgeInsets.only(bottom: 5),
                                              width: 25,
                                              height: 25,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(25),
                                                  color: Colors.red,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10,),
                                          Text("Over ate", style: TextStyle(color: Colors.white, fontSize: 15),)
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),



                        SizedBox(height: 40,),
                      ],
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
