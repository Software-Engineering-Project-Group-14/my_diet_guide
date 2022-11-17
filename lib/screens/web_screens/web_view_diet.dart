import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../models/ViewDiet.dart';
import '../../widgets/blurred_background_image.dart';
import '../../widgets/bottom_bar.dart';
import '../../widgets/view_diet_card.dart';
import 'package:sizer/sizer.dart';

class WebViewDietPlan extends StatefulWidget {

  final String user_id;

  const WebViewDietPlan({Key? key, required this.user_id}) : super(key: key);

  @override
  State<WebViewDietPlan> createState() => _WebViewDietPlanState();
}

class _WebViewDietPlanState extends State<WebViewDietPlan> {

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
          children: [
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
              child: Center(
                child: Text('Weekly Diet Plan',
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold, color: Colors.white.withOpacity(0.8)),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20,),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
              child: Text('Dietary preference : $dietary_preference',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold, color: Colors.white.withOpacity(0.8)

                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
              child: Text('Intensity : $intensity',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold, color: Colors.white.withOpacity(0.8)
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
              child: Text('Activeness : $activeness',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold, color: Colors.white.withOpacity(0.8)

                ),
              ),
            ),
          ],
        ),


        SizedBox(height: 20),

        Row(
          children: [
            //monday
            Container(
                height: 30.h,
                width: 25.w,
                child: ViewDietCard(day: 'Monday', user_id: widget.user_id)),
            //tuesday
            Container(
                height: 30.h,
                width: 25.w,
                child: ViewDietCard(day: 'Tuesday', user_id: widget.user_id,)),
            //wednesday
            Container(
                height: 30.h,
                width: 25.w,
                child: ViewDietCard(day: 'Wednesday', user_id: widget.user_id,)),
            //thursday
            Container(
                height: 30.h,
                width: 25.w,
                child: ViewDietCard(day: 'Thursday', user_id: widget.user_id,)),
          ],
        ),
        Row(
          children: [
            SizedBox(width: 15.w,),
            //Friday
            Container(
                height: 30.h,
                width: 25.w,
                child: ViewDietCard(day: 'Friday', user_id: widget.user_id, )),
            //saturday
            Container(
                height: 30.h,
                width: 25.w,
                child: ViewDietCard(day: 'Saturday', user_id: widget.user_id,)),
            //sunday
            Container(
                height: 30.h,
                width: 25.w,
                child: ViewDietCard(day: 'Sunday' , user_id: widget.user_id,)),
          ],
        ),
        SizedBox(height: 20,),


      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    ViewDiet viewDiet = ViewDiet(user_id: widget.user_id);
    return Stack(
        children: [

          Scaffold(
            // extendBodyBehindAppBar: true,
            backgroundColor: Colors.teal.shade900,
            appBar: AppBar(
              backgroundColor: Colors.teal.shade900,
              title: Text('View Diet Plan'),
              elevation: 0,
            ),

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
        ]
    );
  }
}
