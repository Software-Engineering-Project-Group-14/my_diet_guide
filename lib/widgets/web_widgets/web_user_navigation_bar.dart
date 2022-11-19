import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_diet_guide/screens/web_screens/web_user_profile.dart';
import '../../common/route_constants.dart';
import '../../screens/notifications.dart';
import '../../screens/web_screens/web_calendar_screen.dart';

class WebUserNavBar extends StatefulWidget implements PreferredSizeWidget{
  const WebUserNavBar({Key? key}) : super(key: key);

  @override
  State<WebUserNavBar> createState() => _WebUserNavBarState();

  @override
  Size get preferredSize => const Size.fromHeight(100);

}


class _WebUserNavBarState extends State<WebUserNavBar> {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: GestureDetector(
            child: Text("Home", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
            onTap: (){
              Navigator.pushNamed(context, RouteConstants.homeRoute);
            },
          ),

          // child: IconButton(
          //   onPressed: (){
          //     Navigator.pushNamed(context, RouteConstants.homeRoute);
          //   },
          //   icon: Icon(FontAwesomeIcons.house, color: Colors.white),
          //   tooltip: 'My Diet Guide - Home',
          // ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: GestureDetector(
            child: Text("Weekly Diet Plan", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
            onTap: (){
              Navigator.pushNamed(context, RouteConstants.planViewRoute);
            },
          ),
          // child: IconButton(
          //   onPressed: (){
          //     Navigator.pushNamed(context, RouteConstants.planViewRoute);
          //   },
          //   icon: Icon(FontAwesomeIcons.calendarWeek, color: Colors.white),
          //   tooltip: 'Weekly Diet Plan',
          // ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: GestureDetector(
            child: Text("Calendar", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WebDietCalender()));
            },
          ),
          // child: IconButton(
          //   onPressed: (){
          //     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WebDietCalender()));
          //   },
          //   icon: Icon(Icons.calendar_month, color: Colors.white),
          //   tooltip: 'Calendar',
          // ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: GestureDetector(
            child: Text("Change Diet Plan", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
            onTap: (){
              Navigator.pushNamed(context, RouteConstants.planSelectRoute);
            },
          ),
          // child: IconButton(
          //   onPressed: (){
          //     Navigator.pushNamed(context, RouteConstants.planSelectRoute);
          //   },
          //   icon: Icon(Icons.edit_calendar_outlined, color: Colors.white),
          //   tooltip: 'Change Diet Plan',
          // ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: GestureDetector(
            child: Text("Check BMI", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
            onTap: (){
              Navigator.pushNamed(context, RouteConstants.bmiCheckRoute);
            },
          ),
          // child: IconButton(
          //   onPressed: (){
          //     Navigator.pushNamed(context, RouteConstants.bmiCheckRoute);
          //   },
          //   icon: Icon(Icons.monitor_weight_outlined, color: Colors.white),
          //   tooltip: 'Check BMI',
          // ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: GestureDetector(
            child: Text("Rate My Diet Guide", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
            onTap: (){
              Navigator.pushNamed(context, RouteConstants.rateRoute);
            },
          ),
          // child: IconButton(
          //   onPressed: (){
          //     Navigator.pushNamed(context, RouteConstants.rateRoute);
          //   },
          //   icon: Icon(Icons.star_rate, color: Colors.white),
          //   tooltip: 'Rate My Diet Guide',
          // ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: GestureDetector(
            child: Text("User Profile", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
            onTap: (){
              //Navigator.pushNamed(context, RouteConstants.userDetailsViewRoute);
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WebUserProfile()));
            },
          ),
          // child: IconButton(
          //   onPressed: (){
          //     Navigator.pushNamed(context, RouteConstants.userDetailsViewRoute);
          //   },
          //   icon: Icon(FontAwesomeIcons.solidUser, color: Colors.white),
          //   tooltip: 'User Profile',
          // ),
        ),

        // Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 20),
        //   child: GestureDetector(
        //     child: Text("Notifications", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
        //     onTap: (){
        //       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Notifications()));
        //     },
        //   ),
        //   // child: IconButton(
        //   //   onPressed: (){
        //   //     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Notifications()));
        //   //   },
        //   //   icon: Icon(Icons.notifications, color: Colors.white),
        //   //   tooltip: 'Notifications',
        //   // ),
        // ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: GestureDetector(
            child: Text("Log out", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
            onTap: (){
              FirebaseAuth.instance.signOut();
            },
          ),
          // child: IconButton(
          //   onPressed: (){
          //     FirebaseAuth.instance.signOut();
          //   },
          //   icon: Icon(FontAwesomeIcons.arrowRightFromBracket, color: Colors.white),
          //   tooltip: 'Log out',
          // ),
        ),
      ],
    );
  }
}
