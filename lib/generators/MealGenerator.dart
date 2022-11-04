import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_diet_guide/models/Breakfast.dart';

import '../models/Dish.dart';

class MealGenerator {

  static void copyBreakfast() async{
    
    for(int i=1;i<37;i++){
      BreakfastModel? dm = await BreakfastModel.get(i.toString());
      print(dm);
      await BreakfastModel.add(
          id: dm!.id,
          activeness: dm.activeness,
          age_group: dm.age_group,
          calorie_gain_per_meal_per_week: dm.calorie_gain_per_meal_per_week,
          dietary_preference: dm.dietary_preference,
          gender: dm.gender,
          intensity: dm.intensity,
          monday_dish_id: dm.monday_dish_id,
          tuesday_dish_id: dm.tuesday_dish_id,
          wednesday_dish_id: dm.wednesday_dish_id,
          thursday_dish_id: dm.thursday_dish_id,
          friday_dish_id: dm.friday_dish_id,
          saturday_dish_id: dm.saturday_dish_id,
          sunday_dish_id: dm.sunday_dish_id
      );
    }
    
  }

/*
  static void setAllCalorieSums() async{
    for(int i=1;i<=37;i++){
      print(i);
      if(i<37){
        copyMeal('breakfast', i);
      }
      if(i<=27){
        copyMeal('lunch', i);
      }
      copyMeal('dinner', i);
    }

  }
*/
}