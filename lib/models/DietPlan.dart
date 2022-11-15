

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_diet_guide/common/messgae_constants.dart';
import 'package:my_diet_guide/common/plan_constants.dart';

import '../common/image_path_constants.dart';
import 'Meal.dart';
import 'Model.dart';

class DietPlanModel extends Model{
  late String planId;
  late String img;
  late String dietary_preference;
  late String gender;
  late String intensity;
  late String activeness;
  late String age_group;
  late String breakfast_id;
  late String lunch_id;
  late String dinner_id;
  late double calorie_gain_per_plan_per_week;
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
    required this.calorie_gain_per_plan_per_week
  }){
    img = "${ImagePathConstants.prefix}/${ImagePathConstants.dietPlan}/$dietary_preference.png";
  }

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
  static List<DietPlanModel> getMostReccomendedPlans({
    required AsyncSnapshot<QuerySnapshot> snapshot,
    required String age_group,
    required String activeness,
    required String? currentPlanId,
    required String intensity
  }) {
    //print(intensity);
    List<DietPlanModel> recommendedPlans = [];
    QuerySnapshot<Object?>? data = snapshot.data;
    //print(data!.docs.length);
    for(int i=0; i<data!.docs.length; i++){
      var cur = data.docs[i];
      // print(cur);
      if(currentPlanId!=null && cur.id == currentPlanId){
        continue;
      }
      DietPlanModel curPlan = DietPlanModel(
          planId: cur.id,
          dietary_preference: cur.get('dietary_preference'),
          gender: cur.get('gender'),
          intensity: cur.get('intensity'),
          activeness: cur.get('activeness'),
          age_group: cur.get('age_group'),
          breakfast_id: cur.get('breakfast_id'),
          lunch_id: cur.get('lunch_id'),
          dinner_id: cur.get('dinner_id'), 
          calorie_gain_per_plan_per_week: cur.get('calorie_gain_per_plan_per_week')
      );
      //print(curPlan);
      recommendedPlans.add(curPlan);
    };
    int effValue = 1200;
    Map<String, int> intensityValues = {
      "Easy": 0,
      "Standard": effValue~/2,
      "Difficult": effValue
    };
    Map<String, int> activenessValues = {
      "Not very active": 0,
      "Moderately active": effValue~/2,
      "Active": effValue,
    };
    Map<String, int> ageGroupValues = {
      "0-12":0,
      "13-18":effValue~/6,
      "19-25":effValue~/3,
      "26-45":effValue~/2,
      "46-60":(2*effValue)~/3,
      "61-75":(5*effValue)~/6,
      "More than 75":effValue
    };
    // print("xxxxx");
    // print(recommendedPlans.length);
    // print("yyyy");
    // print(intensity);
    for(int j=0; j<recommendedPlans.length; j++){
      DietPlanModel cur = recommendedPlans[j];
      cur.diffValue = sqrt(
          pow((intensityValues[intensity]!-intensityValues[cur.intensity]!),2)+
              pow((activenessValues[activeness]!-activenessValues[cur.activeness]!),2)+
              pow((ageGroupValues[age_group]!-ageGroupValues[cur.age_group]!),2)
      );
    }
    // print("yyyy");
    recommendedPlans.sort((DietPlanModel a, DietPlanModel b){
      return (b.diffValue-a.diffValue).toInt();
    });
    //print(recommendedPlans);
    return recommendedPlans;
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
            calorie_gain_per_plan_per_week: data['calorie_gain_per_plan_per_week']
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
          "activeness": activeness,
          "age_group": age_group,
          "dietary_preference": dietary_preference,
          "gender": gender,
          "intensity": intensity,
          "breakfast_id": breakfastMeal,
          "lunch_id": lunchMeal,
          "dinner_id": dinnerMeal,
          "calorie_gain_per_plan_per_week": Sum
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
          calorie_gain_per_plan_per_week: ds["calorie_gain_per_plan_per_week"]
      );
    }catch(error){
      return null;
    }

  }


}