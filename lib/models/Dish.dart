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
    String imgPath = "${ImagePathConstants.prefix}/${ImagePathConstants.dish}/$dietary_preference/${mealType[0].toUpperCase()}${mealType.substring(1)}/$name${ImagePathConstants.suffix}";
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
      await Model.firestore!.collection("dish").doc(name).set({
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
      DocumentSnapshot ds = await Model.firestore!.collection("dish").doc(name).get();
        return Dish(
            name: ds["name"],
            description: ds["description"],
            dietary_preference: ds["dietary_preference"],
            mealType: ds["meal"].toString().toLowerCase(),
            calorie_gain_per_meal: ds["calorie_gain_per_meal"]
        );
    }catch(error){
      return null;
    }

  }

  static Future<Map<String, Dish>> getByDay({
    required String day,
    required String breakfast_id,
    required String lunch_id,
    required String dinner_id,
  })async{
    day = day.toLowerCase();
    Map<String, Dish> dishes = {};
    DocumentSnapshot ds = await Model.firestore!.collection('breakfast').doc(breakfast_id).get();
    String dishName = ds['${day}_dish_id'];
    dishes['dishBreakfast'] = (await Dish.get(dishName))!;
    ds = await Model.firestore!.collection('lunch').doc(lunch_id).get();
    dishName = ds['${day}_dish_id'];
    dishes['dishLunch'] = (await Dish.get(dishName))!;
    ds = await Model.firestore!.collection('dinner').doc(dinner_id).get();
    dishName = ds['${day}_dish_id'];
    dishes['dishDinner'] = (await Dish.get(dishName))!;
    return dishes;
  }




}