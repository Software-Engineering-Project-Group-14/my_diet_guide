

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

class CalorieGenerator{

  static final List<String> dishes = [
        "Breakfast super-shake",
        "Chia & oat breakfast scones with yogurt and berries",
        "Fruit & nut breakfast bowl",
        "High protein breakfast",
        "Vanilla & cinnamon breakfast rice",
        "Berry and nut butter porridge",
        "broccoli and peanut soba noodles",
        "Hoisin-glazed tofu with stir-fried brown rice",
        "Spiced squash, spinach and lentil soup",
        "sweet potato and lentil curry",
        "Vibrant curried salmon dish",
        "Broccoli pasta salad with eggs & sunflower seeds",
        "Smoked salmon, quinoa & dill lunch pot",
        "Stir-fry chilli beef with sweet potato jackets",
        "Tomato, pepper & bean one-pot",
        "Turkey & clementine lunch bowl",
        "Avocado Eggs with Bacon Sails",
        "Crispy egg-free low carb almond pancakes",
        "Fried Eggs and Veggies",
        "Low carb ricotta and lemon pancakes",
        "Scrambled Eggs",
        "Chicken bake with garlic croutons",
        "Chicken, sweet potato & coconut curry",
        "Fragrant carrot, coconut & lentil soup",
        "Grilled napa cabbage",
        "Lentil soup",
        "Spiced carrot & lentil soup",
        "Summer fish stew",
        "Cajun Shrimp and Sausage Vegetable Skillet",
        "Cauliflower Broccoli Ham Salad",
        "Chopped Power Salad with Chicken",
        "Cucumber, Tomato, and Avocado Salad",
        "Green Goddess Salad with Chicken",
        "Loaded Broccoli Salad",
        "Tuna Salad with Egg",
        "Blueberry Pancakes",
        "Blueberry Smoothie",
        "Cinnamon Apples",
        "Easy French Toast",
        "Oatmeal pancakes",
        "Overnight Oats",
        "Burnt aubergine veggie chilli",
        "Golden Cauliflower Dal with Spinach, Red Lentils and Coconut",
        "Indian Fried Rice",
        "Lentil Dal with Spinach Sauce",
        "Roasted Cauliflower Pasta with Toasted Walnuts, Parsley, Garlic and Lemon Zest",
        "Sweet potato & peanut curry",
        "Chickpea Spinach Salad",
        "Lentil Quinoa Salad",
        "Pineapple fried rice",
        "Spicy cauliflower & halloumi rice",
        "Sweet potato & lentil soup",
        "Veggie-loaded flatbread",
      ];

  static List<String> days = [
        "monday",
        "tuesday",
        "wednesday",
        "thursday",
        "friday",
        "saturday",
        "sunday"
  ];

  static List<String> mealNames = [
        "breakfast",
        "lunch",
        "dinner"
  ];

  static void addRandomCalories() async{
    for(int i=0;i<dishes.length;i++){
      String dishName = dishes[i];
      final dishDoc = FirebaseFirestore.instance.collection('dish1').doc(dishName);
      dishDoc.update({
        'calorie_gain_per_meal': 500 + Random().nextInt(500)
      });
    }
  }

  static void setCalorieSum(meal, id) async{
        id = id.toString();
        final doc_ = FirebaseFirestore.instance.collection(meal).doc(id);
        DocumentSnapshot ds = await doc_.get();
        double Sum = 0;
        for(int i=0;i<7;i++){
              final dishDoc = await FirebaseFirestore.instance.collection("dish1").doc(ds["${days[i]}_dish_id"]).get();
              Sum += dishDoc['calorie_gain_per_meal'];
        }
        doc_.update({
              'calorie_gain_per_meal_per_week': Sum,
        });
  }


  static void setAllCalorieSums() async{
        for(int i=1;i<=37;i++){
              print(i);
              if(i<37){
                    setCalorieSum('breakfast', i);
              }
              if(i<=27){
                    setCalorieSum('lunch', i);
              }
              setCalorieSum('dinner', i);
        }

  }

  static Future<double> getMealSum(meal, id) async{
        id = id.toString();
        final doc_ = await FirebaseFirestore.instance.collection(meal).doc(id).get();
        return doc_["calorie_gain_per_meal_per_week"];
  }


  static void setPlanCalorieSums() async{
        double Sum = 0;
        double x = 0;
        for(int i=0;i<101;i++){
              final doc_ = FirebaseFirestore.instance.collection("diet_plan").doc(i.toString());
              final ds = await doc_.get();
              Sum = 0;
              for(int j=0;j<3;j++){
                    x = await getMealSum(mealNames[j], ds["${mealNames[j]}_id"]);
                    x=x.toDouble();
                    Sum+=x;
              }
              doc_.update({
                    'calorie_gain_per_plan_per_week': Sum,
              });
        }
  }




}