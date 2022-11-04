import 'package:cloud_firestore/cloud_firestore.dart';

class BreakfastModel {

  late String id;
  late String activeness;
  late String age_group;
  late double calorie_gain_per_meal_per_week;
  late String dietary_preference;
  late String gender;
  late String intensity;
  late String monday_dish_id;
  late String tuesday_dish_id;
  late String wednesday_dish_id;
  late String thursday_dish_id;
  late String friday_dish_id;
  late String saturday_dish_id;
  late String sunday_dish_id;

  BreakfastModel({
    required this.id,
    required this.activeness,
    required this.age_group,
    required this.calorie_gain_per_meal_per_week,
    required this.dietary_preference,
    required this.gender,
    required this.intensity,
    required this.monday_dish_id,
    required this.tuesday_dish_id,
    required this.wednesday_dish_id,
    required this.thursday_dish_id,
    required this.friday_dish_id,
    required this.saturday_dish_id,
    required this.sunday_dish_id
  });

  @override
  String toString() {
    return "Breakfast Id: $id   Dietary Preference: $dietary_preference";
  }

  Map<String, dynamic> toMap() =>
      {
        'id': id,
        'activeness': activeness,
        'age_group': age_group,
        'calorie_gain_per_meal_per_week': calorie_gain_per_meal_per_week,
        'dietary_preference': dietary_preference,
        'gender': gender,
        'intensity': intensity,
        'monday_dish_id': monday_dish_id,
        'tuesday_dish_id': tuesday_dish_id,
        'wednesday_dish_id': wednesday_dish_id,
        'thursday_dish_id': thursday_dish_id,
        'friday_dish_id': friday_dish_id,
        'saturday_dish_id': saturday_dish_id,
        'sunday_dish_id': sunday_dish_id
      };

  static BreakfastModel fromMap(Map<String, dynamic> map) =>
      BreakfastModel(
          id: map['id'],
          activeness: map['activeness'],
          age_group: map['age_group'],
          calorie_gain_per_meal_per_week: map['calorie_gain_per_meal_per_week'],
          dietary_preference: map['dietary_preference'],
          gender: map['gender'],
          intensity: map['intensity'],
          monday_dish_id: map['monday_dish_id'],
          tuesday_dish_id: map['tuesday_dish_id'],
          wednesday_dish_id: map['wednesday_dish_id'],
          thursday_dish_id: map['thursday_dish_id'],
          friday_dish_id: map['friday_dish_id'],
          saturday_dish_id: map['saturday_dish_id'],
          sunday_dish_id: map['sunday_dish_id']
      );


  // Adds a newBreakfast and returns its id
  static Future<bool> add({
    required id,
    required activeness,
    required age_group,
    required calorie_gain_per_meal_per_week,
    required dietary_preference,
    required gender,
    required intensity,
    required monday_dish_id,
    required tuesday_dish_id,
    required wednesday_dish_id,
    required thursday_dish_id,
    required friday_dish_id,
    required saturday_dish_id,
    required sunday_dish_id
  }) async {
    try {
      await FirebaseFirestore.instance.collection('breakfast').doc(id).set({
        'activeness': activeness,
        'age_group': age_group,
        'calorie_gain_per_meal_per_week': calorie_gain_per_meal_per_week,
        'dietary_preference': dietary_preference,
        'gender': gender,
        'intensity': intensity,
        'monday_dish_id': monday_dish_id,
        'tuesday_dish_id': tuesday_dish_id,
        'wednesday_dish_id': wednesday_dish_id,
        'thursday_dish_id': thursday_dish_id,
        'friday_dish_id': friday_dish_id,
        'saturday_dish_id': saturday_dish_id,
        'sunday_dish_id': sunday_dish_id
      });
      return true;
    } catch (error) {
      return false;
    }
  }

  // Gets the breakfast from given id
  static Future<BreakfastModel?> get(String breakfastId) async {
   // try {
      DocumentSnapshot ds = await FirebaseFirestore.instance.collection(
          'breakfast1').doc(breakfastId).get();

      BreakfastModel dm = BreakfastModel.fromMap({
        'id': breakfastId,
        'activeness': ds['activeness'],
        'age_group': ds['age_group'],
        'calorie_gain_per_meal_per_week': ds['calorie_gain_per_meal_per_week'].toDouble(),
        'dietary_preference': ds['dietary_preference'],
        'gender': ds['gender'],
        'intensity': ds['intensity'],
        'monday_dish_id': ds['monday_dish_id'],
        'tuesday_dish_id': ds['tuesday_dish_id'],
        'wednesday_dish_id': ds['wednesday_dish_id'],
        'thursday_dish_id': ds['thursday_dish_id'],
        'friday_dish_id': ds['friday_dish_id'],
        'saturday_dish_id': ds['saturday_dish_id'],
        'sunday_dish_id': ds['sunday_dish_id']
      });
      return dm;
  //  } catch (error) {
  //    return null;
   // }
  }
}

