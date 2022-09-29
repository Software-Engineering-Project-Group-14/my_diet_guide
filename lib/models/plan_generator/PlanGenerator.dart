import 'dart:math';

import 'package:firebase_core/firebase_core.dart';



class PlanGenerator{

  Future<void> generate() async{


    String intensity = getRandomIntensity();
    String activeness = getRandomActiveness();
    String age_group = getRandomAgeGroup();
    String dietaryPreferance = getDietaryPreferance();






  }

  String getRandomIntensity(){
    List<String> intensityValues = [
      "Easy",
      "Standard",
      "Difficult"
    ];
    return intensityValues[Random().nextInt(intensityValues.length)];
  }

  String getRandomActiveness(){
    List<String> activenessValues = [
      "Not very active",
      "Moderately active",
      "Active",
    ];
    return activenessValues[Random().nextInt(activenessValues.length)];
  }

  String getRandomAgeGroup(){
    List<String> ageGroupValues = [
      "0-12",
      "13-18",
      "19-25",
      "26-45",
      "46-60",
      "61-75",
      "More than 75"
    ];
    return ageGroupValues[Random().nextInt(ageGroupValues.length)];
  }

  String getDietaryPreferance(){
    List<String> dietaryPreferanceValues = [
      "energetic",
      "low carb",
      "vegetarian"
    ];
    return dietaryPreferanceValues[Random().nextInt(dietaryPreferanceValues.length)];
  }


}