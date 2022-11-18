import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_diet_guide/screens/login.dart';
import 'package:my_diet_guide/screens/web_screens/add_diet_plan.dart';
import 'package:my_diet_guide/screens/web_screens/web_login.dart';
import 'package:my_diet_guide/widgets/side_bar.dart';

import '../../widgets/blurred_background_image.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade900,
      appBar: AppBar(
        backgroundColor: Colors.teal.shade900,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: (){
                FirebaseAuth.instance.signOut();
              },
              icon: Icon(FontAwesomeIcons.arrowRightFromBracket, color: Colors.white),
              tooltip: 'Log out',
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          BlurredBackground(),
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [

                  Center(
                    child: Text(
                      'My Diet Guide - Admin',
                      style: TextStyle(
                        fontSize: 60,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  SizedBox(height: 80,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: (){},
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 0),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(28),
                                  child: BackdropFilter(
                                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                      child: Container(
                                          width: 350,
                                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                  colors: [Colors.teal.shade800, Colors.teal.shade900],
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight
                                              ),
                                              borderRadius: BorderRadius.circular(28),
                                              border: Border.all(width: 2, color: Colors.white10)
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Add a new dish",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30
                                              ),
                                            ),
                                          )
                                      )
                                  )
                              ),
                            ),
                          ),


                          SizedBox(height: 85,),


                          GestureDetector(
                            onTap: (){},
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 0),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(28),
                                  child: BackdropFilter(
                                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                      child: Container(
                                          width: 350,
                                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                  colors: [Colors.teal.shade800, Colors.teal.shade900],
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight
                                              ),
                                              borderRadius: BorderRadius.circular(28),
                                              border: Border.all(width: 2, color: Colors.white10)
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Update a diet plan",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30
                                              ),
                                            ),
                                          )
                                      )
                                  )
                              ),
                            ),
                          ),
                        ],
                      ),



                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddDietPlan()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 0),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(28),
                                  child: BackdropFilter(
                                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                      child: Container(
                                          width: 350,
                                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                  colors: [Colors.teal.shade800, Colors.teal.shade900],
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight
                                              ),
                                              borderRadius: BorderRadius.circular(28),
                                              border: Border.all(width: 2, color: Colors.white10)
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Add a new diet plan",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30
                                              ),
                                            ),
                                          )
                                      )
                                  )
                              ),
                            ),
                          ),


                          SizedBox(height: 85,),


                          GestureDetector(
                            onTap: (){},
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 0),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(28),
                                  child: BackdropFilter(
                                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                      child: Container(
                                          width: 350,
                                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                  colors: [Colors.teal.shade800, Colors.teal.shade900],
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight
                                              ),
                                              borderRadius: BorderRadius.circular(28),
                                              border: Border.all(width: 2, color: Colors.white10)
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Delete a diet plan",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30
                                              ),
                                            ),
                                          )
                                      )
                                  )
                              ),
                            ),
                          ),
                        ],
                      ),


                    ],
                  ),


                  SizedBox(height: 50,),


                ],
              ),

            ),
          )
        ],
      ),
    );
  }
}
