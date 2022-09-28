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

  UserBiometrics({
    required this.user_id,
    required this.gender,
    required this.weight,
    required this.height,
    required this.targetWeight,
    required this.dietaryPreference,
    required this.activeness,
    required this.intensity
  });

  Map<String, dynamic> toJson() => {
    'user_id': user_id,
    'gender': gender,
    'weight': weight,
    'height': height,
    'target weight': targetWeight,
    'dietary preference':dietaryPreference,
    'activeness':activeness,
    'intensity': intensity
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
  );
}