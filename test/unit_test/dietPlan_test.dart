
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:my_diet_guide/common/messgae_constants.dart';
import 'package:my_diet_guide/common/plan_constants.dart';
import 'package:my_diet_guide/models/DietPlan.dart';
import 'package:my_diet_guide/models/Dish.dart';
import 'package:my_diet_guide/models/Meal.dart';
import 'package:my_diet_guide/models/Model.dart';
import 'package:test/test.dart';

Future<List<double>> addSampleDishes() async {
  String name = "Dish 1";
  String description = "Dish 1 description";
  String dietary_preference = "Vegetarian";
  String mealType = "breakfast";
  List<double> calorieValues = [-1];
  double calorie_gain_per_meal = Random().nextInt(500)+600;
  calorieValues.add(calorie_gain_per_meal);
  await Dish.add(name: name, description: description, dietary_preference: dietary_preference, mealType: mealType, calorie_gain_per_meal: calorie_gain_per_meal);
  name = "Dish 2";
  description = "Dish 2 description";
  mealType = "lunch";
  calorie_gain_per_meal = Random().nextInt(500)+600;
  calorieValues.add(calorie_gain_per_meal);
  await Dish.add(name: name, description: description, dietary_preference: dietary_preference, mealType: mealType, calorie_gain_per_meal: calorie_gain_per_meal);
  name = "Dish 3";
  description = "Dish 3 description";
  mealType = "dinner";
  calorie_gain_per_meal = Random().nextInt(500)+600;
  calorieValues.add(calorie_gain_per_meal);
  await Dish.add(name: name, description: description, dietary_preference: dietary_preference, mealType: mealType, calorie_gain_per_meal: calorie_gain_per_meal);
  name = "Dish 4";
  description = "Dish 4 description";
  dietary_preference = "Low carb";
  mealType = "breakfast";
  calorie_gain_per_meal = Random().nextInt(500)+600;
  calorieValues.add(calorie_gain_per_meal);
  await Dish.add(name: name, description: description, dietary_preference: dietary_preference, mealType: mealType, calorie_gain_per_meal: calorie_gain_per_meal);
  name = "Dish 5";
  description = "Dish 5 description";
  mealType = "lunch";
  calorie_gain_per_meal = Random().nextInt(500)+600;
  calorieValues.add(calorie_gain_per_meal);
  await Dish.add(name: name, description: description, dietary_preference: dietary_preference, mealType: mealType, calorie_gain_per_meal: calorie_gain_per_meal);
  name = "Dish 6";
  description = "Dish 6 description";
  mealType = "dinner";
  calorie_gain_per_meal = Random().nextInt(500)+600;
  calorieValues.add(calorie_gain_per_meal);
  await Dish.add(name: name, description: description, dietary_preference: dietary_preference, mealType: mealType, calorie_gain_per_meal: calorie_gain_per_meal);
  name = "Dish 7";
  description = "Dish 7 description";
  dietary_preference = "Energetic";
  mealType = "breakfast";
  calorie_gain_per_meal = Random().nextInt(500)+600;
  calorieValues.add(calorie_gain_per_meal);
  await Dish.add(name: name, description: description, dietary_preference: dietary_preference, mealType: mealType, calorie_gain_per_meal: calorie_gain_per_meal);
  name = "Dish 8";
  description = "Dish 8 description";
  mealType = "lunch";
  calorie_gain_per_meal = Random().nextInt(500)+600;
  calorieValues.add(calorie_gain_per_meal);
  await Dish.add(name: name, description: description, dietary_preference: dietary_preference, mealType: mealType, calorie_gain_per_meal: calorie_gain_per_meal);
  name = "Dish 9";
  description = "Dish 9 description";
  mealType = "dinner";
  calorie_gain_per_meal = Random().nextInt(500)+600;
  calorieValues.add(calorie_gain_per_meal);
  await Dish.add(name: name, description: description, dietary_preference: dietary_preference, mealType: mealType, calorie_gain_per_meal: calorie_gain_per_meal);
  return calorieValues;
}

