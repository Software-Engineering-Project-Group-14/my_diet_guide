import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_diet_guide/models/UserBiometrics.dart';
import 'package:my_diet_guide/screens/record_progress_screen.dart';
import 'package:my_diet_guide/widgets/blurred_background_image.dart';

import '../widgets/bottom_bar.dart';
import '../widgets/side_bar.dart';
import '../widgets/today_meal_card.dart';
import '../widgets/user_dash_header.dart';

class DietDetails extends StatefulWidget {
  final String user_id;
  final String day;
  const DietDetails({Key? key, required this.user_id, required this.day}) : super(key: key);

  @override
  State<DietDetails> createState() => _DietDetailsState();
}

class _DietDetailsState extends State<DietDetails> {

  late String dietplan_id;
  late String breakfast_id;
  late String lunch_id;
  late String dinner_id;

  late String breakfast_dishId;
  late String lunch_dishId;
  late String dinner_dishId;

  late String breakfast_dishName;
  late String breakfast_dishImage;
  late String breakfast_dishDescription;
  late String lunch_dishName;
  late String lunch_dishImage;
  late String lunch_dishDescription;
  late String dinner_dishName;
  late String dinner_dishImage;
  late String dinner_dishDescription;

  late String user_id = widget.user_id;
  late String day = widget.day;

  Future<String> getDietPlanId() async {
    final userDietDoc = FirebaseFirestore.instance.collection('user').doc(user_id);
    final snapshot1 = await userDietDoc.get();

    if(snapshot1.exists){
      dietplan_id = snapshot1.data()!['current_plan'];
      //print('dietplan_id : $dietplan_id');
    }

    return dietplan_id;
  }

  Future <Map<String, dynamic>> getDietPlanInfo(String dietplan_id) async {
    final dietplanDoc = FirebaseFirestore.instance.collection('diet_plan').doc(dietplan_id);
    //print(dietplanDoc);
    final snapshot2 = await dietplanDoc.get();
    if(snapshot2.exists){
      //print(snapshot2.data().toString());
      breakfast_id = snapshot2.data()!['breakfast_id'];
      lunch_id = snapshot2.data()!['lunch_id'];
      dinner_id = snapshot2.data()!['dinner_id'];
    } else {
      //print('snapshot2 does not exist');
    }

    //print('b id = $breakfast_id');
    //print('l id = $lunch_id');
    //print('d id = $dinner_id');

    return {
      'breakfast_id' : breakfast_id,
      'lunch_id' : lunch_id,
      'dinner_id' : dinner_id,
    };
  }

  Future<Map<String,dynamic>> readDish(String dish_id) async{
    final dish = FirebaseFirestore.instance.collection('dish1').doc(dish_id);
    final dishSnapshot = await dish.get();

    if(dishSnapshot.exists){
      String dishImage = dishSnapshot.data()!['dish_image'];
      String dishDescription = dishSnapshot.data()!['description'];

      //print('b dish: $dish_id, d image: $dishImage, d des: $dishDescription');

      return {
        'dishName': dish_id,
        'dishImage': dishImage,
        'dishDescription': dishDescription
      };
    }else {
      //print("dishSnapshot does not exist");
      return{};
    }
  }

  Future<String> readBreakfastDishId(Map<String, dynamic> map) async {
    breakfast_id = map['breakfast_id'];

    final breakfastDoc = FirebaseFirestore.instance.collection('breakfast').doc(breakfast_id);
    final breakfastSnapshot = await breakfastDoc.get();


    if(day=='Monday'){
      breakfast_dishId = breakfastSnapshot.data()!['monday_dish_id'];
    } else if(day=='Tuesday'){
      breakfast_dishId = breakfastSnapshot.data()!['tuesday_dish_id'];
    } else if(day=='Wednesday'){
      breakfast_dishId = breakfastSnapshot.data()!['wednesday_dish_id'];
    } else if(day=='Thursday'){
      breakfast_dishId = breakfastSnapshot.data()!['thursday_dish_id'];
    } else if(day=='Friday'){
      breakfast_dishId = breakfastSnapshot.data()!['friday_dish_id'];
    } else if(day=='Saturday'){
      breakfast_dishId = breakfastSnapshot.data()!['saturday_dish_id'];
    } else if(day=='Sunday'){
      breakfast_dishId = breakfastSnapshot.data()!['sunday_dish_id'];
    }

    //print('today_day : $today_day');
    //print('breakfast dish id : $breakfast_dishId');

    return breakfast_dishId;
  }

