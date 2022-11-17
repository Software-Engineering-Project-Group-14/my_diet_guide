

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_diet_guide/common/messgae_constants.dart';
import 'package:my_diet_guide/common/plan_constants.dart';
import 'package:my_diet_guide/models/Calorie_Calculator.dart';
import 'package:my_diet_guide/models/UserBiometrics.dart';

import '../common/image_path_constants.dart';
import 'Dish.dart';
import 'Meal.dart';
import 'Model.dart';

class DietPlanModel extends Model{
  late String planId;
  late String dietary_preference;
  late String gender;
  late String intensity;
  late String activeness;
  late String age_group;
  late String breakfast_id;
  late String lunch_id;
  late String dinner_id;
  late double calorie_gain_per_plan_per_week;
  late String imgPath;
  double diffValue = 0;

  DietPlanModel({
    required this.planId,
    required this.dietary_preference,
    required this.gender,
    required this.intensity,
    required this.activeness,
    required this.age_group,
    required this.breakfast_id,
    required this.lunch_id,
    required this.dinner_id,
    required this.calorie_gain_per_plan_per_week,
    required this.imgPath
  });

  @override
  String toString(){
    return "Dietary Preference: $dietary_preference\nGender: $gender\nIntensity: $intensity\nActiveness: $activeness\nAge group: $age_group\n";
  }

  // Getting agr group corresponding to given age
  static String getAgeGroup(int age){
    if(age>=0 && age<=12){
      return "0-12";
    }else if (age>=13 && age<=18){
      return "13-18";
    }else if (age>=19 && age<=25){
      return "19-25";
    }else if (age>=26 && age<=45){
      return "26-45";
    }else if (age>=46 && age<=60){
      return "46-60";
    }else if (age>=61 && age<=75){
      return "61-75";
    }else if (age>=75){
      return "More than 75";
    }else{
      return "";
    }
  }

  // Get all the plans for given parametres
  static Stream<QuerySnapshot> getPlanStream({
    required String dietary_preference,
    required String age_group,
    required String gender,
    required String intensity,
    required String activeness
  }){
    return Model.firestore!.collection('diet_plan')
        .where('dietary_preference', isEqualTo: dietary_preference)
        .snapshots();
  }

  // Get all the plans
  static Stream<QuerySnapshot> getCurrentPlanStream(){
    return Model.firestore!.collection('diet_plan').snapshots();
  }

  // Get sorted recommeneded plans for given parametres
  static Future<List<DietPlanModel>> getMostReccomendedPlans({
    required UserBiometrics userBiometrics,
    required String? currentPlanId,
  }) async{
    final qs = await Model.firestore!.collection('diet_plan')
        .where('dietary_preference', isEqualTo: userBiometrics.dietaryPreference).get();
    final dsList = qs.docs;
    List<DietPlanModel> recommendedPlans = [];
    for(int i=0;i<dsList.length;i++){
      DocumentSnapshot ds = dsList[i];
      if(currentPlanId!=null && ds['planId'] == currentPlanId){
        continue;
      }
      DietPlanModel curPlan = DietPlanModel(
          planId: ds['planId'],
          dietary_preference: ds['dietary_preference'],
          gender: ds['gender'],
          intensity: ds['intensity'],
          activeness: ds['activeness'],
          age_group: ds['age_group'],
          breakfast_id: ds['breakfast_id'],
          lunch_id: ds['lunch_id'],
          dinner_id: ds['dinner_id'],
          calorie_gain_per_plan_per_week: ds['calorie_gain_per_plan_per_week'].toDouble(),
          imgPath: ds["plan_image"]
      );
      //print(curPlan);
      recommendedPlans.add(curPlan);
    }
    int? numWeeks = 0;
    if(userBiometrics.intensity=="Easy"){
      numWeeks = PlanConstants.numWeeksForIntensity["Easy"];
    }else if(userBiometrics.intensity=="Standard"){
      numWeeks = PlanConstants.numWeeksForIntensity["Standard"];
    }else if(userBiometrics.intensity=="Difficult"){
      numWeeks = PlanConstants.numWeeksForIntensity["Difficult"];
    }
    double val = CalorieCalculator.calorieBurnInKg(userBiometrics.gender, userBiometrics.height, userBiometrics.weight, userBiometrics.age.toDouble(), userBiometrics.activeness, 7*numWeeks!);
    double reducedWeight = userBiometrics.calculated_current_weight - val;
    double weightDiff = userBiometrics.targetWeight - reducedWeight;
    double gainPerWeekInCalorie = CalorieCalculator.kgToClorie(weightDiff/numWeeks) ;
    for(int j=0; j<recommendedPlans.length; j++){
      DietPlanModel cur = recommendedPlans[j];
      cur.diffValue = (cur.calorie_gain_per_plan_per_week-gainPerWeekInCalorie).abs();
    }
    recommendedPlans.sort((DietPlanModel a, DietPlanModel b){
      return (a.diffValue-b.diffValue).toInt();
    });
    if(recommendedPlans.length<=6){
      return recommendedPlans;
    }
    List<DietPlanModel> retPlans = recommendedPlans.sublist(0,6);
    return retPlans;
  }

