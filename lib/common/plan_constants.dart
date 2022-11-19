
import 'dart:math';

class PlanConstants{

  static const caloriePerKg = 7700;

  static const List<String> activenessValues = [
    "Not very active",
    "Moderately active",
    "Active"
  ];

  static const List<String> intensityValues = [
    "Easy",
    "Standard",
    "Difficult"
  ];

  static const int maxDaysPerDiet = 200;

  static const List<String> age_groupValues = [
    "0-12",
    "13-18",
    "19-25",
    "26-45",
    "46-60",
    "61-75",
    "More than 75"
  ];

  static const List<String> dietary_preferenceValues = [
    "Energetic",
    "Vegetarian",
    "Low carb"
  ];

  static const List<String> genderValues = [
    "Male",
    "Female"
  ];

  static const List<String> recordProgressValues = [
    "Did not complete",
    "Partially Completed",
    "Completed",
    "Over ate"
  ];

  static String getRandomActiveness(){
    return activenessValues[Random().nextInt(activenessValues.length)];
  }

  static String getRandomAgeGroup(){
    return age_groupValues[Random().nextInt(age_groupValues.length)];
  }

  static String getRandomIntensity(){
    return intensityValues[Random().nextInt(intensityValues.length)];
  }

  static String getRandomDietaryPreferences(){
    return dietary_preferenceValues[Random().nextInt(dietary_preferenceValues.length)];
  }

  static String getRandomGender(){
    return genderValues[Random().nextInt(genderValues.length)];
  }




}