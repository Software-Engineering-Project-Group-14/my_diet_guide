import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_diet_guide/widgets/web_widgets/web_user_dash_body.dart';
import 'package:my_diet_guide/widgets/web_widgets/web_user_navigation_bar.dart';

import '../../controllers/Controller.dart';
import '../../widgets/blurred_background_image.dart';
import '../../widgets/bottom_bar.dart';
import '../../widgets/side_bar.dart';
import '../../widgets/user_dash_body.dart';
import '../../widgets/web_widgets/web_blurred_backgound.dart';
import '../calendar_screen.dart';

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

      appBar: WebUserNavBar(),

      body: Stack(
        children: [
          WebBlurredBackground(),

          WebUserDashBody(user_id: user_id),
        ],
      ),
    );
  }
}
