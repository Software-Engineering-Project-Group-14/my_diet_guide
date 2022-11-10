
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'Dish.dart';
import 'Model.dart';

class Meal extends Model{

  final String id;
  final String type;
  late String activeness;
  late String age_group;
  late double calorie_gain_per_meal_per_week;
  late String gender;
  late String intensity;
  late String monday_dish_id;
  late String tuesday_dish_id;
  late String wednesday_dish_id;
  late String thursday_dish_id;
  late String friday_dish_id;
  late String saturday_dish_id;
  late String sunday_dish_id;
  late String dietary_preference;
  
  Meal({
    required this.id,
    required this.type,
    required this.activeness,
    required this.age_group,
    required this.calorie_gain_per_meal_per_week,
    required this.gender,
    required this.intensity,
    required this.monday_dish_id,
    required this.tuesday_dish_id,
    required this.wednesday_dish_id,
    required this.thursday_dish_id,
    required this.friday_dish_id,
    required this.saturday_dish_id,
    required this.sunday_dish_id,
    required this.dietary_preference
  });
  
  @override
  String toString(){
    return "$type  Meal id:$id  Calorie gain:$calorie_gain_per_meal_per_week";
  }
  
  static Future<Meal?> add({
    required String type,
    required String activeness,
    required String age_group,
   // required double calorie_gain_per_meal_per_week,
    required String gender,
    required String intensity,
    required String monday_dish_id,
    required String tuesday_dish_id,
    required String wednesday_dish_id,
    required String thursday_dish_id,
    required String friday_dish_id,
    required String saturday_dish_id,
    required String sunday_dish_id,
    required String dietary_preference
  }) async{
  try{
    DocumentSnapshot ds = await Model.firestore!.collection(type).doc("nextId").get();
    int nextId;
    if(ds.data()==null){
      nextId = 1;
    }else{
      nextId = ds["id"].toInt();
    }
    List<String> dishValues = [
      monday_dish_id,
      tuesday_dish_id,
      wednesday_dish_id,
      thursday_dish_id,
      friday_dish_id,
      saturday_dish_id,
      sunday_dish_id
    ];
    Dish? dish ;
    double Sum = 0;
    for(int i=0;i<7;i++){
      dish = await Dish.get(dishValues[i]);
      Sum += dish!.calorie_gain_per_meal;
    }
    await Model.firestore!.collection(type).doc(nextId.toString()).set({
      "activeness": activeness,
      "age_group": age_group,
      "calorie_gain_per_meal_per_week": Sum,
      "gender": gender,
      "intensity": intensity,
      "dietary_preference":dietary_preference,
      "monday_dish_id": monday_dish_id,
      "tuesday_dish_id": tuesday_dish_id,
      "wednesday_dish_id": wednesday_dish_id,
      "thursday_dish_id": thursday_dish_id,
      "friday_dish_id": friday_dish_id,
      "saturday_dish_id": saturday_dish_id,
      "sunday_dish_id": sunday_dish_id
    });
    await Model.firestore!.collection(type).doc("nextId").set(
        {"id":nextId+1}, SetOptions(merge: true));
    return Meal(
        id: (nextId).toString(),
        type: type,
        activeness: activeness,
        age_group: age_group,
        calorie_gain_per_meal_per_week: Sum,
        gender: gender,
        intensity: intensity,
        monday_dish_id: monday_dish_id,
        tuesday_dish_id: tuesday_dish_id,
        wednesday_dish_id: wednesday_dish_id,
        thursday_dish_id: thursday_dish_id,
        friday_dish_id: friday_dish_id,
        saturday_dish_id: saturday_dish_id,
        sunday_dish_id: sunday_dish_id,
        dietary_preference: dietary_preference
    );

  }catch(error){
    return null;
  }
}

  static Future<Meal?> get(String id, String type)async{
    try{
      DocumentSnapshot ds = await Model.firestore!.collection(type).doc(id).get();
      return Meal(
          id: id,
          type: type,
          activeness: ds["activeness"],
          age_group: ds["age_group"],
          calorie_gain_per_meal_per_week: ds["calorie_gain_per_meal_per_week"],
          gender: ds["gender"],
          intensity: ds["intensity"],
          monday_dish_id: ds["monday_dish_id"],
          tuesday_dish_id: ds["tuesday_dish_id"],
          wednesday_dish_id: ds["wednesday_dish_id"],
          thursday_dish_id: ds["thursday_dish_id"],
          friday_dish_id: ds["friday_dish_id"],
          saturday_dish_id: ds["saturday_dish_id"],
          sunday_dish_id: ds["sunday_dish_id"],
          dietary_preference: ds["dietary_preference"]
      );
    }catch(error){
      return null;
    }

  }
  
  
  



}