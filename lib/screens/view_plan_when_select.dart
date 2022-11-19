import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_diet_guide/models/DietPlan.dart';

import '../common/route_constants.dart';
import '../controllers/Controller.dart';
import '../widgets/blurred_background_image.dart';
import '../widgets/bottom_bar.dart';

class ViewPlanSelect extends StatefulWidget {

  final DietPlanModel dietPlanModel;

  const ViewPlanSelect({Key? key, required this.dietPlanModel}) : super(key: key);

  @override
  State<ViewPlanSelect> createState() => _ViewPlanSelectState();
}

class _ViewPlanSelectState extends State<ViewPlanSelect> {

  final List<String> l = ['Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'];

  List<Widget> dayAreaList(){
    List<Widget> dayWidgets = [];
    l.forEach((day) {
      return dayWidgets.add(
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, RouteConstants.dietViewSelectRoute,
                      arguments: <String, String>{
                        'day':day,
                        'breakfast_id':widget.dietPlanModel.breakfast_id,
                        'lunch_id':widget.dietPlanModel.lunch_id,
                        'dinner_id':widget.dietPlanModel.dinner_id,
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
                          child: Text(day,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                            ),
                          ),
                        )
                    ),
                  ),
                )
            ),
          )
      );
    });
    return dayWidgets;
  }

  Widget viewBiometrics(){

    return Column(
      children:
      [
        Row(
          children: [
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
              child: Center(
                child: Text('Selected Diet Plan',
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
              child: Text('Dietary preference : ${widget.dietPlanModel.dietary_preference}',
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
              child: Text('Intensity : ${widget.dietPlanModel.intensity}',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold, color: Colors.white.withOpacity(0.8)
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 20),
      ],
    );
  }




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      minimum: EdgeInsets.only(top: 20),
      child: Scaffold(
        // extendBodyBehindAppBar: true,
        backgroundColor: Colors.teal.shade900,
        // appBar: AppBar(
        //   backgroundColor: Colors.teal.shade900,
        //   elevation: 0,
        // ),

        body: Stack(
            children: [
              BlurredBackground(),

              SingleChildScrollView(
                child: Column(
                  children: [
                    viewBiometrics(),
                    ...dayAreaList()
                  ],
                ),

              ),]
        ),
        bottomNavigationBar: BottomBar(key: Key('bottom-bar'),user_id: Controller.auth!.currentUser!.uid),
      ),
    );
  }
}