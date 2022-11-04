
import 'package:my_diet_guide/models/DietPlan.dart';
import 'package:test/test.dart';


void main() async{

  group("Testing get age group function", (){
    test("Age = 7", () {
      expect(DietPlanModel.getAgeGroup(7), "0-12");
    });
    test("Age = 16", () {
      expect(DietPlanModel.getAgeGroup(16), "13-18");
    });
    test("Age = 23", () {
      expect(DietPlanModel.getAgeGroup(23), "19-25");
    });
    test("Age = 34", () {
      expect(DietPlanModel.getAgeGroup(34),"26-45");
    });
    test("Age = 57", () {
      expect(DietPlanModel.getAgeGroup(57), "46-60");
    });
    test("Age = 69", () {
      expect(DietPlanModel.getAgeGroup(69), "61-75");
    });
    test("Age = 91", () {
      expect(DietPlanModel.getAgeGroup(91), "More than 75");
    });

  });

}


/*
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBG6hB8dbhSyv4wnMM08rPCGVX-ttX8tNY",
        appId: "1:946107548040:android:dd03aea3530fcabeedba3d",
        messagingSenderId: "946107548040",
        projectId: "my-diet-guide-14",
      )
  );
  group('Testing Diet Plan Model', () {
    test('Diet Plan Adding', () async{
      String? val = await DietPlanModel.add(
        activeness: "Moderately active",
          age_group: "19-25",
          dietary_preference: "Low carb",
          gender: "Male",
          intensity: "Standard",
          breakfastMeal: "4",
          lunchMeal: "24",
          dinnerMeal: "4"
      );
      bool exists = false;
      if(val!=null){
        final doc = await FirebaseFirestore.instance.collection('UserData').doc(val.toString()).get();
        exists = doc.exists;
      }
     expect(exists, true);
    });
  });

}

*/