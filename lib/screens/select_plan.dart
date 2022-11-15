import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_diet_guide/common/route_constants.dart';
import 'package:my_diet_guide/models/DietPlan.dart';
import 'package:my_diet_guide/screens/user_dashboard.dart';
import 'package:my_diet_guide/widgets/background_image.dart';
import 'package:my_diet_guide/widgets/plan_card.dart';
import 'package:my_diet_guide/widgets/recommended_plans.dart';

import '../controllers/Controller.dart';
import '../models/UserBiometrics.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/plan_card.dart';
import '../widgets/side_bar.dart';

class SelectPlan extends StatefulWidget {


  const SelectPlan({Key? key,
  }) : super(key: key);

  @override
  State<SelectPlan> createState() => _SelectPlanState();
}

class _SelectPlanState extends State<SelectPlan> {


  @override
  Widget build(BuildContext context) {

    return SafeArea(
      top: true,
      minimum: EdgeInsets.only(top: 20),
      child: Scaffold(
        backgroundColor: Colors.teal.shade900,
        appBar: AppBar(
          backgroundColor: Colors.teal.shade900,
          elevation: 0,
          title: const Text('Select Diet Plan'),
        ),
        drawer: const NavigationDrawer(),
        body: Stack(
          children: [
            BackgroundImage(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  RecommendedPlans()
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomBar(key: Key('bottom-bar'),user_id: Controller.auth!.currentUser!.uid),

      ),
    );


  }




}
