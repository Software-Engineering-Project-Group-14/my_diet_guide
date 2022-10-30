import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_diet_guide/widgets/blurred_background_image.dart';
import 'package:my_diet_guide/widgets/bottom_bar.dart';
import 'package:my_diet_guide/widgets/user_dash_body.dart';
import '../widgets/side_bar.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({Key? key}) : super(key: key);

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {

  final dietUser = FirebaseAuth.instance.currentUser;

  late String user_id = dietUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade900,
        appBar: AppBar(
          backgroundColor: Colors.teal.shade900,
          elevation: 0,
        ),
        drawer: NavigationDrawer(),

        body: Stack(
          children: [
            BlurredBackground(),
            UserDashBody(user_id: user_id),
          ],
        ),

      bottomNavigationBar: BottomBar(user_id: user_id),
    );
  }
}
