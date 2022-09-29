

import 'package:cloud_firestore/cloud_firestore.dart';

class DietGenerator{

  List<String> dishTypes = ["energetic", "low carb", "vegetarian"];
  List<String> dishMeals = ["breakfast", "dinner", "lunch"];

  final Map<String, Map<String, List<String> >> dishes = {
    "energetic": {
      "breakfast":[
        "Breakfast super-shake",
        "Chia & oat breakfast scones with yogurt and berries",
        "Fruit & nut breakfast bowl",
        "High protein breakfast",
        "Vanilla & cinnamon breakfast rice",
      ],
      "low carb":[
        "Berry and nut butter porridge",
        "broccoli and peanut soba noodles",
        "Hoisin-glazed tofu with stir-fried brown rice",
        "Spiced squash, spinach and lentil soup",
        "sweet potato and lentil curry",
        "Vibrant curried salmon dish",
      ],
      "vegetarian":[
        "Broccoli pasta salad with eggs & sunflower seeds",
        "Smoked salmon, quinoa & dill lunch pot",
        "Stir-fry chilli beef with sweet potato jackets",
        "Tomato, pepper & bean one-pot",
        "Turkey & clementine lunch bowl",
      ]
    },
    "low carb": {
      "breakfast":[
        "Avocado Eggs with Bacon Sails",
        "Crispy egg-free low carb almond pancakes",
        "Egg butter with smoked salmon and avocado",
        "Fried Eggs and Veggies",
        "Low carb ricotta and lemon pancakes",
        "Mushroom omelet",
        "Scrambled Eggs",
      ],
      "low carb":[
        "Chicken bake with garlic croutons",
        "Chicken, sweet potato & coconut curry",
        "Fragrant carrot, coconut & lentil soup",
        "Grilled napa cabbage",
        "Lentil soup",
        "Spiced carrot & lentil soup",
        "Summer fish stew,",
      ],
      "vegetarian":[
        "Cajun Shrimp and Sausage Vegetable Skillet",
        "Cauliflower Broccoli Ham Salad",
        "Chopped Power Salad with Chicken",
        "Cucumber, Tomato, and Avocado Salad",
        "Green Goddess Salad with Chicken",
        "Loaded Broccoli Salad",
        "Tuna Salad with Egg",
      ]
    },
    "vegetarian": {
      "breakfast":[
        "Blueberry Pancakes",
        "Blueberry Smoothie",
        "Cinnamon Apples",
        "Easy French Toast",
        "Oatmeal pancakes",
        "Overnight Oats",
      ],
      "low carb":[
        "Burnt aubergine veggie chilli",
        "Golden Cauliflower Dal with Spinach, Red Lentils and Coconut",
        "Indian Fried Rice",
        "Lentil Dal with Spinach Sauce",
        "Roasted Cauliflower Pasta with Toasted Walnuts, Parsley, Garlic and Lemon Zest",
        "Sweet potato & peanut curry",
      ],
      "vegetarian":[
        "Chickpea Spinach Salad",
        "Lentil Quinoa Salad",
        "Pineapple fried rice",
        "Spicy cauliflower & halloumi rice",
        "Sweet potato & lentil soup",
        "Veggie-loaded flatbread",
      ]
    },
  };

  late final Map<String, Map<String, List<String> >> dishIds = {

  };
  
  DietGenerator(){
    FirebaseFirestore.instance.collection("dish").where("fss", isEqualTo: );
    for(int i=0;i<dishTypes.length;i++){
      for(int j=0;j<dishMeals.length;j++){
        dishes[dishTypes[i]]![dishMeals[j]]
      }
    }

  }

  Future<void> generate() async {
    
  }




}