import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../common/image_path_constants.dart';
import 'Model.dart';


class Dish extends Model{

  final String name;
  late String description;
  late String dietary_preference;
  late String mealType;
  late double calorie_gain_per_meal;
  
  Dish({
    required this.name,
    required this.description,
    required this.dietary_preference,
    required this.mealType,
    required this.calorie_gain_per_meal
  });

  @override
  String toString(){
    return "$mealType  Dish name:$name  Calorie gain:$calorie_gain_per_meal";
  }

  static String getImagePath({
    required String name,
    required String dietary_preference,
    required String mealType,
  } ){
    String imgPath = "${ImagePathConstants.prefix}/${ImagePathConstants.dish}/$dietary_preference/$mealType/$name${ImagePathConstants.suffix}";
    return imgPath;
  }

  static Future<Dish?> add({
    required String name,
    required String description,
    required String dietary_preference,
    required String mealType,
    required double calorie_gain_per_meal,  
  })async{
    try{
      await Model.firestore!.collection("diet_plan").doc(name).set({
        "name": name,
        "description": description,
        "dietary_preference": dietary_preference,
        "mealType": mealType,
        "calorie_gain_per_meal": calorie_gain_per_meal,
        "dish_image": Dish.getImagePath(name: name, dietary_preference: dietary_preference, mealType: mealType)
      });
      return Dish(
          name: name,
          description: description,
          dietary_preference: dietary_preference,
          mealType: mealType,
          calorie_gain_per_meal: calorie_gain_per_meal
      );
    }catch(error){
      return null;
    }
  }

  static Future<Dish?> get(String name)async{
    try{
      DocumentSnapshot ds = await Model.firestore!.collection("diet_plan").doc(name).get();
        return Dish(
            name: ds["name"],
            description: ds["description"],
            dietary_preference: ds["dietary_preference"],
            mealType: ds["mealType"],
            calorie_gain_per_meal: ds["calorie_gain_per_meal"]
        );
    }catch(error){
      return null;
    }

  }


}