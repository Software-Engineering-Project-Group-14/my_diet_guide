import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_diet_guide/screens/change_plan.dart';
import 'package:my_diet_guide/screens/rate.dart';
import 'package:my_diet_guide/screens/record_progress_page.dart';
import 'package:my_diet_guide/screens/update_user_details.dart';
import 'package:my_diet_guide/screens/view_diet.dart';
import 'package:my_diet_guide/widgets/background_image.dart';
import 'package:my_diet_guide/widgets/blurred_background_image.dart';
import 'package:my_diet_guide/widgets/bottom_bar.dart';
import 'package:my_diet_guide/widgets/user_dash_body.dart';
import '../widgets/side_bar.dart';
import 'check_bmi.dart';

class UserDashboard extends StatefulWidget {

  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  const UserDashboard({Key? key, required this.firestore, required this.auth}) : super(key: key);

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {

  //final dietUser = widget.auth.currentUser;

  //late String user_id = dietUser!.uid;



  @override
  Widget build(BuildContext context) {
    String user_id = widget.auth.currentUser!.uid;
    return Scaffold(
      key: Key('user-dashboard'),
      backgroundColor: Colors.teal.shade900,
        appBar: AppBar(
          backgroundColor: Colors.teal.shade900,
          elevation: 0,
          // leading: MaterialButton(
          //   onPressed: () {
          //     FirebaseAuth.instance.signOut();
          //   },
          //   color: Colors.deepPurple,
          //   child: Text('sign out'),
          // ),
        ),
        drawer: NavigationDrawer(),

        body: Stack(
          children: [
            BlurredBackground(),
            UserDashBody(key: Key('user-dash-body'), user_id: user_id, firestore: widget.firestore, auth: widget.auth),
          ],
        ),

        bottomNavigationBar: BottomBar(key: Key('bottom-bar'),user_id: user_id, firestore: widget.firestore, auth: widget.auth),
    );
  }
}
