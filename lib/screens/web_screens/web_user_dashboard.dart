import 'package:flutter/material.dart';

import '../../controllers/Controller.dart';
import '../../widgets/blurred_background_image.dart';
import '../../widgets/bottom_bar.dart';
import '../../widgets/side_bar.dart';
import '../../widgets/user_dash_body.dart';

class WebUserDashboard extends StatefulWidget {
  const WebUserDashboard({Key? key}) : super(key: key);

  @override
  State<WebUserDashboard> createState() => _WebUserDashboardState();
}

class _WebUserDashboardState extends State<WebUserDashboard> {
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