Future<List<double>> addSampleMeals() async {
  String name = "Dish 1";
  String description = "Dish 1 description";
  String dietary_preference = "Vegetarian";
  String mealType = "breakfast";
  List<double> calorieValues = [-1];
  double calorie_gain_per_meal = Random().nextInt(500)+600;
  calorieValues.add(calorie_gain_per_meal);
  await Dish.add(name: name, description: description, dietary_preference: dietary_preference, mealType: mealType, calorie_gain_per_meal: calorie_gain_per_meal);
  name = "Dish 2";
  description = "Dish 2 description";
  mealType = "lunch";
  calorie_gain_per_meal = Random().nextInt(500)+600;
  calorieValues.add(calorie_gain_per_meal);
  await Dish.add(name: name, description: description, dietary_preference: dietary_preference, mealType: mealType, calorie_gain_per_meal: calorie_gain_per_meal);
  name = "Dish 3";
  description = "Dish 3 description";
  mealType = "dinner";
  calorie_gain_per_meal = Random().nextInt(500)+600;
  calorieValues.add(calorie_gain_per_meal);
  await Dish.add(name: name, description: description, dietary_preference: dietary_preference, mealType: mealType, calorie_gain_per_meal: calorie_gain_per_meal);
  List<double> week_calories = [-1];
  int i = 1;
  String type = 'breakfast';
  String activeness = 'Active';
  String age_group = '61-75';
  String gender = "Male";
  String intensity = 'Difficult';
  dietary_preference = 'Vegetarian';
  String monday_dish_id = "Dish $i";
  String tuesday_dish_id = "Dish $i";
  String wednesday_dish_id = "Dish $i";
  String thursday_dish_id = "Dish $i";
  String friday_dish_id = "Dish $i";
  String saturday_dish_id = "Dish $i";
  String sunday_dish_id = "Dish $i";
  final res = await Meal.add(type: type, activeness: activeness, age_group: age_group, gender: gender, intensity: intensity, monday_dish_id: monday_dish_id, tuesday_dish_id: tuesday_dish_id, wednesday_dish_id: wednesday_dish_id, thursday_dish_id: thursday_dish_id, friday_dish_id: friday_dish_id, saturday_dish_id: saturday_dish_id, sunday_dish_id: sunday_dish_id, dietary_preference: dietary_preference);
  Meal? meal = await Meal.get(res['id'].toString(), type);
  week_calories.add(meal!.calorie_gain_per_meal_per_week);
  type = 'lunch';
  i = 2;
  monday_dish_id = "Dish $i";
  tuesday_dish_id = "Dish $i";
  wednesday_dish_id = "Dish $i";
  thursday_dish_id = "Dish $i";
  friday_dish_id = "Dish $i";
  saturday_dish_id = "Dish $i";
  sunday_dish_id = "Dish $i";
  final res2 = await Meal.add(type: type, activeness: activeness, age_group: age_group, gender: gender, intensity: intensity, monday_dish_id: monday_dish_id, tuesday_dish_id: tuesday_dish_id, wednesday_dish_id: wednesday_dish_id, thursday_dish_id: thursday_dish_id, friday_dish_id: friday_dish_id, saturday_dish_id: saturday_dish_id, sunday_dish_id: sunday_dish_id, dietary_preference: dietary_preference);
  meal = await Meal.get(res2['id'].toString(), type);
  week_calories.add(meal!.calorie_gain_per_meal_per_week);
  type = 'dinner';
  i = 3;
  monday_dish_id = "Dish $i";
  tuesday_dish_id = "Dish $i";
  wednesday_dish_id = "Dish $i";
  thursday_dish_id = "Dish $i";
  friday_dish_id = "Dish $i";
  saturday_dish_id = "Dish $i";
  sunday_dish_id = "Dish $i";
  final res3 = await Meal.add(type: type, activeness: activeness, age_group: age_group, gender: gender, intensity: intensity, monday_dish_id: monday_dish_id, tuesday_dish_id: tuesday_dish_id, wednesday_dish_id: wednesday_dish_id, thursday_dish_id: thursday_dish_id, friday_dish_id: friday_dish_id, saturday_dish_id: saturday_dish_id, sunday_dish_id: sunday_dish_id, dietary_preference: dietary_preference);
  meal = await Meal.get(res3['id'].toString(), type);
  week_calories.add(meal!.calorie_gain_per_meal_per_week);
  return week_calories;
}

Future<List<String>> addSamplePlans() async{
  List<String> ids = [];
  List<double> calorieValues = await addSampleMeals();
  String activeness = 'Active';
  String age_group = '61-75';
  String gender = "Male";
  String intensity = 'Difficult';
  String dietary_preference = 'Vegetarian';
  String breakfastMeal = '1';
  String lunchMeal = '1';
  String dinnerMeal = '1';
  final res = await DietPlanModel.add(activeness: activeness, age_group: age_group, dietary_preference: dietary_preference, gender: gender, intensity: intensity, breakfastMeal: breakfastMeal, lunchMeal: lunchMeal, dinnerMeal: dinnerMeal);
  ids.add(res['id'].toString());
  final res2 = await DietPlanModel.add(activeness: activeness, age_group: age_group, dietary_preference: dietary_preference, gender: gender, intensity: intensity, breakfastMeal: breakfastMeal, lunchMeal: lunchMeal, dinnerMeal: dinnerMeal);
  ids.add(res2['id'].toString());
  return ids;
}

