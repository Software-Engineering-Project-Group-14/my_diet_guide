
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_diet_guide/common/route_constants.dart';


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
              //Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserDashboard(firestore: firestore, auth: auth,)));
              Navigator.pushNamed(context, RouteConstants.homeRoute);
            },
          ),
          IconButton(
            icon: Icon(
              FontAwesomeIcons.calendarWeek,
              color: Colors.white,
            ),
            onPressed: (){
              //Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewDietPlan(user_id: user_id, firestore: firestore, auth: auth)));
              Navigator.pushNamed(context, RouteConstants.planViewRoute);
              },
          ),
          IconButton(
            key: Key('user-profile-btn'),
            icon: Icon(
              FontAwesomeIcons.solidUser,
              color: Colors.white,
            ),
            onPressed: (){
              Navigator.pushNamed(context, RouteConstants.userDetailsViewRoute);
              //Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserProfile(firestore: firestore, auth: auth)));
            },
          ),
        ],
      ),
    );
  }
}
