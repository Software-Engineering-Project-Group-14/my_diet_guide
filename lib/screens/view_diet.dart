import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:my_diet_guide/screens/view_diet_details.dart';
import 'package:my_diet_guide/widgets/view_diet_card.dart';

import '../controllers/Controller.dart';
import '../models/ViewDiet.dart';
import '../widgets/blurred_background_image.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/side_bar.dart';

class ViewDietPlan extends StatefulWidget {

  final String user_id;

  const ViewDietPlan({Key? key, required this.user_id}) : super(key: key);



  @override
  State<ViewDietPlan> createState() => _ViewDietPlanState();
}

class _ViewDietPlanState extends State<ViewDietPlan> {

  late String dietary_preference;
  late String intensity;
  late String activeness;


  Widget viewBiometrics(Map<String, dynamic> map){

    dietary_preference = map['dietary_preference'];
    activeness = map['activeness'];
    intensity = map['intensity'];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 5),
              child: Center(
                child: Text('Weekly Diet Plan',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20,),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 5, 0, 0),
              child: Text('Dietary preference : $dietary_preference',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold, color: Colors.white.withOpacity(0.8)

                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 5, 0, 0),
              child: Text('Intensity : $intensity',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold, color: Colors.white.withOpacity(0.8)
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 5, 0, 0),
              child: Text('Activeness : $activeness',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold, color: Colors.white.withOpacity(0.8)

                ),
              ),
            ),
          ],
        ),


        SizedBox(height: 10),
        //monday
        ViewDietCard(day: 'Monday', user_id: widget.user_id),

        //tuesday
        ViewDietCard(day: 'Tuesday', user_id: widget.user_id,),

        //wednesday
        ViewDietCard(day: 'Wednesday', user_id: widget.user_id,),

        //thursday
        ViewDietCard(day: 'Thursday', user_id: widget.user_id,),

        //Friday
        ViewDietCard(day: 'Friday', user_id: widget.user_id, ),

        //saturday
        ViewDietCard(day: 'Saturday', user_id: widget.user_id,),

        //sunday
        ViewDietCard(day: 'Sunday' , user_id: widget.user_id,),
        SizedBox(height: 30,),


      ],
    );
  }




  @override
  Widget build(BuildContext context) {
    ViewDiet viewDiet = ViewDiet(user_id: widget.user_id);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal.shade900,
        appBar: AppBar(
          backgroundColor: Colors.teal.shade900,
          elevation: 0,
        ),

        drawer: NavigationDrawer(),

        body: Stack(
          children: [
            BlurredBackground(),
            SafeArea(
            child: SingleChildScrollView(
              child: FutureBuilder<Map<String, dynamic>>(
                future: viewDiet.getInfo(),
                  builder: (context, snapshot){
                    if(snapshot.hasData){
                      final map = snapshot.data;
                      return map==null ? Center(child: Text("No User!"),) : viewBiometrics(map!);
                    } else if (snapshot.hasError){
                      return Text('Something went wrong!');
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }
              ),
            ),
          ),]
        ),
        bottomNavigationBar: BottomBar(user_id: widget.user_id,),
        ),
    );
  }
}
