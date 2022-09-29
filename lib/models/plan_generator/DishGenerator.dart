



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class DishGenerator{

  List<String> dishTypes = ["Energetic", "Low carb", "Vegetarian"];
  List<String> dishMeals = ["Breakfast", "Dinner", "Lunch"];
  bool loading = true;

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

  static Stream<QuerySnapshot> getDishStream(){
    return FirebaseFirestore.instance.collection('dish').snapshots();
  }


  Map<String, String> getDishData(String name){
    for(int i=0;i<dishTypes.length;i++){
      for(int j=0;j<dishMeals.length;j++){
        List<String> cur = dishes[dishTypes[i]]![dishMeals[j]]!;
        if(cur.contains(name)){
          return {
            "dietary_preference": dishTypes[i],
            "meal": dishMeals[j],
            "dish_image": "assets/images/dishes/${dishTypes[i]}/${dishMeals[j]}/${name}.png",
            "success": "true"
          };
        }
      }
    }
    return {"success":"false"};
  }

  Future<void> setDishes(AsyncSnapshot<QuerySnapshot> snapshot) async{
    QuerySnapshot<Object?>? data = snapshot.data;
    for(int i=0; i<data!.docs.length; i++){
      var cur = data.docs[i];
      try{

        // print(cur["dish_name"]);

        Map<String, String> dishData = getDishData(cur["dish_name"]);
        if(dishData["success"]=="false"){
          print(cur["dish_name"]);
          continue;
        }
        await FirebaseFirestore.instance.collection("dish1").doc(cur["dish_name"])
            .set({
          "description": cur['description'],
          "dietary_preference": dishData["dietary_preference"],
          "meal": dishData["meal"],
          "dish_image": dishData["dish_image"],
        });
        // print(cur);
        //print(cur.id);
        //print(curPlan);
      }catch (error){
        print(cur.toString());
      }

    };
  }


}