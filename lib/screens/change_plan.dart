import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_diet_guide/common/messgae_constants.dart';
import 'package:my_diet_guide/models/DietPlan.dart';
import 'package:my_diet_guide/models/UserBiometrics.dart';
import 'package:my_diet_guide/widgets/plan_card.dart';
import 'package:my_diet_guide/widgets/recommended_plans.dart';

import '../controllers/Controller.dart';
import '../widgets/blurred_background_image.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/plan_card.dart';
import '../widgets/side_bar.dart';

class ChangePlan extends StatefulWidget {


  const ChangePlan({Key? key}) : super(key: key);

  @override
  State<ChangePlan> createState() => _ChangePlanState();
}

class _ChangePlanState extends State<ChangePlan> {

  late Stream<Map<String, dynamic>> currentPlanStream;
  late Stream<UserBiometrics> userBiometricsStream;

  @override
  void initState() {
    currentPlanStream = DietPlanModel.getDietPlanForUser(user_id:"6gDkTTdr4jXWMtq5ZEJngXx7PjP2").asStream();
    userBiometricsStream = UserBiometrics.getUserBiometrics(user_id:"6gDkTTdr4jXWMtq5ZEJngXx7PjP2").asStream();
    super.initState();
  }


  @override
  Widget build(BuildContext context)  {
    return SafeArea(
      top: true,
      minimum: EdgeInsets.only(top: 20),
      child: Scaffold(
        key: const Key('change-diet-plan'),
        backgroundColor: Colors.teal.shade900,
        appBar: AppBar(
          backgroundColor: Colors.teal.shade900,
          elevation: 0,
          title: const Text('Change Diet Plan'),
        ),
        drawer: const NavigationDrawer(),
        body: Stack(
            children: [

              const BlurredBackground(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: StreamBuilder<Map<String, dynamic>>(
                    stream: currentPlanStream,
                    builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
                      String? msg;
                      bool? success;
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasError || snapshot.data == null) {
                        success=false;
                        msg = MessageConstants.errorMessage;
                        return Text(
                          msg,
                          style: const TextStyle(
                              color: Colors.white
                          ),
                        );
                      }
                      success = snapshot.data!['success'];
                      msg = snapshot.data!['msg'];
                      DietPlanModel currentPlan = snapshot.data!['dietPlan'];
                      return Column(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Current plan",
                                      style: GoogleFonts.poppins(
                                          fontSize: 20,
                                          color: Colors.white
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(child: PlanCard(dietPlanModel:currentPlan))
                                  ],
                                )
                              ],
                            ),
                          ),
                          RecommendedPlans(currentPlanId: snapshot.data!['dietPlan'].planId,)
                        ],
                      );
                    }
                ),
              ),

            ]

        ),
        bottomNavigationBar: BottomBar(key: Key('bottom-bar'),user_id: "6gDkTTdr4jXWMtq5ZEJngXx7PjP2"),
      ),
    );


  }




}