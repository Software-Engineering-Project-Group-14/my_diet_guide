import 'dart:math';

import 'package:my_diet_guide/models/Calorie_Calculator.dart';
import 'package:test/test.dart';


void main(){
  
  group('Calorie Calculator', (){

    group('Calculate RMR', (){
      test("For Male, 180cm, 60kg, 30 years", (){
        String gender = "Male";
        double weight = 60;
        double height = 180;
        double age = 30;
        double val = 9.99 * weight + 6.25 * height - 4.92 * age + 5;
        expect(CalorieCalculator.calculateRMR(gender, height, weight, age), val);
      });

      test("For Female, 140cm, 50kg, 70 years (RMR=1382)", (){
        String gender = "Female";
        double weight = 50;
        double height = 140;
        double age = 70;
        double val = 9.99 * weight + 6.25 * height - 4.92 * age - 161;
        expect(CalorieCalculator.calculateRMR(gender, height, weight, age), val);
      });
    });

    group('Calorie to kg Conversion', (){
      test('Conversion', (){
        for(int i=0;i<10;i++){
          double randCalorie = Random().nextDouble() * 1000;
          expect(CalorieCalculator.calorieToKg(randCalorie), randCalorie/7700);
        }
      });
    });
    
    group('Calculate Calorie burn per day in kgs', (){
      Map<String, double>  activityLevelValues = {
        'Not very active' :  1.2,
        'Moderately active' : 1.55,
        'Active' : 1.725
      };
      test("For not very active male", () {
          String gender = "Male";
          double weight = 60;
          double height = 180;
          double age = 30;
          double rmr = 9.99 * weight + 6.25 * height - 4.92 * age + 5;
          String activeness = "Not very active";
          double val = rmr * activityLevelValues[activeness]!/7700;
          expect(CalorieCalculator.calorieBurnPerDayInKg(gender, height, weight, age, activeness), val);
      });
      test("For moderately active male", () {
        String gender = "Male";
        double weight = 60;
        double height = 180;
        double age = 30;
        double rmr = 9.99 * weight + 6.25 * height - 4.92 * age + 5;
        String activeness = "Moderately active";
        double val = rmr * activityLevelValues[activeness]!/7700;
        expect(CalorieCalculator.calorieBurnPerDayInKg(gender, height, weight, age, activeness), val);
      });
      test("For active male", () {
        String gender = "Male";
        double weight = 60;
        double height = 180;
        double age = 30;
        double rmr = 9.99 * weight + 6.25 * height - 4.92 * age + 5;
        String activeness = "Active";
        double val = rmr * activityLevelValues[activeness]!/7700;
        expect(CalorieCalculator.calorieBurnPerDayInKg(gender, height, weight, age, activeness), val);
      });
      test("For not very active female", () {
        String gender = "Female";
        double weight = 60;
        double height = 180;
        double age = 30;
        double rmr = 9.99 * weight + 6.25 * height - 4.92 * age - 161;
        String activeness = "Not very active";
        double val = rmr * activityLevelValues[activeness]!/7700;
        expect(CalorieCalculator.calorieBurnPerDayInKg(gender, height, weight, age, activeness), val);
      });
      test("For moderately active female", () {
        String gender = "Female";
        double weight = 60;
        double height = 180;
        double age = 30;
        double rmr = 9.99 * weight + 6.25 * height - 4.92 * age - 161;
        String activeness = "Moderately active";
        double val = rmr * activityLevelValues[activeness]!/7700;
        expect(CalorieCalculator.calorieBurnPerDayInKg(gender, height, weight, age, activeness), val);
      });
      test("For active female", () {
        String gender = "Female";
        double weight = 60;
        double height = 180;
        double age = 30;
        double rmr = 9.99 * weight + 6.25 * height - 4.92 * age - 161;
        String activeness = "Active";
        double val = rmr * activityLevelValues[activeness]!/7700;
        expect(CalorieCalculator.calorieBurnPerDayInKg(gender, height, weight, age, activeness), val);
      });


    });

    group('Calculate Calorie burn in kgs', (){
      Map<String, double>  activityLevelValues = {
        'Not very active' :  1.2,
        'Moderately active' : 1.55,
        'Active' : 1.725
      };
      test("For not very active male", () {
        String gender = "Male";
        double weight = 60;
        double height = 180;
        double age = 30;
        double rmr = 9.99 * weight + 6.25 * height - 4.92 * age + 5;
        String activeness = "Not very active";
        int numDays = 30;
        double valPerDay = rmr * activityLevelValues[activeness]!/7700;
        double val = valPerDay * numDays;
        expect(CalorieCalculator.calorieBurnInKg(gender, height, weight, age, activeness, numDays), val);
      });
      test("For moderately active male", () {
        String gender = "Male";
        double weight = 60;
        double height = 180;
        double age = 30;
        double rmr = 9.99 * weight + 6.25 * height - 4.92 * age + 5;
        String activeness = "Moderately active";
        int numDays = 30;
        double valPerDay = rmr * activityLevelValues[activeness]!/7700;
        double val = valPerDay * numDays;
        expect(CalorieCalculator.calorieBurnInKg(gender, height, weight, age, activeness, numDays), val);
      });
      test("For active male", () {
        String gender = "Male";
        double weight = 60;
        double height = 180;
        double age = 30;
        double rmr = 9.99 * weight + 6.25 * height - 4.92 * age + 5;
        String activeness = "Active";
        int numDays = 30;
        double valPerDay = rmr * activityLevelValues[activeness]!/7700;
        double val = valPerDay * numDays;
        expect(CalorieCalculator.calorieBurnInKg(gender, height, weight, age, activeness, numDays), val);
      });
      test("For not very active female", () {
        String gender = "Female";
        double weight = 60;
        double height = 180;
        double age = 30;
        double rmr = 9.99 * weight + 6.25 * height - 4.92 * age - 161;
        String activeness = "Not very active";
        double val = rmr * activityLevelValues[activeness]!/7700;
        expect(CalorieCalculator.calorieBurnPerDayInKg(gender, height, weight, age, activeness), val);
      });
      test("For moderately active female", () {
        String gender = "Female";
        double weight = 60;
        double height = 180;
        double age = 30;
        double rmr = 9.99 * weight + 6.25 * height - 4.92 * age - 161;
        String activeness = "Moderately active";
        int numDays = 30;
        double valPerDay = rmr * activityLevelValues[activeness]!/7700;
        double val = valPerDay * numDays;
        expect(CalorieCalculator.calorieBurnInKg(gender, height, weight, age, activeness, numDays), val);
      });
      test("For active female", () {
        String gender = "Female";
        double weight = 60;
        double height = 180;
        double age = 30;
        double rmr = 9.99 * weight + 6.25 * height - 4.92 * age - 161;
        String activeness = "Active";
        int numDays = 30;
        double valPerDay = rmr * activityLevelValues[activeness]!/7700;
        double val = valPerDay * numDays;
        expect(CalorieCalculator.calorieBurnInKg(gender, height, weight, age, activeness, numDays.toInt()), val);
      });


    });
    
    
  });
  
}
