import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_diet_guide/models/Plan.dart';
import 'package:my_diet_guide/widgets/plan_card.dart';

import '../models/UserBiometrics.dart';

class SelectPlan extends StatefulWidget {

  final UserBiometrics userBiometrics;

  const SelectPlan({Key? key, required this.userBiometrics}) : super(key: key);

  @override
  State<SelectPlan> createState() => _SelectPlanState();
}

class _SelectPlanState extends State<SelectPlan> {


  late Stream<QuerySnapshot> recommendedPlanStream;
  late String userDietaryPreference;
  late String userAgeGroup;
  late String userIntensity;
  late String userActiveness;
  late String userGender;

  @override
  void initState() {
    userDietaryPreference = widget.userBiometrics.dietaryPreference;
    userAgeGroup = DietPlanModel.getAgeGroup(widget.userBiometrics.age);
    userIntensity = widget.userBiometrics.intensity;
    userActiveness = widget.userBiometrics.activeness;
    userGender = widget.userBiometrics.gender;
    print(userDietaryPreference);
    print(userAgeGroup);
    print(userIntensity);
    print(userActiveness);
    print(userGender);
    recommendedPlanStream = DietPlanModel.getPlanStream(userDietaryPreference, userAgeGroup,userGender, userIntensity, userActiveness);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

        backgroundColor: Colors.green.shade100,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Recommended Plans",
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                        ),
                      )
                    ],
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: recommendedPlanStream,
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){

                      if (snapshot.hasError) {
                        return const Text('Something went wrong');
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text('Loading');
                      }
                      List<DietPlanModel> l = DietPlanModel.getMostReccomendedPlans(snapshot, userAgeGroup, userIntensity, userActiveness);
                      return Column(
                        children: l.map((DietPlanModel planModel){
                          return PlanCard(dietPlanModel: planModel);
                        }).toList().cast(),
                      );
                    },

                  ),

                ],
              )
            ],
          ),
        )
    );


  }




}