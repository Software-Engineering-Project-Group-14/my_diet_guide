import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class DietPlanModel{
  late String name;
  late String desc;
  late String img;
  late String dietary_preference;
  late String gender;
  late String intensity;
  late String activeness;
  late String age_group;
  late String breakfast_id;
  late String lunch_id;
  late String dinner_id;
  double diffValue = 0;

  DietPlanModel({
    required this.name,
    required this.desc,
    required this.dietary_preference,
    required this.gender,
    required this.intensity,
    required this.activeness,
    required this.age_group,
    required this.breakfast_id,
    required this.lunch_id,
    required this.dinner_id,
  }){
    img = dietary_preference+".png";
  }

  @override
  String toString(){
    return "Plan Name: $name\nDietary Preference: $dietary_preference\nGender: $gender\nIntensity: $intensity\nActiveness: $activeness\nAge group: $age_group\n";
  }

  static Stream<QuerySnapshot> getPlanStream(dietary_preference, age_group){
    return FirebaseFirestore.instance.collection('diet_plan').where('dietary_preference', isEqualTo: dietary_preference).where("age_group", isEqualTo: age_group).snapshots();
  }

  static List<DietPlanModel> getMostReccomendedPlans(AsyncSnapshot<QuerySnapshot> snapshot, intensity, activeness, age_group) {
    List<DietPlanModel> recommendedPlans = [];
    QuerySnapshot<Object?>? data = snapshot.data;
    //print(data!.docs.length);
    for(int i=0; i<data!.docs.length; i++){
      var cur = data.docs[i];
      // print(cur);
      DietPlanModel curPlan = DietPlanModel(
          name: cur.get('name'),
          desc: cur.get('desc'),
          dietary_preference: cur.get('dietary_preference'),
          gender: cur.get('gender'),
          intensity: cur.get('intensity'),
          activeness: cur.get('activeness'),
          age_group: cur.get('age_group'),
          breakfast_id: cur.get('breakfast_id'),
          lunch_id: cur.get('lunch_id'),
          dinner_id: cur.get('dinner_id')
      );
      //print(curPlan);
      recommendedPlans.add(curPlan);
    };
    int effValue = 1200;
    Map<String, int> intensityValues = {
      "easy": 0,
      "medium": effValue~/2,
      "hard": effValue
    };
    Map<String, int> activenessValues = {
      "very active": 0,
      "active": effValue~/3,
      "not very active": (2*effValue)~/3,
      "rarely active": effValue
    };
    Map<String, int> ageGroupValues = {
      "5-12":0,
      "13-18":effValue~/6,
      "19-25":effValue~/3,
      "26-45":effValue~/2,
      "46-60":(2*effValue)~/3,
      "61-75":(5*effValue)~/6,
      "More than 75":effValue
    };
    //print("xxxxx");
    for(int j=0; j<recommendedPlans.length; j++){
      DietPlanModel cur = recommendedPlans[j];
      cur.diffValue = sqrt(
          pow((intensityValues[intensity]!-intensityValues[cur.intensity]!),2)+
              pow((activenessValues[activeness]!-activenessValues[cur.activeness]!),2)+
              pow((ageGroupValues[age_group]!-ageGroupValues[cur.age_group]!),2)
      );
      // print(cur.diffValue);
    }
    // print("yyyy");
    recommendedPlans.sort((DietPlanModel a, DietPlanModel b){
      return (b.diffValue-a.diffValue).toInt();
    });
    return recommendedPlans;
  }





}