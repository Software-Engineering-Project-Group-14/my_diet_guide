import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserBiometrics{

  final String user_id;
  final String gender;
  final int weight;
  final int height;
  final int targetWeight;
  final String dietaryPreference;
  final String activeness;
  final String intensity;
  final int age;

  UserBiometrics({
    required this.user_id,
    required this.gender,
    required this.weight,
    required this.height,
    required this.targetWeight,
    required this.dietaryPreference,
    required this.activeness,
    required this.intensity,
    required this.age
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
    'age': age
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
      age: json['age']
  );

  static Future<UserBiometrics> getUserBiometrics(String user_id)async{
    DocumentSnapshot ds = await FirebaseFirestore.instance.collection("user biometrics").doc(user_id).get();
    Map<String, dynamic> data = ds.data() as Map<String, dynamic>;
    print(data.toString());
    return UserBiometrics(
        user_id: user_id,
        gender: data["gender"],
        weight: data["weight"],
        height: data["height"],
        targetWeight: data["target weight"],
        dietaryPreference: data["dietary preference"],
        activeness: data["activeness"],
        intensity: data["intensity"],
        age: data["age"]
    );
  }

}