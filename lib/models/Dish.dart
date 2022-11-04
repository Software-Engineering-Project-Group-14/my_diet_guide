

import 'package:cloud_firestore/cloud_firestore.dart';

class DishModel{

  late String name;
  late double calorie_gain_per_meal;
  late String dietary_preference;
  late String description;
  late String dish_image;
  late String meal;

  DishModel({
    required this.name,
    required this.calorie_gain_per_meal,
    required this.dietary_preference,
    required  this.description,
    required this.dish_image,
    required this.meal
  });

  @override
  String toString(){
    return "Name: $name\nCalorie_gain_per_meal: $calorie_gain_per_meal\nDietary Preference: $dietary_preference\nMeal: $meal";
  }

  Map<String, dynamic> toMap() => {
    'name': name,
    'calorie_gain_per_meal':calorie_gain_per_meal,
    'dietary_preference':dietary_preference,
    'description':description,
    'dish_image':dish_image,
    'meal':meal
  };

  static DishModel fromMap(Map<String, dynamic> map) => DishModel(
      name: map['name'],
      calorie_gain_per_meal: map['calorie_gain_per_meal'],
      dietary_preference: map['dietary_preference'],
      description: map['description'],
      dish_image: map['dish_image'],
      meal: map['meal']
  );


  // Adds a new dish and returns its id
  static Future<String?> add({
    required name,
    required calorie_gain_per_meal,
    required dietary_preference,
    required description,
    required dish_image,
    required meal
  }) async {
    try{
      await FirebaseFirestore.instance.collection('dish').doc(name).set({
        "name":name,
        "calorie_gain_per_meal": calorie_gain_per_meal,
        "dietary_preference": dietary_preference,
        "description": description,
        "dish_image": dish_image,
        "meal": meal
      });
      return name;
    }catch(error){
      return null;
    }
  }

  // Gets the dish from given dishname
  static Future<DishModel?> get(String dishName) async{
    try{
      DocumentSnapshot ds = await FirebaseFirestore.instance.collection('dish').doc(dishName).get();
      DishModel dm = DishModel.fromMap({
        "name": ds['name'],
        "calorie_gain_per_meal": ds['calorie_gain_per_meal'],
        "dietary_preference": ds['dietary_preference'],
        "description": ds['description'],
        "dish_image": ds['dish_image'],
        "meal": ds['meal']
      });
      return dm;
   }catch(error){
      return null;
    }
  }


}