  // Get the subscribed diet plan for given user
  static Future<Map<String, dynamic>> getDietPlanForUser({required String user_id})async{
    bool? success;
    DietPlanModel? dietPlanModel;
    String? msg;
    // try{
    DocumentSnapshot ds = await Model.firestore!.collection("user").doc(user_id).get();
    Map<String, dynamic> data = ds.data() as Map<String, dynamic>;
    if(!data.keys.contains("current_plan")){
      success=false;
      msg = MessageConstants.NoRegisteredPlan;
    }else{
      String planId = data["current_plan"];
      ds = await Model.firestore!.collection("diet_plan").doc(planId).get();
      if(ds.data()==null){
        success=false;
        msg = MessageConstants.NoRegisteredPlan;
      }else{
        data = ds.data() as Map<String, dynamic>;
        dietPlanModel = DietPlanModel(
            planId: planId,
            dietary_preference: data["dietary_preference"],
            gender: data["gender"],
            intensity: data["intensity"],
            activeness: data["activeness"],
            age_group: data["age_group"],
            breakfast_id: data["breakfast_id"],
            lunch_id: data["lunch_id"],
            dinner_id: data["dinner_id"],
            calorie_gain_per_plan_per_week: data['calorie_gain_per_plan_per_week'].toDouble(),
            imgPath: data["plan_image"]
        );
        success = true;
      }
    }

    // }catch(error){
    //   return {
    //    'success': false
    //   };
    //  }
    return {
      'success': success,
      'dietPlan': dietPlanModel,
      'msg': msg
    };
  }

  // Assigns this diet plan for given user, returns true if success false otherwise
  // Used for select plan and change plan
  Future<bool> select({required String user_id}) async{
    try{
      final doc = Model.firestore!.collection('user').doc(user_id);
      final ds = await doc.get();
      if(ds.data() != null){
        await doc.set({'current_plan':planId}, SetOptions(merge: true));
        return true;
      }
      return false;
    }catch(error){
      return false;
    }
  }

  // Add plan setting relevant meal ids and returns new plan id or null if fails
  static Future<Map<String, dynamic>> add({
    required activeness,
    required age_group,
    required dietary_preference,
    required gender,
    required intensity,
    required breakfastMeal,
    required lunchMeal,
    required dinnerMeal}) async{
    bool success ;
    int? nextPlanId;
    String? msg;
    Meal? mealb = await Meal.get(breakfastMeal, 'breakfast');
    Meal? meall = await Meal.get(lunchMeal, 'lunch');
    Meal? meald = await Meal.get(dinnerMeal, 'dinner');
    if(!PlanConstants.activenessValues.contains(activeness)){
      success = false;
      msg = MessageConstants.invalidActiveness;
    }else if(!PlanConstants.intensityValues.contains(intensity)){
      success = false;
      msg = MessageConstants.invalidIntensity;
    } else if(!PlanConstants.age_groupValues.contains(age_group)){
      success = false;
      msg = MessageConstants.invalidAgeGroup;
    } else if(!PlanConstants.dietary_preferenceValues.contains(dietary_preference)){
      success = false;
      msg = MessageConstants.invalidDietaryPreference;
    } else if(mealb==null){
      success = false;
      msg = MessageConstants.invalidBreakfastId;
    } else if(meall==null){
      success = false;
      msg = MessageConstants.invalidLunchId;
    } else if(meald==null){
      success = false;
      msg = MessageConstants.invalidDinnerId;
    }else{
      DocumentSnapshot ds = await Model.firestore!.collection("diet_plan").doc("nextPlanId").get();
      if(ds.data()==null){
        nextPlanId = 1;
      }else{
        nextPlanId = ds["id"];
      }
      final breakfastId = ds["breakfast_id"];
      final breakfast = await Meal.get(breakfastId, 'breakfast');
      double Sum = 0;
      double x,y,z = 0;
      ds = await Model.firestore!.collection('breakfast').doc(breakfastMeal).get();
      x = ds['calorie_gain_per_meal_per_week'].toDouble();
      ds = await Model.firestore!.collection('lunch').doc(lunchMeal).get();
      y = ds['calorie_gain_per_meal_per_week'].toDouble();
      ds = await Model.firestore!.collection('dinner').doc(dinnerMeal).get();
      z = ds['calorie_gain_per_meal_per_week'].toDouble();
      Sum += x.toDouble() + y.toDouble() + z.toDouble();
      await Model.firestore!.collection("diet_plan").doc(nextPlanId.toString())
          .set({
        "planId":nextPlanId.toString(),
        "activeness": activeness,
        "age_group": age_group,
        "dietary_preference": dietary_preference,
        "gender": gender,
        "intensity": intensity,
        "breakfast_id": breakfastMeal,
        "lunch_id": lunchMeal,
        "dinner_id": dinnerMeal,
        "calorie_gain_per_plan_per_week": Sum,
        "plan_image": Dish.getImagePath(name: breakfast!.monday_dish_id, dietary_preference: ds["dietary_preference"], mealType: 'breakfast')
      });
      //print("Diet plan added");
      await Model.firestore!.collection("diet_plan").doc("nextPlanId").set(
          {"id":nextPlanId!+1}, SetOptions(merge: true));
      //print("Next plan id incremented = ${nextPlanId+1}");
      success = true;
    }

    return {
      'success':success,
      'id':nextPlanId,
      'msg':msg
    };
  }

  static Future<DietPlanModel?> get(String planId)async{
    try{
      DocumentSnapshot ds = await Model.firestore!.collection("diet_plan").doc(planId).get();
      return DietPlanModel(
          planId: planId,
          dietary_preference: ds["dietary_preference"],
          gender: ds["gender"],
          intensity: ds["intensity"],
          activeness: ds["activeness"],
          age_group: ds["age_group"],
          breakfast_id: ds["breakfast_id"],
          lunch_id: ds["lunch_id"],
          dinner_id: ds["dinner_id"],
          calorie_gain_per_plan_per_week: ds["calorie_gain_per_plan_per_week"].toDouble(),
          imgPath: ds["plan_image"]
      );
    }catch(error){
      return null;
    }

  }


}