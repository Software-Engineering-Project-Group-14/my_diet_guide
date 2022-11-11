


//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_diet_guide/common/messgae_constants.dart';
import 'package:my_diet_guide/models/Calorie_Calculator.dart';

import 'Model.dart';

class ProgressRecorder extends Model{

  static Map<String,double> progressPrecentageMap = {
    "Did not complete" : 25,
    "Partially Completed": 50,
    "Completed": 100,
    "Over ate": 135
  };



  static Future<Map<String,dynamic>> recordProgress(String userId, DateTime date, String meal, String dish, String progress) async {
    bool success = true;
    String? msg;
    DocumentSnapshot ds = await Model.firestore!.collection('dish').doc(dish).get();
    Map<String, dynamic> data = ds.data() as Map<String, dynamic>;
    if(!progressPrecentageMap.containsKey(progress)) {
      success = false;
      msg = MessageConstants.invalidProgressRecord;
    }else{
      double calorieGain = data["calorie_gain_per_meal"] * progressPrecentageMap[progress]/100;
      double calorieGainInkg = CalorieCalculator.calorieToKg(calorieGain);
      //print(calorieGainInkg);
      final recordPregressDoc = Model.firestore!.collection('record progress').doc(userId + DateTime(date.year, date.month, date.day).toString() + meal);
      ds = await recordPregressDoc.get();
      double prevAddRemove = 0;
      if(ds.data() != null){
        data = ds.data() as Map<String, dynamic>;
        prevAddRemove = CalorieCalculator.calorieToKg(data['calorie_gain']) ;
      }
      //print(prevAddRemove);
      await recordPregressDoc.set({
        'userId': userId,
        'date': DateTime(date.year, date.month, date.day),
        'meal': meal,
        'dish': dish,
        'progress': progress,
        'calorie_gain': calorieGain
      });
      final userBioDoc = Model.firestore!.collection('user biometrics').doc(userId);
      ds = await userBioDoc.get();
      data = ds.data() as Map<String, dynamic>;
      userBioDoc.update({
        'calculated_current_weight': data['calculated_current_weight'] + calorieGainInkg - prevAddRemove
      });
    }
    return {
      'success':success,
      'msg':msg
    };
  }

}