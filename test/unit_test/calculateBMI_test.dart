
import 'package:flutter_test/flutter_test.dart';
import 'package:my_diet_guide/models/BMI.dart';


void main(){
  group('Calculate BMI', (){
    test("For a person with 75kg weight and 175cm height", (){
      double height = 175 / 100;
      double weight = 75;
      double heightSquare = height * height;
      double result = weight / heightSquare;
      expect(BMIModel(175, 75).calculateBMI(), result);
    });
    test("For a person with 65kg weight and 143cm height", (){
      double height = 143 / 100;
      double weight = 65;
      double heightSquare = height * height;
      double result = weight / heightSquare;
      expect(BMIModel(143, 65).calculateBMI(), result);
    });
    test("For a person with 83kg weight and 182cm height", (){
      double height = 182 / 100;
      double weight = 83;
      double heightSquare = height * height;
      double result = weight / heightSquare;
      expect(BMIModel(182, 83).calculateBMI(), result);
    });
  });
}
