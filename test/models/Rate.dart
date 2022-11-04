import 'package:my_diet_guide/models/Rate.dart';
import 'package:test/test.dart';


void main(){

  group('Testing Group', (){
    test('This is testing 1', (){
      expect(RateModel.testSample(),8);
    });
    test('This is testing 2', (){
      expect(RateModel.testSample(),9);
    });
    test('This is testing 3', (){
      expect(RateModel.testSample(),8);
    });

  });



}