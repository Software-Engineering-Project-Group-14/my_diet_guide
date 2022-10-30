


import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProgressRecorder{

  static Map<String,double> progressPrecentageMap = {
    "Did not complete" : 25,
    "Partially Completed": 50,
    "Completed": 100,
    "Over ate": 135
  };



  static Future<void> recordProgress(String userId, DateTime date, String meal, String dish, String progress) async {
    DocumentSnapshot ds = await FirebaseFirestore.instance.collection('dish1').doc(dish).get();
    Map<String, dynamic> data = ds.data() as Map<String, dynamic>;
    if(!progressPrecentageMap.containsKey(progress)) {
      throw Exception("Undefined progress at recordProgress at ProgressRecorder");
    }
    double calorieGainInkg = (data["calorie_gain_per_meal"] * progressPrecentageMap[progress]/100)/7700;
    //print(calorieGainInkg);
    final recordPregressDoc = FirebaseFirestore.instance.collection('record progress').doc(userId + DateTime(date.year, date.month, date.day).toString() + meal);
    ds = await recordPregressDoc.get();
    double prevAddRemove = 0;
    if(ds.data() != null){
      data = ds.data() as Map<String, dynamic>;
      prevAddRemove = data['calorie_gain'];
    }
    //print(prevAddRemove);
    await recordPregressDoc.set({
      'userId': userId,
      'date': DateTime(date.year, date.month, date.day),
      'meal': meal,
      'dish': dish,
      'progress': progress,
      'calorie_gain': calorieGainInkg
    });
    final userBioDoc = FirebaseFirestore.instance.collection('user biometrics').doc(userId);
    ds = await userBioDoc.get();
    data = ds.data() as Map<String, dynamic>;
    userBioDoc.update({
      'calculated_current_weight': data['calculated_current_weight'] + calorieGainInkg - prevAddRemove
    });
  }

}