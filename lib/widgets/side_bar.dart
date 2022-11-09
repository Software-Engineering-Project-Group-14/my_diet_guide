import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_diet_guide/common/route_constants.dart';
import 'package:my_diet_guide/screens/change_plan.dart';
import 'package:my_diet_guide/screens/check_bmi.dart';
import 'package:my_diet_guide/screens/rate.dart';
import 'package:my_diet_guide/widgets/background_image.dart';
import 'package:my_diet_guide/widgets/blurred_background_image.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          BlurredBackground(),
          SingleChildScrollView(
            child: Column(
              children: [
                buildHeader(context),
                buildMenuItems(context),
              ],
            ),
          ),
        ],
      ),
    );
  }



  Widget buildHeader(BuildContext context){
    return Material(
      color: Colors.teal.shade900,
      child: InkWell(
        child: Container(
          padding: EdgeInsets.only(
              top: 24 + MediaQuery.of(context).padding.top,
              bottom: 24
          ),
          // child: Column(
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.symmetric(horizontal: 116),
          //       child: Text("Hello There"),
          //     )
          //   ],
          // ),
        ),
      ),
    );
  }



  Widget buildMenuItems(BuildContext context){
    return Container(
      padding: EdgeInsets.all(18),
      child: Column(
        children: [
          Wrap(
            runSpacing: 16,
            children: [
              // ListTile(
              //   leading: Icon(Icons.calendar_month, size: 30, color: Colors.white,),
              //   title: Text("Calender", style: TextStyle(fontSize: 19, color: Colors.white),),
              //   onTap: (){},
              // ),
              ListTile(
                leading: Icon(Icons.notifications, size: 30, color: Colors.white,),
                title: Text("Notifications", style: TextStyle(fontSize: 19, color: Colors.white,),),
                onTap: (){},
              ),
              ListTile(
                leading: Icon(Icons.edit_calendar_outlined, size: 30, color: Colors.white,),
                title: Text("Change Diet Plan", style: TextStyle(fontSize: 19, color: Colors.white,),),
                onTap: (){
                  //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChangePlan(firestore: FirebaseFirestore.instance, auth: FirebaseAuth.instance,)));
                  Navigator.pushNamed(context, RouteConstants.planChangeSubRoute);
                },
              ),
              ListTile(
                leading: Icon(Icons.monitor_weight_outlined, size: 30, color: Colors.white,),
                title: Text("Check BMI", style: TextStyle(fontSize: 19, color: Colors.white,),),
                onTap: (){
                  //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CheckBMI()));
                  Navigator.pushNamed(context, RouteConstants.bmiCheckRoute);
                },
              ),
              ListTile(
                leading: Icon(Icons.star_rate, size: 30, color: Colors.white,),
                title: Text("Rate My Diet Guide", style: TextStyle(fontSize: 19, color: Colors.white,),),
                onTap: (){
                  Navigator.pushNamed(context, RouteConstants.rateRoute);
                  //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Rate(firestore: FirebaseFirestore.instance, auth: FirebaseAuth.instance,)));
                },
              ),
              // ListTile(
              //   leading: Icon(Icons.reviews, size: 30, color: Colors.white,),
              //   title: Text("View Ratings and Reviews", style: TextStyle(fontSize: 19, color: Colors.white,),),
              //   onTap: (){
              //
              //   },
              // ),
              Divider(color: Colors.white , thickness: 2),
              ListTile(
                leading: Icon(FontAwesomeIcons.arrowRightFromBracket, color: Colors.white,),
                title: Text("Log Out", style: TextStyle(fontSize: 19, color: Colors.white),),
                onTap: (){
                  FirebaseAuth.instance.signOut();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }


}
