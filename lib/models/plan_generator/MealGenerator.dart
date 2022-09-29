import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_diet_guide/models/plan_generator/DishGenerator.dart';
import 'package:my_diet_guide/models/plan_generator/PlanGenerator.dart';

class MealGenerator{

  final Map<String, Map<String, List<String> >> dishes = {
    "Energetic": {
      "Breakfast":[
        "Breakfast super-shake",
        "Chia & oat breakfast scones with yogurt and berries",
        "Fruit & nut breakfast bowl",
        "High protein breakfast",
        "Vanilla & cinnamon breakfast rice",
      ],
      "Dinner":[
        "Berry and nut butter porridge",
        "broccoli and peanut soba noodles",
        "Hoisin-glazed tofu with stir-fried brown rice",
        "Spiced squash, spinach and lentil soup",
        "sweet potato and lentil curry",
        "Vibrant curried salmon dish",
      ],
      "Lunch":[
        "Broccoli pasta salad with eggs & sunflower seeds",
        "Smoked salmon, quinoa & dill lunch pot",
        "Stir-fry chilli beef with sweet potato jackets",
        "Tomato, pepper & bean one-pot",
        "Turkey & clementine lunch bowl",
      ]
    },
    "Low carb": {
      "Breakfast":[
        "Avocado Eggs with Bacon Sails",
        "Crispy egg-free low carb almond pancakes",
        //"Egg butter with smoked salmon and avocado",
        "Fried Eggs and Veggies",
        "Low carb ricotta and lemon pancakes",
        // "Mushroom omelet",
        "Scrambled Eggs",
      ],
      "Dinner":[
        "Chicken bake with garlic croutons",
        "Chicken, sweet potato & coconut curry",
        "Fragrant carrot, coconut & lentil soup",
        "Grilled napa cabbage",
        "Lentil soup",
        "Spiced carrot & lentil soup",
        "Summer fish stew",
      ],
      "Lunch":[
        "Cajun Shrimp and Sausage Vegetable Skillet",
        "Cauliflower Broccoli Ham Salad",
        "Chopped Power Salad with Chicken",
        "Cucumber, Tomato, and Avocado Salad",
        "Green Goddess Salad with Chicken",
        "Loaded Broccoli Salad",
        "Tuna Salad with Egg",
      ]
    },
    "Vegetarian": {
      "Breakfast":[
        "Blueberry Pancakes",
        "Blueberry Smoothie",
        "Cinnamon Apples",
        "Easy French Toast",
        "Oatmeal pancakes",
        "Overnight Oats",
      ],
      "Dinner":[
        "Burnt aubergine veggie chilli",
        "Golden Cauliflower Dal with Spinach, Red Lentils and Coconut",
        "Indian Fried Rice",
        "Lentil Dal with Spinach Sauce",
        "Roasted Cauliflower Pasta with Toasted Walnuts, Parsley, Garlic and Lemon Zest",
        "Sweet potato & peanut curry",
      ],
      "Lunch":[
        "Chickpea Spinach Salad",
        "Lentil Quinoa Salad",
        "Pineapple fried rice",
        "Spicy cauliflower & halloumi rice",
        "Sweet potato & lentil soup",
        "Veggie-loaded flatbread",
      ]
    },
  };

  Future<void> generate() async{

    int breakfastCount = 0;
    int lunchCount = 0;
    int dinnerCount = 0;

    for(int i=0;i<100;i++){
      print(i);
      String dishType = getRandomDishType();
      String dishMeal = getRandomDishMeal();
      int index = 0;
      if(dishMeal=="Breakfast") {
        breakfastCount+=1;
        index = breakfastCount;
      } else if(dishMeal=="Dinner") {
        dinnerCount+=1;
        index = dinnerCount;
      } else if(dishMeal =="Lunch") {
        lunchCount+=1;
        index = lunchCount;
      }
      String activeness = PlanGenerator().getRandomActiveness();
      String intensity = PlanGenerator().getRandomIntensity();
      String age_group = PlanGenerator().getRandomAgeGroup();
      String gender = PlanGenerator().getRandomGender();
      await FirebaseFirestore.instance.collection(dishMeal.toLowerCase()).doc(index.toString())
          .set({
        "activeness": activeness,
        "age_group": age_group,
        "dietary_preference": dishType,
        "gender": gender,
        "intensity": intensity,
        "monday_dish_id": getRandomDish(dishType, dishMeal),
        "tuesday_dish_id": getRandomDish(dishType, dishMeal),
        "wednesday_dish_id": getRandomDish(dishType, dishMeal),
        "thursday_dish_id": getRandomDish(dishType, dishMeal),
        "friday_dish_id": getRandomDish(dishType, dishMeal),
        "saturday_dish_id": getRandomDish(dishType, dishMeal),
        "sunday_dish_id": getRandomDish(dishType, dishMeal),
      });
    }

    print("Breakfast count : $breakfastCount");
    print("Lunch count : $lunchCount");
    print("Dinner count : $dinnerCount");



  }

  String getRandomDishType(){
    List<String> dishTypes = ["Energetic", "Low carb", "Vegetarian"];
    return dishTypes[Random().nextInt(dishTypes.length)];
  }

  String getRandomDishMeal(){
    List<String> dishMeals = ["Breakfast", "Dinner", "Lunch"];
    return dishMeals[Random().nextInt(dishMeals.length)];
  }

  String getRandomDish(type, meal){
    return dishes[type]![meal]![Random().nextInt(dishes[type]![meal]!.length)];
  }



}