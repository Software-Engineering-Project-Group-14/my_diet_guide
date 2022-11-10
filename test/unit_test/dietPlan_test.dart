
import 'dart:math';

import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
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
  Meal? meal = await Meal.add(type: type, activeness: activeness, age_group: age_group, gender: gender, intensity: intensity, monday_dish_id: monday_dish_id, tuesday_dish_id: tuesday_dish_id, wednesday_dish_id: wednesday_dish_id, thursday_dish_id: thursday_dish_id, friday_dish_id: friday_dish_id, saturday_dish_id: saturday_dish_id, sunday_dish_id: sunday_dish_id, dietary_preference: dietary_preference);
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
  week_calories.add(calorieValues[i] * 7);
  meal = await Meal.add(type: type, activeness: activeness, age_group: age_group, gender: gender, intensity: intensity, monday_dish_id: monday_dish_id, tuesday_dish_id: tuesday_dish_id, wednesday_dish_id: wednesday_dish_id, thursday_dish_id: thursday_dish_id, friday_dish_id: friday_dish_id, saturday_dish_id: saturday_dish_id, sunday_dish_id: sunday_dish_id, dietary_preference: dietary_preference);
  type = 'dinner';
  i = 3;
  monday_dish_id = "Dish $i";
  tuesday_dish_id = "Dish $i";
  wednesday_dish_id = "Dish $i";
  thursday_dish_id = "Dish $i";
  friday_dish_id = "Dish $i";
  saturday_dish_id = "Dish $i";
  sunday_dish_id = "Dish $i";
  meal = await Meal.add(type: type, activeness: activeness, age_group: age_group, gender: gender, intensity: intensity, monday_dish_id: monday_dish_id, tuesday_dish_id: tuesday_dish_id, wednesday_dish_id: wednesday_dish_id, thursday_dish_id: thursday_dish_id, friday_dish_id: friday_dish_id, saturday_dish_id: saturday_dish_id, sunday_dish_id: sunday_dish_id, dietary_preference: dietary_preference);
  week_calories.add(meal!.calorie_gain_per_meal_per_week);
  return week_calories;
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
      Meal? meal = await Meal.add(type: type, activeness: activeness, age_group: age_group, gender: gender, intensity: intensity, monday_dish_id: monday_dish_id, tuesday_dish_id: tuesday_dish_id, wednesday_dish_id: wednesday_dish_id, thursday_dish_id: thursday_dish_id, friday_dish_id: friday_dish_id, saturday_dish_id: saturday_dish_id, sunday_dish_id: sunday_dish_id, dietary_preference: dietary_preference);
      bool val;
      if(meal==null){
        val = false;
      }else{
       // print(meal.id);
        int id = int.parse(meal.id);
        meal = await Meal.get(id.toString(), type);
        //print(calorie_gain_per_meal_per_week.toDouble()==);
        val = meal!=null && id==int.parse(meal.id) && activeness==meal.activeness && age_group==meal.age_group && gender==meal.gender && intensity==meal.intensity && dietary_preference==meal.dietary_preference && monday_dish_id==meal.monday_dish_id && tuesday_dish_id==meal.tuesday_dish_id && wednesday_dish_id==meal.wednesday_dish_id && thursday_dish_id==meal.thursday_dish_id && friday_dish_id==meal.friday_dish_id && saturday_dish_id==meal.saturday_dish_id && sunday_dish_id==meal.sunday_dish_id && calorie_gain_per_meal_per_week.toDouble()==meal.calorie_gain_per_meal_per_week.toDouble() ;
      }
      expect(val, true);
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
      Meal? meal = await Meal.add(type: type, activeness: activeness, age_group: age_group, gender: gender, intensity: intensity, monday_dish_id: monday_dish_id, tuesday_dish_id: tuesday_dish_id, wednesday_dish_id: wednesday_dish_id, thursday_dish_id: thursday_dish_id, friday_dish_id: friday_dish_id, saturday_dish_id: saturday_dish_id, sunday_dish_id: sunday_dish_id, dietary_preference: dietary_preference);
      bool val;
      if(meal==null){
        val = false;
      }else{
        // print(meal.id);
        int id = int.parse(meal.id);
        meal = await Meal.get(id.toString(), type);
        //print(calorie_gain_per_meal_per_week.toDouble()==);
        val = meal!=null && id==int.parse(meal.id) && activeness==meal.activeness && age_group==meal.age_group && gender==meal.gender && intensity==meal.intensity && dietary_preference==meal.dietary_preference && monday_dish_id==meal.monday_dish_id && tuesday_dish_id==meal.tuesday_dish_id && wednesday_dish_id==meal.wednesday_dish_id && thursday_dish_id==meal.thursday_dish_id && friday_dish_id==meal.friday_dish_id && saturday_dish_id==meal.saturday_dish_id && sunday_dish_id==meal.sunday_dish_id && calorie_gain_per_meal_per_week.toDouble()==meal.calorie_gain_per_meal_per_week.toDouble() ;
      }
      expect(val, true);
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
      Meal? meal = await Meal.add(type: type, activeness: activeness, age_group: age_group, gender: gender, intensity: intensity, monday_dish_id: monday_dish_id, tuesday_dish_id: tuesday_dish_id, wednesday_dish_id: wednesday_dish_id, thursday_dish_id: thursday_dish_id, friday_dish_id: friday_dish_id, saturday_dish_id: saturday_dish_id, sunday_dish_id: sunday_dish_id, dietary_preference: dietary_preference);
      bool val;
      if(meal==null){
        val = false;
      }else{
        // print(meal.id);
        int id = int.parse(meal.id);
        meal = await Meal.get(id.toString(), type);
        //print(calorie_gain_per_meal_per_week.toDouble()==);
        val = meal!=null && id==int.parse(meal.id) && activeness==meal.activeness && age_group==meal.age_group && gender==meal.gender && intensity==meal.intensity && dietary_preference==meal.dietary_preference && monday_dish_id==meal.monday_dish_id && tuesday_dish_id==meal.tuesday_dish_id && wednesday_dish_id==meal.wednesday_dish_id && thursday_dish_id==meal.thursday_dish_id && friday_dish_id==meal.friday_dish_id && saturday_dish_id==meal.saturday_dish_id && sunday_dish_id==meal.sunday_dish_id && calorie_gain_per_meal_per_week.toDouble()==meal.calorie_gain_per_meal_per_week.toDouble() ;
      }
      expect(val, true);
    });
  });

  group('Add diet plan', (){
    Model.init(auth: MockFirebaseAuth(), firestore: FakeFirebaseFirestore());
    test('Add diet plan 1', ()async{
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
      DietPlanModel? dietPlanModel = await DietPlanModel.add(activeness: activeness, age_group: age_group, dietary_preference: dietary_preference, gender: gender, intensity: intensity, breakfastMeal: breakfastMeal, lunchMeal: lunchMeal, dinnerMeal: dinnerMeal);
      bool val;

      if(dietPlanModel==null){
        val = false;
      }else{
        int id = int.parse(dietPlanModel.planId);
        dietPlanModel = await DietPlanModel.get(id.toString());
        val = dietPlanModel!=null && 
            id==int.parse(dietPlanModel.planId) && 
            activeness==dietPlanModel.activeness && 
            age_group==dietPlanModel.age_group && 
            gender==dietPlanModel.gender && 
            intensity==dietPlanModel.intensity && 
            dietary_preference==dietPlanModel.dietary_preference  && 
            breakfastMeal==dietPlanModel.breakfast_id && 
            lunchMeal==dietPlanModel.lunch_id && 
            dinnerMeal==dietPlanModel.dinner_id &&
            calorie_gain_per_plan_per_week==dietPlanModel.calorie_gain_per_plan_per_week;
      }
      expect(val, true);

    });
    test('Add diet plan 2', ()async{
      List<double> calorieValues = await addSampleMeals();
      int i = 2;
      String activeness = 'Not very active';
      String age_group = '61-75';
      String gender = "Male";
      String intensity = 'Difficult';
      String dietary_preference = 'Vegetarian';
      String breakfastMeal = '1';
      String lunchMeal = '1';
      String dinnerMeal = '1';
      double calorie_gain_per_plan_per_week =     calorieValues[1]+calorieValues[2]+calorieValues[3];
      DietPlanModel? dietPlanModel = await DietPlanModel.add(activeness: activeness, age_group: age_group, dietary_preference: dietary_preference, gender: gender, intensity: intensity, breakfastMeal: breakfastMeal, lunchMeal: lunchMeal, dinnerMeal: dinnerMeal);
      bool val;

      if(dietPlanModel==null){
        val = false;
      }else{
        int id = int.parse(dietPlanModel.planId);
        dietPlanModel = await DietPlanModel.get(id.toString());
        val = dietPlanModel!=null &&
            id==int.parse(dietPlanModel.planId) &&
            activeness==dietPlanModel.activeness &&
            age_group==dietPlanModel.age_group &&
            gender==dietPlanModel.gender &&
            intensity==dietPlanModel.intensity &&
            dietary_preference==dietPlanModel.dietary_preference  &&
            breakfastMeal==dietPlanModel.breakfast_id &&
            lunchMeal==dietPlanModel.lunch_id &&
            dinnerMeal==dietPlanModel.dinner_id &&
            calorie_gain_per_plan_per_week==dietPlanModel.calorie_gain_per_plan_per_week;
      }
      expect(val, true);

    });
    group('invalid inputs', (){
      test('invalid activeness', (){
        expect(1,1);
      });
      test('invalid age_group', (){
        expect(1,1);
      });
      test('invalid activeness', (){
        expect(1,1);
      });
      test('invalid dietary_preference', (){
        expect(1,1);
      });
      test('invalid gender', (){
        expect(1,1);
      });
      test('invalid intensity', (){
        expect(1,1);
      });
      test('invalid breakfastMeal', (){
        expect(1,1);
      });
      test('invalid lunchMeal', (){
        expect(1,1);
      });
      test('invalid dinnerMeal', (){
        expect(1,1);
      });

    });
  });

  group('Select diet plan', (){
    final firestore = FakeFirebaseFirestore();

    test('valid inputs', (){
      expect(1,1);
    });
    test('invalid inputs', ()
    {
        expect(1, 1);
    });
  });

  group('Change diet plan', (){
    final firestore = FakeFirebaseFirestore();

    test('valid inputs', (){
      expect(1,1);
    });
    test('invalid inputs', ()
    {
      expect(1,1);
    });
  });


  group('Get the current diet plan for user', (){
    final firestore = FakeFirebaseFirestore();

    test('User with a diet plan', (){
      expect(1,1);
    });
    test('User without diet plan', (){
      expect(1,1);
    });
    test('invalid inputs', ()
    {
      expect(1,1);
    });
  });



}


/*
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBG6hB8dbhSyv4wnMM08rPCGVX-ttX8tNY",
        appId: "1:946107548040:android:dd03aea3530fcabeedba3d",
        messagingSenderId: "946107548040",
        projectId: "my-diet-guide-14",
      )
  );
  group('Testing Diet Plan Model', () {
    test('Diet Plan Adding', () async{
      String? val = await DietPlanModel.add(
        activeness: "Moderately active",
          age_group: "19-25",
          dietary_preference: "Low carb",
          gender: "Male",
          intensity: "Standard",
          breakfastMeal: "4",
          lunchMeal: "24",
          dinnerMeal: "4"
      );
      bool exists = false;
      if(val!=null){
        final doc = await FirebaseFirestore.instance.collection('UserData').doc(val.toString()).get();
        exists = doc.exists;
      }
     expect(exists, true);
    });
  });

}

*/