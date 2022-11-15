import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_diet_guide/common/image_path_constants.dart';
import 'package:my_diet_guide/widgets/blurred_background_image.dart';
import 'package:my_diet_guide/widgets/bottom_bar.dart';

import '../controllers/Controller.dart';
import '../models/Dish.dart';

class ViewDietWhenSelect extends StatefulWidget {

  final Dish dishBreakfast ;
  final Dish dishLunch ;
  final Dish dishDinner ;
  final String day;

  const ViewDietWhenSelect({Key? key, required this.dishBreakfast, required this.dishLunch, required this.dishDinner, required this.day}) : super(key: key);

  @override
  State<ViewDietWhenSelect> createState() => _ViewDietWhenSelectState();
}

class _ViewDietWhenSelectState extends State<ViewDietWhenSelect> {

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      top: true,
      minimum: EdgeInsets.only(top: 20),
      child: Scaffold(
        backgroundColor: Colors.teal.shade900,
        appBar: AppBar(
          title: Text('${widget.day} Diets'),
          backgroundColor: Colors.teal.shade900,
          elevation: 0,),

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
                            child: Text('Breakfast', style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),),
                          ),
                          SizedBox(height: 30,),
                          Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: Image(
                                image: AssetImage("${ImagePathConstants.prefix}/dishes/${widget.dishBreakfast.dietary_preference}/Breakfast/${widget.dishBreakfast.name}${ImagePathConstants.suffix}"),
                                fit: BoxFit.cover,
                                width: 200,
                                height: 200,
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(widget.dishBreakfast.name, style: TextStyle(color: Colors.white, fontSize: 19,),),
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
                                child: Text(widget.dishBreakfast.description, style: TextStyle(color: Colors.white, fontSize: 16), textAlign: TextAlign.justify,),
                              )
                          ),

                          SizedBox(height: 20,),

                          Divider(color: Colors.white , thickness: 2, indent: 20, endIndent: 20,),

                          SizedBox(height: 20,),

                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                            child: Text('Lunch', style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),),
                          ),
                          SizedBox(height: 30,),
                          Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: Image(
                                image: AssetImage("${ImagePathConstants.prefix}/dishes/${widget.dishLunch.dietary_preference}/Lunch/${widget.dishLunch.name}${ImagePathConstants.suffix}"),
                                fit: BoxFit.cover,
                                width: 200,
                                height: 200,
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(widget.dishLunch.name, style: TextStyle(color: Colors.white, fontSize: 19,),),
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
                                child: Text(widget.dishLunch.description, style: TextStyle(color: Colors.white, fontSize: 16), textAlign: TextAlign.justify,),
                              )
                          ),
                          SizedBox(height: 20,),

                          Divider(color: Colors.white , thickness: 2, indent: 20, endIndent: 20,),

                          SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                            child: Text('Dinner', style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),),
                          ),
                          SizedBox(height: 30,),
                          Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: Image(
                                image: AssetImage("${ImagePathConstants.prefix}/dishes/${widget.dishDinner.dietary_preference}/Dinner/${widget.dishDinner.name}${ImagePathConstants.suffix}"),
                                fit: BoxFit.cover,
                                width: 200,
                                height: 200,
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(widget.dishDinner.name, style: TextStyle(color: Colors.white, fontSize: 19,),),
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
                                child: Text(widget.dishDinner.description, style: TextStyle(color: Colors.white, fontSize: 16), textAlign: TextAlign.justify,),
                              )
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
        bottomNavigationBar: BottomBar(key: Key('bottom-bar'),user_id: Controller.auth!.currentUser!.uid),
      ),
    );
  }
}