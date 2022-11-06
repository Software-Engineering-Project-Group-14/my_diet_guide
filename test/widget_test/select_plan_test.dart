import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_diet_guide/models/Calorie_Calculator.dart';
import 'package:my_diet_guide/models/UserBiometrics.dart';
import 'package:my_diet_guide/screens/select_plan.dart';

void main(){

  group("Widget testing Select Plan", () {

    testWidgets("Select the diet plan", (widgetTester) async{
      final firestore = FakeFirebaseFirestore();
      String uid = 'rhaenys2';
      String email = 'rhaenys@meeleys.com';
      String gender = "Female";
      int age = 55;
      double weight = 50;
      double height = 160;
      double targetWeight = 45;
      String activeness = "Not very active";
      String dietaryPreference = "Vegetarian";
      String intensity = "Difficult";
      final auth = MockFirebaseAuth(
          mockUser: MockUser(
            isAnonymous: false,
            uid: uid,
            email: email,
            displayName: 'Rhaenys',
          ),
          signedIn: true
      );

      DateTime now = DateTime.now();
      DateTime today = DateTime(now.year, now.month, now.day);
      /*
      final json = {
        'user_id': uid,
        'age': 55,
        'gender': "Female",
        'weight': weight,
        'height': height,
        'target weight': targetWeight,
        'dietary preference': dietaryPreference,
        'activeness': activeness,
        'intensity': intensity,
        'calculated_current_weight':weight-CalorieCalculator.calorieBurnPerDayInKg(gender, height.toDouble(), weight.toDouble(), age.toDouble(), activeness),
        'last_calorie_calculated_date': today
      };
      await firestore.collection('user biometrics').doc(uid).set(json);
      await firestore.collection("diet_plan").doc("0")
          .set({
        "activeness": activeness,
        "age_group": "46-60",
        "dietary_preference": dietaryPreference,
        "gender": gender,
        "intensity": intensity,
        "breakfast_id": breakfastMeal,
        "lunch_id": lunchMeal,
        "dinner_id": dinnerMeal
      });
      */

      await widgetTester.pumpWidget(
          MaterialApp(
              home: SelectPlan(firestore: firestore, auth: auth, userBiometrics: UserBiometrics(
                  user_id: uid,
                  gender: gender,
                  weight: weight.toInt(),
                  height: height.toInt(),
                  targetWeight: targetWeight.toInt(),
                  dietaryPreference: dietaryPreference,
                  activeness: activeness,
                  intensity: intensity,
                  age: age,
                  calculated_current_weight: weight-CalorieCalculator.calorieBurnPerDayInKg(gender, height.toDouble(), weight.toDouble(), age.toDouble(), activeness),
                  last_calorie_calculated_date: today
              ),
              )
          )
      );

      // Feedback add check
      //  await widgetTester.tap(find.byKey(Key('recommend-plan-card-0')));
      //   await widgetTester.pump();
      // expect(find.text('Plan changed successfully.'), findsOneWidget);
      //await widgetTester.pump();
      // expect(find.descendant(of: find.byKey(Key('reviews-column')), matching: find.text('rhaenys@meeleys.com')), findsOneWidget);
      //  expect(find.descendant(of: find.byKey(Key('reviews-column')), matching: find.text('I love this app')), findsOneWidget);

    });


  });



}