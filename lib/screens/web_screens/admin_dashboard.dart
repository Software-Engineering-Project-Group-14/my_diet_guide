import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_diet_guide/common/route_constants.dart';
import 'package:my_diet_guide/screens/login.dart';
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

                  SizedBox(height: 60,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 150),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(28),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 100),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.white24, Colors.white10],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight
                              ),
                              borderRadius: BorderRadius.circular(28),
                              border: Border.all(width: 2, color: Colors.white10)
                          ),
                          child:
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 40),
                                    child: GestureDetector(
                                      onTap: () async {
                                        Navigator.pushNamed(context, RouteConstants.planAddRoute);
                                      },
                                      child: Center(
                                        child: Container(
                                          width: 250,
                                          padding: const EdgeInsets.all(20),
                                          decoration: BoxDecoration(
                                            color: Colors.teal.shade900,
                                            borderRadius: BorderRadius.circular(28),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              'Add a new diet plan',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight:FontWeight.bold,
                                                fontSize: 28,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),


                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 40),
                                    child: GestureDetector(
                                      onTap: () async {
                                        Navigator.pushNamed(context, RouteConstants.planUpdateRoute);
                                      },
                                      child: Center(
                                        child: Container(
                                          width: 250,
                                          padding: const EdgeInsets.all(20),
                                          decoration: BoxDecoration(
                                            color: Colors.teal.shade900,
                                            borderRadius: BorderRadius.circular(28),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              'Update a diet plan',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight:FontWeight.bold,
                                                fontSize: 28,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),


                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 40),
                                    child: GestureDetector(
                                      onTap: () async {},
                                      child: Center(
                                        child: Container(
                                          width: 250,
                                          padding: const EdgeInsets.all(20),
                                          decoration: BoxDecoration(
                                            color: Colors.teal.shade900,
                                            borderRadius: BorderRadius.circular(28),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              'Delete a diet plan',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight:FontWeight.bold,
                                                fontSize: 28,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                        )
                      )
                    ),
                  ),


                  SizedBox(height: 100,),


                ],
              ),

            ),
          )
        ],
      ),
    );
  }
}
