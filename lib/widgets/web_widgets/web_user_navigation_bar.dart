import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../common/route_constants.dart';
import '../../screens/calenderScreen.dart';
import '../../screens/notifications.dart';

class WebUserNavBar extends StatelessWidget implements PreferredSizeWidget{
  const WebUserNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 0, left: 0),
                    child: IconButton(
                      onPressed: (){
                        Navigator.pushNamed(context, RouteConstants.homeRoute);
                      },
                      icon: Icon(FontAwesomeIcons.house, color: Colors.white),
                      tooltip: 'My Diet Guide - Home',
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(right: 0, left: 0),
                    child: IconButton(
                      onPressed: (){
                        Navigator.pushNamed(context, RouteConstants.planViewRoute);
                      },
                      icon: Icon(FontAwesomeIcons.calendarWeek, color: Colors.white),
                      tooltip: 'Weekly Diet Plan',
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(right: 0),
                    child: IconButton(
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DietCalender()));
                      },
                      icon: Icon(Icons.calendar_month, color: Colors.white),
                      tooltip: 'Calendar',
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(right: 0, left: 0),
                    child: IconButton(
                      onPressed: (){
                        Navigator.pushNamed(context, RouteConstants.planSelectRoute);
                      },
                      icon: Icon(Icons.edit_calendar_outlined, color: Colors.white),
                      tooltip: 'Change Diet Plan',
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(right: 0, left: 0),
                    child: IconButton(
                      onPressed: (){
                        Navigator.pushNamed(context, RouteConstants.bmiCheckRoute);
                      },
                      icon: Icon(Icons.monitor_weight_outlined, color: Colors.white),
                      tooltip: 'Check BMI',
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(right: 0, left: 0),
                    child: IconButton(
                      onPressed: (){
                        Navigator.pushNamed(context, RouteConstants.rateRoute);
                      },
                      icon: Icon(Icons.star_rate, color: Colors.white),
                      tooltip: 'Rate My Diet Guide',
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(right: 0, left: 0),
                    child: IconButton(
                      onPressed: (){
                        Navigator.pushNamed(context, RouteConstants.userDetailsViewRoute);
                      },
                      icon: Icon(FontAwesomeIcons.solidUser, color: Colors.white),
                      tooltip: 'User Profile',
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(right: 0, left: 0),
                    child: IconButton(
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Notifications()));
                      },
                      icon: Icon(Icons.notifications, color: Colors.white),
                      tooltip: 'Notifications',
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(right: 0, left: 0),
                    child: IconButton(
                      onPressed: (){
                        FirebaseAuth.instance.signOut();
                      },
                      icon: Icon(FontAwesomeIcons.arrowRightFromBracket, color: Colors.white),
                      tooltip: 'Log out',
                    ),
                  ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
