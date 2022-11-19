import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_diet_guide/common/route_constants.dart';
import 'package:my_diet_guide/screens/view_diet_details.dart';

class WebViewDietCard extends StatelessWidget {

  final String day;
  final String user_id;
  const WebViewDietCard({Key? key, required this.day, required this.user_id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(45.0),
      child: GestureDetector(
          onTap: (){
            //Navigator.of(context).push(MaterialPageRoute(builder: (context) => DietDetails(user_id: user_id, day: day, firestore: firestore, auth: auth)));
            Navigator.pushNamed(context, RouteConstants.dietViewRoute,
                arguments: <String, String>{
                  'day':day,
                  'user_id':user_id
                }
            );
          },
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.white24, Colors.white10],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight
                      ),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Center(
                    child: Text(
                      "$day Diet Plan",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24
                      ),
                    ),
                  )
              ),
            ),
          )
      ),
    );
  }
}