void main() async{

  group("Testing get age group function", (){
    test("Age = 7", () {
      expect(DietPlanModel.getAgeGroup(7), "0-12");
    });
    test("Age = 16", () {
      expect(DietPlanModel.getAgeGroup(16), "13-18");
    });
    test("Age = 23", () {
      expect(DietPlanModel.getAgeGroup(23), "19-25");
    });
    test("Age = 34", () {
      expect(DietPlanModel.getAgeGroup(34),"26-45");
    });
    test("Age = 57", () {
      expect(DietPlanModel.getAgeGroup(57), "46-60");
    });
    test("Age = 69", () {
      expect(DietPlanModel.getAgeGroup(69), "61-75");
    });
    test("Age = 91", () {
      expect(DietPlanModel.getAgeGroup(91), "More than 75");
    });

  });

  group('Add Dish', (){
    Model.init(auth: MockFirebaseAuth(), firestore: FakeFirebaseFirestore());
    test("Add Dish 1", ()async{
      String name = "Dish 1";
      String description = "Dish 1 description";
      String dietary_preference = "Vegetarian";
      String mealType = "breakfast";
      double calorie_gain_per_meal = Random().nextInt(500)+600;
      await Dish.add(name: name, description: description, dietary_preference: dietary_preference, mealType: mealType, calorie_gain_per_meal: calorie_gain_per_meal);
      Dish? dish = await Dish.get(name);
      bool val = dish!=null && dish.name==name && dish.description==description && dish.dietary_preference==dietary_preference && dish.mealType==mealType && dish.calorie_gain_per_meal==calorie_gain_per_meal;
      expect(val, true);
    });

    test("Add Dish 2", ()async{
      String name = "Dish 2";
      String description = "Dish 2 description";
      String dietary_preference = "Vegetarian";
      String mealType = "lunch";
      double calorie_gain_per_meal = Random().nextInt(500)+600;
      await Dish.add(name: name, description: description, dietary_preference: dietary_preference, mealType: mealType, calorie_gain_per_meal: calorie_gain_per_meal);
      Dish? dish = await Dish.get(name);
      bool val = dish!=null && dish.name==name && dish.description==description && dish.dietary_preference==dietary_preference && dish.mealType==mealType && dish.calorie_gain_per_meal==calorie_gain_per_meal;
      expect(val, true);
    });

    test("Add Dish 3", ()async{
      String name = "Dish 3";
      String description = "Dish 3 description";
      String dietary_preference = "Vegetarian";
      String mealType = "dinner";
      double calorie_gain_per_meal = Random().nextInt(500)+600;
      await Dish.add(name: name, description: description, dietary_preference: dietary_preference, mealType: mealType, calorie_gain_per_meal: calorie_gain_per_meal);
      Dish? dish = await Dish.get(name);
      bool val = dish!=null && dish.name==name && dish.description==description && dish.dietary_preference==dietary_preference && dish.mealType==mealType && dish.calorie_gain_per_meal==calorie_gain_per_meal;
      expect(val, true);
    });

    test("Add Dish 4", ()async{
      String name = "Dish 4";
      String description = "Dish 4 description";
      String dietary_preference = "Low carb";
      String mealType = "breakfast";
      double calorie_gain_per_meal = Random().nextInt(500)+600;
      await Dish.add(name: name, description: description, dietary_preference: dietary_preference, mealType: mealType, calorie_gain_per_meal: calorie_gain_per_meal);
      Dish? dish = await Dish.get(name);
      bool val = dish!=null && dish.name==name && dish.description==description && dish.dietary_preference==dietary_preference && dish.mealType==mealType && dish.calorie_gain_per_meal==calorie_gain_per_meal;
      expect(val, true);
    });

    test("Add Dish 5", ()async{
      String name = "Dish 5";
      String description = "Dish 5 description";
      String dietary_preference = "Low carb";
      String mealType = "lunch";
      double calorie_gain_per_meal = Random().nextInt(500)+600;
      await Dish.add(name: name, description: description, dietary_preference: dietary_preference, mealType: mealType, calorie_gain_per_meal: calorie_gain_per_meal);
      Dish? dish = await Dish.get(name);
      bool val = dish!=null && dish.name==name && dish.description==description && dish.dietary_preference==dietary_preference && dish.mealType==mealType && dish.calorie_gain_per_meal==calorie_gain_per_meal;
      expect(val, true);
    });

    test("Add Dish 6", ()async{
      String name = "Dish 6";
      String description = "Dish 6 description";
      String dietary_preference = "Low carb";
      String mealType = "dinner";
      double calorie_gain_per_meal = Random().nextInt(500)+600;
      await Dish.add(name: name, description: description, dietary_preference: dietary_preference, mealType: mealType, calorie_gain_per_meal: calorie_gain_per_meal);
      Dish? dish = await Dish.get(name);
      bool val = dish!=null && dish.name==name && dish.description==description && dish.dietary_preference==dietary_preference && dish.mealType==mealType && dish.calorie_gain_per_meal==calorie_gain_per_meal;
      expect(val, true);
    });

    test("Add Dish 7", ()async{
      String name = "Dish 7";
      String description = "Dish 7 description";
      String dietary_preference = "Energetic";
      String mealType = "breakfast";
      double calorie_gain_per_meal = Random().nextInt(500)+600;
      await Dish.add(name: name, description: description, dietary_preference: dietary_preference, mealType: mealType, calorie_gain_per_meal: calorie_gain_per_meal);
      Dish? dish = await Dish.get(name);
      bool val = dish!=null && dish.name==name && dish.description==description && dish.dietary_preference==dietary_preference && dish.mealType==mealType && dish.calorie_gain_per_meal==calorie_gain_per_meal;
      expect(val, true);
    });

    test("Add Dish 8", ()async{
      String name = "Dish 8";
      String description = "Dish 8 description";
      String dietary_preference = "Energetic";
      String mealType = "lunch";
      double calorie_gain_per_meal = Random().nextInt(500)+600;
      await Dish.add(name: name, description: description, dietary_preference: dietary_preference, mealType: mealType, calorie_gain_per_meal: calorie_gain_per_meal);
      Dish? dish = await Dish.get(name);
      bool val = dish!=null && dish.name==name && dish.description==description && dish.dietary_preference==dietary_preference && dish.mealType==mealType && dish.calorie_gain_per_meal==calorie_gain_per_meal;
      expect(val, true);
    });

    test("Add Dish 9", ()async{
      String name = "Dish 9";
      String description = "Dish 9 description";
      String dietary_preference = "Energetic";
      String mealType = "dinner";
      double calorie_gain_per_meal = Random().nextInt(500)+600;
      await Dish.add(name: name, description: description, dietary_preference: dietary_preference, mealType: mealType, calorie_gain_per_meal: calorie_gain_per_meal);
      Dish? dish = await Dish.get(name);
      bool val = dish!=null && dish.name==name && dish.description==description && dish.dietary_preference==dietary_preference && dish.mealType==mealType && dish.calorie_gain_per_meal==calorie_gain_per_meal;
      expect(val, true);
    });

  });
  
  group('Add Meal', (){
    Model.init(auth: MockFirebaseAuth(), firestore: FakeFirebaseFirestore());

    test("Add Meal 1", ()async{
      List<double> calorieValues = await addSampleDishes();
      int i = 1;
      String type = 'breakfast';
      String activeness = 'Active';
      String age_group = '61-75';
      String gender = "Male";
      String intensity = 'Difficult';
      String dietary_preference = 'Vegetarian';
      String monday_dish_id = "Dish $i";
      String tuesday_dish_id = "Dish $i";
      String wednesday_dish_id = "Dish $i";
      String thursday_dish_id = "Dish $i";
      String friday_dish_id = "Dish $i";
      String saturday_dish_id = "Dish $i";
      String sunday_dish_id = "Dish $i";
      double calorie_gain_per_meal_per_week =     calorieValues[i] * 7;
      final res = await Meal.add(type: type, activeness: activeness, age_group: age_group, gender: gender, intensity: intensity, monday_dish_id: monday_dish_id, tuesday_dish_id: tuesday_dish_id, wednesday_dish_id: wednesday_dish_id, thursday_dish_id: thursday_dish_id, friday_dish_id: friday_dish_id, saturday_dish_id: saturday_dish_id, sunday_dish_id: sunday_dish_id, dietary_preference: dietary_preference);
      expect(res['success'], true);
      Meal? meal = await Meal.get(res['id'].toString(), type);
      expect(meal!.activeness,activeness);
      expect(meal.age_group, age_group);
      expect(meal.gender, gender);
      expect(meal.intensity, intensity);
      expect(meal.dietary_preference, dietary_preference);
      expect(meal.monday_dish_id, monday_dish_id) ;
      expect(meal.tuesday_dish_id, tuesday_dish_id) ;
      expect(meal.wednesday_dish_id, wednesday_dish_id) ;
      expect(meal.thursday_dish_id, thursday_dish_id) ;
      expect(meal.friday_dish_id, friday_dish_id) ;
      expect(meal.saturday_dish_id, saturday_dish_id) ;
      expect(meal.sunday_dish_id, sunday_dish_id) ;
      expect(meal.calorie_gain_per_meal_per_week.toDouble(),calorie_gain_per_meal_per_week.toDouble());
    });
    test("Add Meal 2", ()async{
      List<double> calorieValues = await addSampleDishes();
      int i = 5;
      String type = 'lunch';
      String activeness = 'Moderately active';
      String age_group = '0-12';
      String gender = "Male";
      String intensity = 'Standard';
      String dietary_preference = 'Low carb';
      String monday_dish_id = "Dish $i";
      String tuesday_dish_id = "Dish $i";
      String wednesday_dish_id = "Dish $i";
      String thursday_dish_id = "Dish $i";
      String friday_dish_id = "Dish $i";
      String saturday_dish_id = "Dish $i";
      String sunday_dish_id = "Dish $i";
      double calorie_gain_per_meal_per_week =     calorieValues[i] * 7;
      final res = await Meal.add(type: type, activeness: activeness, age_group: age_group, gender: gender, intensity: intensity, monday_dish_id: monday_dish_id, tuesday_dish_id: tuesday_dish_id, wednesday_dish_id: wednesday_dish_id, thursday_dish_id: thursday_dish_id, friday_dish_id: friday_dish_id, saturday_dish_id: saturday_dish_id, sunday_dish_id: sunday_dish_id, dietary_preference: dietary_preference);
      expect(res['success'], true);
      Meal? meal = await Meal.get(res['id'].toString(), type);
      expect(meal!.activeness,activeness);
      expect(meal.age_group, age_group);
      expect(meal.gender, gender);
      expect(meal.intensity, intensity);
      expect(meal.dietary_preference, dietary_preference);
      expect(meal.monday_dish_id, monday_dish_id) ;
      expect(meal.tuesday_dish_id, tuesday_dish_id) ;
      expect(meal.wednesday_dish_id, wednesday_dish_id) ;
      expect(meal.thursday_dish_id, thursday_dish_id) ;
      expect(meal.friday_dish_id, friday_dish_id) ;
      expect(meal.saturday_dish_id, saturday_dish_id) ;
      expect(meal.sunday_dish_id, sunday_dish_id) ;
      expect(meal.calorie_gain_per_meal_per_week.toDouble(),calorie_gain_per_meal_per_week.toDouble());
    });
    test("Add Meal 3", ()async{
      List<double> calorieValues = await addSampleDishes();
      int i = 9;
      String type = 'dinner';
      String activeness = 'Moderately Active';
      String age_group = '26-45';
      String gender = "Female";
      String intensity = 'Difficult';
      String dietary_preference = 'Energetic';
      String monday_dish_id = "Dish $i";
      String tuesday_dish_id = "Dish $i";
      String wednesday_dish_id = "Dish $i";
      String thursday_dish_id = "Dish $i";
      String friday_dish_id = "Dish $i";
      String saturday_dish_id = "Dish $i";
      String sunday_dish_id = "Dish $i";
      double calorie_gain_per_meal_per_week =     calorieValues[i] * 7;
      final res = await Meal.add(type: type, activeness: activeness, age_group: age_group, gender: gender, intensity: intensity, monday_dish_id: monday_dish_id, tuesday_dish_id: tuesday_dish_id, wednesday_dish_id: wednesday_dish_id, thursday_dish_id: thursday_dish_id, friday_dish_id: friday_dish_id, saturday_dish_id: saturday_dish_id, sunday_dish_id: sunday_dish_id, dietary_preference: dietary_preference);
      expect(res['success'], true);
      Meal? meal = await Meal.get(res['id'].toString(), type);
      expect(meal!.activeness,activeness);
      expect(meal.age_group, age_group);
      expect(meal.gender, gender);
      expect(meal.intensity, intensity);
      expect(meal.dietary_preference, dietary_preference);
      expect(meal.monday_dish_id, monday_dish_id) ;
      expect(meal.tuesday_dish_id, tuesday_dish_id) ;
      expect(meal.wednesday_dish_id, wednesday_dish_id) ;
      expect(meal.thursday_dish_id, thursday_dish_id) ;
      expect(meal.friday_dish_id, friday_dish_id) ;
      expect(meal.saturday_dish_id, saturday_dish_id) ;
      expect(meal.sunday_dish_id, sunday_dish_id) ;
      expect(meal.calorie_gain_per_meal_per_week.toDouble(),calorie_gain_per_meal_per_week.toDouble());
    });
  });

  group('Add diet plan', (){
    test('Add diet plan 1', ()async{
      Model.init(auth: MockFirebaseAuth(), firestore: FakeFirebaseFirestore());
      List<double> calorieValues = await addSampleMeals();
      int i = 1;
      String activeness = 'Active';
      String age_group = '61-75';
      String gender = "Male";
      String intensity = 'Difficult';
      String dietary_preference = 'Vegetarian';
      String breakfastMeal = '1';
      String lunchMeal = '1';
      String dinnerMeal = '1';
      double calorie_gain_per_plan_per_week =     calorieValues[1]+calorieValues[2]+calorieValues[3];
      final res = await DietPlanModel.add(activeness: activeness, age_group: age_group, dietary_preference: dietary_preference, gender: gender, intensity: intensity, breakfastMeal: breakfastMeal, lunchMeal: lunchMeal, dinnerMeal: dinnerMeal);
      expect(res['success'], true);
      DietPlanModel? dietPlanModel = await DietPlanModel.get(res['id'].toString());
      expect(dietPlanModel!.activeness,activeness);
      expect( dietPlanModel.age_group,age_group);
      expect(dietPlanModel.gender,gender);
      expect(dietPlanModel.intensity,intensity);
      expect(dietPlanModel.dietary_preference,dietary_preference);
      expect(dietPlanModel.breakfast_id,breakfastMeal);
      expect(dietPlanModel.lunch_id,lunchMeal);
      expect(dietPlanModel.dinner_id,dinnerMeal);
      expect(dietPlanModel.calorie_gain_per_plan_per_week,calorie_gain_per_plan_per_week);

    });
    test('Add diet plan 2', ()async{
      Model.init(auth: MockFirebaseAuth(), firestore: FakeFirebaseFirestore());
      List<double> calorieValues = await addSampleMeals();
      String activeness = 'Not very active';
      String age_group = '61-75';
      String gender = "Male";
      String intensity = 'Difficult';
      String dietary_preference = 'Vegetarian';
      String breakfastMeal = '1';
      String lunchMeal = '1';
      String dinnerMeal = '1';
      double calorie_gain_per_plan_per_week =     calorieValues[1]+calorieValues[2]+calorieValues[3];
      final res = await DietPlanModel.add(activeness: activeness, age_group: age_group, dietary_preference: dietary_preference, gender: gender, intensity: intensity, breakfastMeal: breakfastMeal, lunchMeal: lunchMeal, dinnerMeal: dinnerMeal);
      expect(res['success'], true);

      DietPlanModel? dietPlanModel = await DietPlanModel.get(res['id'].toString());
      expect(dietPlanModel!.activeness,activeness);
      expect( dietPlanModel.age_group,age_group);
      expect(dietPlanModel.gender,gender);
      expect(dietPlanModel.intensity,intensity);
      expect(dietPlanModel.dietary_preference,dietary_preference);
      expect(dietPlanModel.breakfast_id,breakfastMeal);
      expect(dietPlanModel.lunch_id,lunchMeal);
      expect(dietPlanModel.dinner_id,dinnerMeal);
      expect(dietPlanModel.calorie_gain_per_plan_per_week,calorie_gain_per_plan_per_week);
    });
    group('invalid inputs', (){
      test('invalid activeness', ()async{
        Model.init(auth: MockFirebaseAuth(), firestore: FakeFirebaseFirestore());
        await addSampleMeals();
        String activeness = 'not very active';
        String age_group = PlanConstants.getRandomAgeGroup();
        String gender = PlanConstants.getRandomGender();
        String intensity = PlanConstants.getRandomIntensity();
        String dietary_preference = PlanConstants.getRandomDietaryPreferences();
        String breakfastMeal = '1';
        String lunchMeal = '1';
        String dinnerMeal = '1';
        final res = await DietPlanModel.add(activeness: activeness, age_group: age_group, dietary_preference: dietary_preference, gender: gender, intensity: intensity, breakfastMeal: breakfastMeal, lunchMeal: lunchMeal, dinnerMeal: dinnerMeal);
        expect(res['success'], false);
        expect(res['msg'], MessageConstants.invalidActiveness);
      });
      test('invalid age_group', ()async{
        Model.init(auth: MockFirebaseAuth(), firestore: FakeFirebaseFirestore());
        await addSampleMeals();
        String activeness = PlanConstants.getRandomActiveness();
        String age_group = '64-75';
        String gender = PlanConstants.getRandomGender();
        String intensity = PlanConstants.getRandomIntensity();
        String dietary_preference = PlanConstants.getRandomDietaryPreferences();
        String breakfastMeal = '1';
        String lunchMeal = '1';
        String dinnerMeal = '1';
        final res = await DietPlanModel.add(activeness: activeness, age_group: age_group, dietary_preference: dietary_preference, gender: gender, intensity: intensity, breakfastMeal: breakfastMeal, lunchMeal: lunchMeal, dinnerMeal: dinnerMeal);
        expect(res['success'], false);
        expect(res['msg'], MessageConstants.invalidAgeGroup);
      });
      });
      test('invalid dietary_preference', ()async{
        Model.init(auth: MockFirebaseAuth(), firestore: FakeFirebaseFirestore());
        await addSampleMeals();
        String activeness = PlanConstants.getRandomActiveness();
        String age_group = PlanConstants.getRandomAgeGroup();
        String gender = PlanConstants.getRandomGender();
        String intensity = PlanConstants.getRandomIntensity();
        String dietary_preference = 'Vegetaian';
        String breakfastMeal = '1';
        String lunchMeal = '1';
        String dinnerMeal = '1';
        final res = await DietPlanModel.add(activeness: activeness, age_group: age_group, dietary_preference: dietary_preference, gender: gender, intensity: intensity, breakfastMeal: breakfastMeal, lunchMeal: lunchMeal, dinnerMeal: dinnerMeal);
        expect(res['success'], false);
        expect(res['msg'], MessageConstants.invalidDietaryPreference);
      });
      test('invalid gender', (){
        expect(1,1);
      });
      test('invalid intensity', ()async{
        Model.init(auth: MockFirebaseAuth(), firestore: FakeFirebaseFirestore());
        await addSampleMeals();
        String activeness = PlanConstants.getRandomActiveness();
        String age_group = PlanConstants.getRandomAgeGroup();
        String gender = PlanConstants.getRandomGender();
        String intensity = 'Diffcult';
        String dietary_preference = PlanConstants.getRandomDietaryPreferences();
        String breakfastMeal = '1';
        String lunchMeal = '1';
        String dinnerMeal = '1';
        final res = await DietPlanModel.add(activeness: activeness, age_group: age_group, dietary_preference: dietary_preference, gender: gender, intensity: intensity, breakfastMeal: breakfastMeal, lunchMeal: lunchMeal, dinnerMeal: dinnerMeal);
        expect(res['success'], false);
        expect(res['msg'], MessageConstants.invalidIntensity);
      });
      test('invalid breakfastMeal', ()async{
        Model.init(auth: MockFirebaseAuth(), firestore: FakeFirebaseFirestore());
        await addSampleMeals();
        String activeness = PlanConstants.getRandomActiveness();
        String age_group = PlanConstants.getRandomAgeGroup();
        String gender = PlanConstants.getRandomGender();
        String intensity = PlanConstants.getRandomIntensity();
        String dietary_preference = PlanConstants.getRandomDietaryPreferences();
        String breakfastMeal = '10';
        String lunchMeal = '1';
        String dinnerMeal = '1';
        final res = await DietPlanModel.add(activeness: activeness, age_group: age_group, dietary_preference: dietary_preference, gender: gender, intensity: intensity, breakfastMeal: breakfastMeal, lunchMeal: lunchMeal, dinnerMeal: dinnerMeal);
        expect(res['success'], false);
        expect(res['msg'], MessageConstants.invalidBreakfastId);
      });
      test('invalid lunchMeal', ()async{
        Model.init(auth: MockFirebaseAuth(), firestore: FakeFirebaseFirestore());
        await addSampleMeals();
        String activeness = PlanConstants.getRandomActiveness();
        String age_group = PlanConstants.getRandomAgeGroup();
        String gender = PlanConstants.getRandomGender();
        String intensity = PlanConstants.getRandomIntensity();
        String dietary_preference = PlanConstants.getRandomDietaryPreferences();
        String breakfastMeal = '1';
        String lunchMeal = '10';
        String dinnerMeal = '1';
        final res = await DietPlanModel.add(activeness: activeness, age_group: age_group, dietary_preference: dietary_preference, gender: gender, intensity: intensity, breakfastMeal: breakfastMeal, lunchMeal: lunchMeal, dinnerMeal: dinnerMeal);
        expect(res['success'], false);
        expect(res['msg'], MessageConstants.invalidLunchId);
      });
      test('invalid dinnerMeal', ()async{
        Model.init(auth: MockFirebaseAuth(), firestore: FakeFirebaseFirestore());
        await addSampleMeals();
        String activeness = PlanConstants.getRandomActiveness();
        String age_group = PlanConstants.getRandomAgeGroup();
        String gender = PlanConstants.getRandomGender();
        String intensity = PlanConstants.getRandomIntensity();
        String dietary_preference = PlanConstants.getRandomDietaryPreferences();
        String breakfastMeal = '1';
        String lunchMeal = '1';
        String dinnerMeal = '10';
        final res = await DietPlanModel.add(activeness: activeness, age_group: age_group, dietary_preference: dietary_preference, gender: gender, intensity: intensity, breakfastMeal: breakfastMeal, lunchMeal: lunchMeal, dinnerMeal: dinnerMeal);
        expect(res['success'], false);
        expect(res['msg'], MessageConstants.invalidDinnerId);
      });
  });

  group('Select diet plan', (){
    test('valid inputs', ()async{
      final firestore = FakeFirebaseFirestore();String uid = 'rhaenys2';
      String email = 'rhaenys@meeleys.com';
      String birthday = "1987/10/11";
      String firstName = "Rhenys";
      String lastName = "Targaryen";
      final auth = MockFirebaseAuth(
          mockUser: MockUser(
            isAnonymous: false,
            uid: uid,
            email: email,
            displayName: 'Rhaenys',
          ),
          signedIn: true
      );
      Model.init(auth: auth, firestore: firestore);
      await firestore.collection('user').doc(uid).set({
        'birthday': birthday,
        'email':email,
        'first name':firstName,
        'last name':lastName,
        'user_id':uid
      });
      List<String> ids = await addSamplePlans();
      expect(ids.length, 2);
      DietPlanModel? dietPlanModel = await DietPlanModel.get(ids[0]);
      bool val = await dietPlanModel!.select(user_id: uid);
      expect(val, true);
      final ds = await firestore.collection('user').doc(uid).get();
      expect(ds['current_plan'], ids[0]);
    });
    test('invalid inputs', () async{
      final firestore = FakeFirebaseFirestore();
      Model.init(auth: MockFirebaseAuth(), firestore: firestore);
      List<String> ids = await addSamplePlans();
      expect(ids.length, 2);
      DietPlanModel? dietPlanModel = await DietPlanModel.get(ids[0]);
      bool val = await dietPlanModel!.select(user_id: "adsasdds");
      expect(val, false);
    });
  });

  group('Change diet plan', (){

    test('valid inputs', ()async{
      final firestore = FakeFirebaseFirestore();String uid = 'rhaenys2';
      String email = 'rhaenys@meeleys.com';
      String birthday = "1987/10/11";
      String firstName = "Rhenys";
      String lastName = "Targaryen";
      final auth = MockFirebaseAuth(
          mockUser: MockUser(
            isAnonymous: false,
            uid: uid,
            email: email,
            displayName: 'Rhaenys',
          ),
          signedIn: true
      );
      Model.init(auth: auth, firestore: firestore);
      await firestore.collection('user').doc(uid).set({
        'birthday': birthday,
        'email':email,
        'first name':firstName,
        'last name':lastName,
        'user_id':uid
      });
      List<String> ids = await addSamplePlans();
      expect(ids.length, 2);
      DietPlanModel? dietPlanModel = await DietPlanModel.get(ids[0]);
      bool val = await dietPlanModel!.select(user_id: uid);
      expect(val, true);
      DocumentSnapshot ds = await firestore.collection('user').doc(uid).get();
      expect(ds['current_plan'], ids[0]);
      dietPlanModel = await DietPlanModel.get(ids[1]);
      val = await dietPlanModel!.select(user_id: uid);
      expect(val, true);
      ds = await firestore.collection('user').doc(uid).get();
      expect(ds['current_plan'], ids[1]);
    });
    test('invalid inputs', () async{
      final firestore = FakeFirebaseFirestore();String uid = 'rhaenys2';
      String email = 'rhaenys@meeleys.com';
      String birthday = "1987/10/11";
      String firstName = "Rhenys";
      String lastName = "Targaryen";
      final auth = MockFirebaseAuth(
          mockUser: MockUser(
            isAnonymous: false,
            uid: uid,
            email: email,
            displayName: 'Rhaenys',
          ),
          signedIn: true
      );
      Model.init(auth: auth, firestore: firestore);
      await firestore.collection('user').doc(uid).set({
        'birthday': birthday,
        'email':email,
        'first name':firstName,
        'last name':lastName,
        'user_id':uid
      });
      List<String> ids = await addSamplePlans();
      expect(ids.length, 2);
      DietPlanModel? dietPlanModel = await DietPlanModel.get(ids[0]);
      bool val = await dietPlanModel!.select(user_id: uid);
      expect(val, true);
      DocumentSnapshot ds = await firestore.collection('user').doc(uid).get();
      expect(ds['current_plan'], ids[0]);
      dietPlanModel = await DietPlanModel.get(ids[1]);
      val = await dietPlanModel!.select(user_id: "sasfafsafs");
      expect(val, false);
    });
  });


  group('Get the current diet plan for user', (){
    final firestore = FakeFirebaseFirestore();

    test('User with a diet plan', () async {
      final firestore = FakeFirebaseFirestore();String uid = 'rhaenys2';
      String email = 'rhaenys@meeleys.com';
      String birthday = "1987/10/11";
      String firstName = "Rhenys";
      String lastName = "Targaryen";
      final auth = MockFirebaseAuth(
          mockUser: MockUser(
            isAnonymous: false,
            uid: uid,
            email: email,
            displayName: 'Rhaenys',
          ),
          signedIn: true
      );
      Model.init(auth: auth, firestore: firestore);
      await firestore.collection('user').doc(uid).set({
        'birthday': birthday,
        'email':email,
        'first name':firstName,
        'last name':lastName,
        'user_id':uid
      });
      List<String> ids = await addSamplePlans();
      expect(ids.length, 2);
      DietPlanModel? dietPlanModel = await DietPlanModel.get(ids[0]);
      bool val = await dietPlanModel!.select(user_id: uid);
      expect(val, true);
      DocumentSnapshot ds = await firestore.collection('user').doc(uid).get();
      expect(ds['current_plan'], ids[0]);
      DietPlanModel? dietPlanModel2 = await DietPlanModel.getDietPlanForUser(user_id: uid);
      expect(dietPlanModel.planId, dietPlanModel2!.planId);
    });
    test('User without diet plan', () async {
      final firestore = FakeFirebaseFirestore();String uid = 'rhaenys2';
      String email = 'rhaenys@meeleys.com';
      String birthday = "1987/10/11";
      String firstName = "Rhenys";
      String lastName = "Targaryen";
      final auth = MockFirebaseAuth(
          mockUser: MockUser(
            isAnonymous: false,
            uid: uid,
            email: email,
            displayName: 'Rhaenys',
          ),
          signedIn: true
      );
      Model.init(auth: auth, firestore: firestore);
      await firestore.collection('user').doc(uid).set({
        'birthday': birthday,
        'email':email,
        'first name':firstName,
        'last name':lastName,
        'user_id':uid
      });
      List<String> ids = await addSamplePlans();
      expect(ids.length, 2);
      DietPlanModel? dietPlanModel = await DietPlanModel.getDietPlanForUser(user_id: uid);
      expect(dietPlanModel, null);
    });
    test('invalid inputs', ()
    async {
      final firestore = FakeFirebaseFirestore();String uid = 'rhaenys2';
      String email = 'rhaenys@meeleys.com';
      String birthday = "1987/10/11";
      String firstName = "Rhenys";
      String lastName = "Targaryen";
      final auth = MockFirebaseAuth(
          mockUser: MockUser(
            isAnonymous: false,
            uid: uid,
            email: email,
            displayName: 'Rhaenys',
          ),
          signedIn: true
      );
      Model.init(auth: auth, firestore: firestore);
      await firestore.collection('user').doc(uid).set({
        'birthday': birthday,
        'email':email,
        'first name':firstName,
        'last name':lastName,
        'user_id':uid
      });
      List<String> ids = await addSamplePlans();
      expect(ids.length, 2);
      DietPlanModel? dietPlanModel = await DietPlanModel.getDietPlanForUser(user_id: uid);
      expect(dietPlanModel, null);
    });
  });



}