  Widget buildBreakfastMealCard(String dish_id){
    return FutureBuilder<Map<String,dynamic>>(
        future: readDish(dish_id),
        builder: (context, snapshot){
          if(snapshot.hasData){
            final breakfastDish = snapshot.data;
            return breakfastDish==null ? Center(child: Text("No User!"),) : buildMealCardBreakfast(breakfastDish!);
          } else if (snapshot.hasError){
            return Text('Something went wrong!');
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }
    );
  }

  Widget buildMealCardBreakfast(Map<String, dynamic> map){
    String dishName = map['dishName'];
    String dishImage = map['dishImage'];
    String dishDescription = map['dishDescription'];

    return MealCard(
        title: "Breakfast",
        mealName: dishName,
        imageLocation: dishImage,
        navigate: RecordProgressScreen(meal: 'Breakfast', dishImage: dishImage, dishName: dishName, user_id: user_id, description: dishDescription,)
    );

  }

  Widget buildBreakfast(Map<String, dynamic> map) {
    return FutureBuilder<String>(
        future: readBreakfastDishId(map),
        builder: (context, snapshot){
          if(snapshot.hasData){
            final breakfastDishId = snapshot.data;
            return breakfastDishId==null ? Center(child: Text("No User!"),) : buildBreakfastMealCard(breakfastDishId!);
          } else if (snapshot.hasError){
            return Text('Something went wrong!');
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }
    );
  }

  Future<String> readLunchDishId(Map<String, dynamic> map) async {
    lunch_id = map['lunch_id'];

    final lunchDoc = FirebaseFirestore.instance.collection('lunch').doc(lunch_id);
    final lunchSnapshot = await lunchDoc.get();


    if(day=='Monday'){
      lunch_dishId = lunchSnapshot.data()!['monday_dish_id'];
    } else if(day=='Tuesday'){
      lunch_dishId = lunchSnapshot.data()!['tuesday_dish_id'];
    } else if(day=='Wednesday'){
      lunch_dishId = lunchSnapshot.data()!['wednesday_dish_id'];
    } else if(day=='Thursday'){
      lunch_dishId = lunchSnapshot.data()!['thursday_dish_id'];
    } else if(day=='Friday'){
      lunch_dishId = lunchSnapshot.data()!['friday_dish_id'];
    } else if(day=='Saturday'){
      lunch_dishId = lunchSnapshot.data()!['saturday_dish_id'];
    } else if(day=='Sunday'){
      lunch_dishId = lunchSnapshot.data()!['sunday_dish_id'];
    }

    return lunch_dishId;
  }

  Widget buildLunchMealCard(String dish_id){
    return FutureBuilder<Map<String,dynamic>>(
        future: readDish(dish_id),
        builder: (context, snapshot){
          if(snapshot.hasData){
            final lunchDish = snapshot.data;
            return lunchDish==null ? Center(child: Text("No User!"),) : buildMealCardLunch(lunchDish!);
          } else if (snapshot.hasError){
            return Text('Something went wrong!');
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }
    );
  }

  Widget buildMealCardLunch(Map<String, dynamic> map){
    String dishName = map['dishName'];
    String dishImage = map['dishImage'];
    String dishDescription = map['dishDescription'];

    return MealCard(
        title: "Lunch",
        mealName: dishName,
        imageLocation: dishImage,
        navigate: RecordProgressScreen(meal: 'Lunch', dishImage: dishImage, dishName: dishName, user_id: user_id, description: dishDescription,)
    );

  }

  Widget buildLunch(Map<String, dynamic> map) {
    return FutureBuilder<String>(
        future: readLunchDishId(map),
        builder: (context, snapshot){
          if(snapshot.hasData){
            final lunchDishId = snapshot.data;
            return lunchDishId==null ? Center(child: Text("No User!"),) : buildLunchMealCard(lunchDishId!);
          } else if (snapshot.hasError){
            return Text('Something went wrong!');
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }
    );
  }

  Future<String> readDinnerDishId(Map<String, dynamic> map) async {
    dinner_id = map['dinner_id'];

    final dinnerDoc = FirebaseFirestore.instance.collection('dinner').doc(dinner_id);
    final dinnerSnapshot = await dinnerDoc.get();


    if(day=='Monday'){
      dinner_dishId = dinnerSnapshot.data()!['monday_dish_id'];
    } else if(day=='Tuesday'){
      dinner_dishId = dinnerSnapshot.data()!['tuesday_dish_id'];
    } else if(day=='Wednesday'){
      dinner_dishId = dinnerSnapshot.data()!['wednesday_dish_id'];
    } else if(day=='Thursday'){
      dinner_dishId = dinnerSnapshot.data()!['thursday_dish_id'];
    } else if(day=='Friday'){
      dinner_dishId = dinnerSnapshot.data()!['friday_dish_id'];
    } else if(day=='Saturday'){
      dinner_dishId = dinnerSnapshot.data()!['saturday_dish_id'];
    } else if(day=='Sunday'){
      dinner_dishId = dinnerSnapshot.data()!['sunday_dish_id'];
    }

    return dinner_dishId;
  }

  Widget buildDinnerMealCard(String dish_id){
    return FutureBuilder<Map<String,dynamic>>(
        future: readDish(dish_id),
        builder: (context, snapshot){
          if(snapshot.hasData){
            final dinnerDish = snapshot.data;
            return dinnerDish==null ? Center(child: Text("No User!"),) : buildMealCardDinner(dinnerDish!);
          } else if (snapshot.hasError){
            return Text('Something went wrong!');
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }
    );
  }

  Widget buildMealCardDinner(Map<String, dynamic> map){
    String dishName = map['dishName'];
    String dishImage = map['dishImage'];
    String dishDescription = map['dishDescription'];

    return MealCard(
        title: "Dinner",
        mealName: dishName,
        imageLocation: dishImage,
        navigate: RecordProgressScreen(meal: 'Dinner', dishImage: dishImage, dishName: dishName, user_id: user_id, description: dishDescription,)
    );

  }


  Widget buildDinner(Map<String, dynamic> map) {
    return FutureBuilder<String>(
        future: readDinnerDishId(map),
        builder: (context, snapshot){
          if(snapshot.hasData){
            final dinnerDishId = snapshot.data;
            return dinnerDishId==null ? Center(child: Text("No User!"),) : buildDinnerMealCard(dinnerDishId!);
          } else if (snapshot.hasError){
            return Text('Something went wrong!');
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }
    );
  }

  Widget buildMeals(String dietplan_id){

    String month = DateTime.now().month.toString().padLeft(2, '0');
    String date = DateTime.now().day.toString().padLeft(2, '0');
    String today = '${DateTime.now().year}/$month/$date';

    return ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: 360,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.white24, Colors.white10],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
              ),
              borderRadius: BorderRadius.circular(28),
              border: Border.all(width: 2, color: Colors.white10)
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15, right: 125),
                // child: Text("$today - $today_day", style: TextStyle(fontSize: 19, color: Colors.white,),),
              ),

              Divider(color: Colors.white , thickness: 2, indent: 20, endIndent: 20,),


              SizedBox(height: 20,),


              FutureBuilder<Map<String,dynamic>>(
                  future: getDietPlanInfo(dietplan_id),
                  builder: (context, snapshot){
                    if(snapshot.hasData){
                      final mealIDs = snapshot.data;
                      return mealIDs==null ? Center(child: Text("No User!"),) : buildBreakfast(mealIDs!);
                    } else if (snapshot.hasError){
                      return Text('Something went wrong!');
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }
              ),


              SizedBox(height: 15,),

              Divider(color: Colors.white , thickness: 2, indent: 20, endIndent: 20,),

              SizedBox(height: 15,),


              FutureBuilder<Map<String,dynamic>>(
                  future: getDietPlanInfo(dietplan_id),
                  builder: (context, snapshot){
                    if(snapshot.hasData){
                      final mealIDs = snapshot.data;
                      return mealIDs==null ? Center(child: Text("No User!"),) : buildLunch(mealIDs!);
                    } else if (snapshot.hasError){
                      return Text('Something went wrong!');
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }
              ),


              SizedBox(height: 15,),

              Divider(color: Colors.white , thickness: 2, indent: 20, endIndent: 20,),

              SizedBox(height: 15,),


              FutureBuilder<Map<String,dynamic>>(
                  future: getDietPlanInfo(dietplan_id),
                  builder: (context, snapshot){
                    if(snapshot.hasData){
                      final mealIDs = snapshot.data;
                      return mealIDs==null ? Center(child: Text("No User!"),) : buildDinner(mealIDs!);
                    } else if (snapshot.hasError){
                      return Text('Something went wrong!');
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }
              ),

              SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    // String user_id = widget.user_id;
    // return Stack(
    //   children:[
    //     // BlurredBackground(),
    //     Scaffold(
    //       // extendBodyBehindAppBar: true,
    //       // backgroundColor: Colors.transparent,
    //       backgroundColor: Colors.teal.shade900,
    //       appBar: AppBar(
    //         backgroundColor: Colors.teal.shade900,
    //         title: Text('Diet Details'),
    //         elevation: 0,
    //       ),
    //     body: Stack(
    //       children: [
    //         BlurredBackground(),
    //         SafeArea(
    //           child: SingleChildScrollView(
    //             child: Center(
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                   children: [
    //                     SizedBox(height: 10,),
    //
    //                     ClipRRect(
    //                       borderRadius: BorderRadius.circular(28),
    //                       child: BackdropFilter(
    //                         filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
    //                         child: Container(
    //                           width: 360,
    //                           decoration: BoxDecoration(
    //                               gradient: LinearGradient(
    //                                   colors: [Colors.white24, Colors.white10],
    //                                   begin: Alignment.topLeft,
    //                                   end: Alignment.bottomRight
    //                               ),
    //                               borderRadius: BorderRadius.circular(28),
    //                               border: Border.all(width: 2, color: Colors.white10)
    //                           ),
    //                           child: Column(
    //                             children: [
    //                               Padding(
    //                                 padding: const EdgeInsets.only(top: 15, right: 125),
    //                                 child: Text("2022/09/27 - Tuesday", style: TextStyle(fontSize: 19, color: Colors.white,),),
    //                               ),
    //
    //                               Divider(color: Colors.white , thickness: 2, indent: 20, endIndent: 20,),
    //
    //
    //                               SizedBox(height: 20,),
    //
    //
    //                               MealCard(title: "Breakfast", mealName: "Oatmeal with banana", imageLocation: 'assets/images/dishes/smoothie01.jpg', navigate: RecordProgressScreen(meal: 'Breakfast', dishImage: 'assets/images/dishes/smoothie01.jpg', dishName: 'Oatmeal with banana', user_id: user_id, description: '',)),
    //
    //
    //                               SizedBox(height: 15,),
    //
    //                               Divider(color: Colors.white , thickness: 2, indent: 20, endIndent: 20,),
    //
    //                               SizedBox(height: 15,),
    //
    //
    //                               MealCard(title: "Lunch", mealName: "Oatmeal with banana", imageLocation: 'assets/images/dishes/smoothie01.jpg', navigate: RecordProgressScreen(meal: 'Lunch', dishImage: 'assets/images/dishes/smoothie01.jpg', dishName: 'Oatmeal with banana', user_id:user_id, description: '',),),
    //
    //
    //                               SizedBox(height: 15,),
    //
    //                               Divider(color: Colors.white , thickness: 2, indent: 20, endIndent: 20,),
    //
    //                               SizedBox(height: 15,),
    //
    //
    //                               MealCard(title: "Dinner", mealName: "Oatmeal with banana", imageLocation: 'assets/images/dishes/smoothie01.jpg', navigate: RecordProgressScreen(meal: 'Dinner', dishImage: 'assets/images/dishes/smoothie01.jpg', dishName: 'Oatmeal with banana', user_id: user_id, description: '',),),
    //
    //
    //                               SizedBox(height: 30,),
    //                             ],
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //
    //
    //
    //                   ],
    //               ),
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //       bottomNavigationBar: BottomBar(user_id: widget.user_id),
    //   ),
    //   ]
    // );
    // String day = widget.day;
    // String user_id = widget.user_id;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.teal.shade900,

      appBar: AppBar(
        backgroundColor: Colors.teal.shade900,
        elevation: 0,
      ),

      drawer: NavigationDrawer(),

      body: Stack(
        children: [

          BlurredBackground(),

          SingleChildScrollView(
            child: Center(
              child: Column(
                children: [

                  SizedBox(height: 15,),

                  //current days diet plan
                   Container(
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 5,),
                            child: Text(
                              day+"'s Diet Plan",
                              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold, color: Colors.white.withOpacity(0.8)),
                            ),
                          ),
                        ],
                      ),
                    ),

                  SizedBox(height: 15,),


                  FutureBuilder<String>(
                      future: getDietPlanId(),
                      builder: (context, snapshot){
                        if(snapshot.hasData){
                          final dietplan_id = snapshot.data;
                          return dietplan_id==null ? Center(child: Text("No User!"),) : buildMeals(dietplan_id!);
                        } else if (snapshot.hasError){
                          return Text('Something went wrong!');
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }
                  ),


                  SizedBox(height: 50,),





                ],
              ),
            ),
          )

        ],
      ),

      bottomNavigationBar: BottomBar(user_id: user_id),
    );
  }
}
