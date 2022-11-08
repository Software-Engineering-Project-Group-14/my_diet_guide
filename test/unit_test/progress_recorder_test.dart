

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_diet_guide/models/Calorie_Calculator.dart';
import 'package:test/test.dart';

void main() async{

  group("Record Progress", () {
    group("Recording breakfast", () {
      test("progress : Did not complete", () {
        expect(1,1);
      });
      test("progress : Partially Completed", () {
        expect(1,1);
      });
      test("progress : Completed", () {
        expect(1,1);
      });
      test("progress : Over ate", () {
        expect(1,1);
      });
    });
    group("Recording lunch", () {
      test("progress : Did not complete", () {
        expect(1,1);
      });
      test("progress : Partially Completed", () {
        expect(1,1);
      });
      test("progress : Completed", () {
        expect(1,1);
      });
      test("progress : Over ate", () {
        expect(1,1);
      });
    });
    group("Recording dinner", () {
      test("progress : Did not complete", () {
        expect(1,1);
      });
      test("progress : Partially Completed", () {
        expect(1,1);
      });
      test("progress : Completed", () {
        expect(1,1);
      });
      test("progress : Over ate", () {
        expect(1,1);
      });
    });

    group("Change record progress", (){
      test("Change from Completed to Over ate", () {
        expect(1,1);
      });
      test("Change from Did not complete to Partially Completed", () {
        expect(1,1);
      });

    });

    test("invalid inputs", () {
      expect(1,1);
    });

  });


}