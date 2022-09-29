import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_diet_guide/screens/calenderScreen.dart';
import 'package:my_diet_guide/screens/user_dashboard.dart';
import 'package:my_diet_guide/screens/user_profile.dart';
import 'package:my_diet_guide/screens/view_diet.dart';

class BottomBar extends StatelessWidget {

  final String user_id;

  const BottomBar({Key? key, required this.user_id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -20),
              blurRadius: 35,
              color: Colors.teal.shade900.withOpacity(0.3),
            )
          ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(
              FontAwesomeIcons.house,
              color: Colors.white,
            ),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserDashboard()));
            },
          ),
          IconButton(
            icon: Icon(
              FontAwesomeIcons.calendarWeek,
              color: Colors.white,
            ),
            onPressed: (){
             // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewDietPlan()));
            },
          ),
          IconButton(
            icon: Icon(
              FontAwesomeIcons.solidUser,
              color: Colors.white,
            ),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserProfile(user_id: user_id,)));
            },
          ),
        ],
      ),
    );
  }
}
