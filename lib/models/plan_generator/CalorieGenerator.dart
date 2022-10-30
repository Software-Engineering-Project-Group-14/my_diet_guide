

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

  static void addRandomCalories() async{
      print(dishes.length);
    for(int i=0;i<dishes.length;i++){
      String dishName = dishes[i];
      print(dishName);
      final dishDoc = FirebaseFirestore.instance.collection('dish1').doc(dishName);
      dishDoc.update({
        'calorie_gain_per_meal': 500 + Random().nextInt(500)
      });
    }


  }






}