import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_diet_guide/widgets/blurred_background_image.dart';
import 'package:my_diet_guide/widgets/bottom_bar.dart';
import 'package:my_diet_guide/widgets/user_dash_body.dart';
import '../controllers/Controller.dart';
import '../widgets/side_bar.dart';

class UserDashboard extends StatefulWidget {

  const UserDashboard({Key? key}) : super(key: key);

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {

  //final dietUser = widget.auth.currentUser;

  //late String user_id = dietUser!.uid;



  @override
  Widget build(BuildContext context) {
    String user_id = Controller.auth!.currentUser!.uid;
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
            UserDashBody(key: Key('user-dash-body'), user_id: user_id, ),
          ],
        ),

        bottomNavigationBar: BottomBar(key: Key('bottom-bar'),user_id: user_id),
    );
  }
}
