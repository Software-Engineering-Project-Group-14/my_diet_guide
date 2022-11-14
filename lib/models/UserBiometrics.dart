import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_diet_guide/models/Calorie_Calculator.dart';

import 'Model.dart';

class UserBiometrics extends Model{

  final String user_id;
  final String gender;
  final int weight;
  final int height;
  final int targetWeight;
  final String dietaryPreference;
  final String activeness;
  final String intensity;
  final int age;
  double calculated_current_weight;
  DateTime last_calorie_calculated_date;

  UserBiometrics({
    required this.user_id,
    required this.gender,
    required this.weight,
    required this.height,
    required this.targetWeight,
    required this.dietaryPreference,
    required this.activeness,
    required this.intensity,
    required this.age,
    required this.calculated_current_weight,
    required this.last_calorie_calculated_date
  });

  Map<String, dynamic> toJson() => {
    'user_id': user_id,
    'gender': gender,
    'weight': weight,
    'height': height,
    'target weight': targetWeight,
    'dietary preference':dietaryPreference,
    'activeness':activeness,
    'intensity': intensity,
    'age': age,
    'calculated_current_weight': calculated_current_weight,
    'last_calorie_calculated_date': last_calorie_calculated_date
  };

  static UserBiometrics fromJson(Map<String, dynamic> json) => UserBiometrics(
    user_id: json['user_id'],
    gender: json['gender'],
    weight: json['weight'],
    height: json['height'],
    targetWeight: json['target weight'],
    dietaryPreference: json['dietary preference'],
    activeness: json['activeness'],
    intensity: json['intensity'],
    age: json['age'],
      calculated_current_weight: json['calculated_current_weight'],
      last_calorie_calculated_date: json['last_calorie_calculated_date']
  );

  // Get user bio metrics for given user
  static Future<UserBiometrics> getUserBiometrics({required String user_id})async{
    DocumentSnapshot ds = await Model.firestore!.collection("user biometrics").doc(user_id).get();
    Map<String, dynamic> data = ds.data() as Map<String, dynamic>;
    return UserBiometrics(
        user_id: user_id,
        gender: data["gender"],
        weight: data["weight"],
        height: data["height"],
        targetWeight: data["target weight"],
        dietaryPreference: data["dietary preference"],
        activeness: data["activeness"],
        intensity: data["intensity"],
        age: data["age"],
        calculated_current_weight: data['calculated_current_weight'],
        last_calorie_calculated_date: DateTime.parse(data['last_calorie_calculated_date'].toDate().toString())
    );
  }

  // Update calculated wright for givn user
  static void updateCalculatedCurrentWeight({required String user_id}) async{
    UserBiometrics userBiometrics = await getUserBiometrics(user_id: user_id);
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);
    int dayDiffrence = today.difference(userBiometrics.last_calorie_calculated_date).inDays;
    if(dayDiffrence > 0){
      userBiometrics.calculated_current_weight -= CalorieCalculator.calorieBurnInKg(userBiometrics.gender, userBiometrics.height.toDouble(), userBiometrics.weight.toDouble(), userBiometrics.age.toDouble(), userBiometrics.activeness, dayDiffrence);
      userBiometrics.last_calorie_calculated_date =   today;
      final userBioDoc = Model.firestore!.collection('user biometrics').doc(user_id);
      userBioDoc.update({
        'calculated_current_weight': userBiometrics.calculated_current_weight,
        'last_calorie_calculated_date': userBiometrics.last_calorie_calculated_date
      });
    }
  }




}