


class Calorie_Calculator{

  //https://www.healthline.com/health/fitness-exercise/how-many-calories-do-i-burn-a-day#calories-burned-by-activity
  static Map<String, double>  activityLevelValues = {
  'Not very active' :  1.2,
  'Moderately active' : 1.55,
  'Active' : 1.725
  };

  static double calculateRMR(gender, height, weight, age){
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


  // Returns calorie burn per day in kgs
  static double calorieBurnPerDay(gender, height, weight, age, activeness){
    if(!activityLevelValues.containsKey(activeness)){
      throw Exception("Undefined activeness at calorieBurnPerDay in CalorieCalculator");
    }
    return calculateRMR(gender, height, weight, age) * activityLevelValues[activeness]!/7700;
  }

  static double calorieBurn(gender, height, weight, age, activeness, numDays){
    return numDays * calorieBurnPerDay(gender, height, weight, age, activeness);
  }


}


