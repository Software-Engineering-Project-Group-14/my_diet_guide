


import 'package:cloud_firestore/cloud_firestore.dart';

import 'Model.dart';

class CalorieCalculator extends Model{

  static Map<String, double>  activityLevelValues = {
  'Not very active' :  1.2,
  'Moderately active' : 1.55,
  'Active' : 1.725
  };

  static List<String> days = [
    "monday",
    "tuesday",
    "wednesday",
    "thursday",
    "friday",
    "saturday",
    "sunday"
  ];

  // Calculates Resting Metabolic Rate from given gender, height, weight and age
  // Gender is "Male" or "Female"
  // height in centimetres
  // weight in kg
  // age in years
  static double calculateRMR(String gender, double height, double weight, double age){
    double val = 0;
    if(gender == "Male"){
      val = 9.99 * weight + 6.25 * height - 4.92 * age + 5;
    }else if(gender == "Female"){
      val = 9.99 * weight + 6.25 * height - 4.92 * age - 161;
    }else{
      throw Exception("Undefined gender at calculateBMR in CalorieCalculator");
    }
    return val;
  }
  
  // Calculates calorie burned per day by given gender, height, weight, age and activeness and converts to kgs
  // Gender is "Male" or "Female"
  // height in centimetres
  // weight in kg
  // age in years
  // activeness is 'Not very active' or 'Moderately active' or 'Active'
  static double calorieBurnPerDayInKg(String gender, double height, double weight, double age, String activeness){
    if(!activityLevelValues.containsKey(activeness)){
      throw Exception("Undefined activeness at calorieBurnPerDay in CalorieCalculator");
    }
    return calorieToKg(calculateRMR(gender, height, weight, age) * activityLevelValues[activeness]!);
  }

  // Calculates calorie burned by given number of days, gender, height, weight, age and activeness and converts to kgs
  // Gender is "Male" or "Female"
  // height in centimetres
  // weight in kg
  // age in years
  // activeness is 'Not very active' or 'Moderately active' or 'Active'
  static double calorieBurnInKg(String gender, double height, double weight, double age, String activeness, int numDays){
    return numDays * calorieBurnPerDayInKg(gender, height, weight, age, activeness);
  }
  
  // Converts given calorie to weight (loss) in kgs
  static double calorieToKg(double calorie){
    return calorie/7700;
  }

  // Converts given kg to calorie
  static double kgToClorie(double kg){
    return kg*7700;
  }


  // Updates calorie sum per given meal per week
  static void setCalorieSum({required meal,required id}) async{
    id = id.toString();
    final doc_ = Model.firestore!.collection(meal).doc(id);
    DocumentSnapshot ds = await doc_.get();
    double Sum = 0;
    for(int i=0;i<7;i++){
      final dishDoc = await Model.firestore!.collection("dish").doc(ds["${days[i]}_dish_id"]).get();
      Sum += dishDoc['calorie_gain_per_meal'];
    }
    doc_.update({
      'calorie_gain_per_meal_per_week': Sum,
    });
  }


}


