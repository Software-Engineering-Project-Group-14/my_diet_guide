import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_diet_guide/widgets/background_image.dart';

class AddMeals extends StatefulWidget {

  final String dietary_preference;
  final String activeness;
  final String intensity;
  final String gender;
  final String ageGroup;

  const AddMeals({Key? key, required this.dietary_preference, required this.activeness, required this.intensity, required this.gender, required this.ageGroup}) : super(key: key);

  @override
  State<AddMeals> createState() => _AddMealsState();
}

class _AddMealsState extends State<AddMeals> {

  final GlobalKey<FormState> _breakfastFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _lunchFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _dinnerFormKey = GlobalKey<FormState>();

  late List<String> breakfastDishes;
  String? monday_breakfast_dish;
  String? tuesday_breakfast_dish;
  String? wednesday_breakfast_dish;
  String? thursday_breakfast_dish;
  String? friday_breakfast_dish;
  String? saturday_breakfast_dish;
  String? sunday_breakfast_dish;


  late List<String> lunchDishes;
  String? monday_lunch_dish;
  String? tuesday_lunch_dish;
  String? wednesday_lunch_dish;
  String? thursday_lunch_dish;
  String? friday_lunch_dish;
  String? saturday_lunch_dish;
  String? sunday_lunch_dish;


  late List<String> dinnerDishes;
  String? monday_dinner_dish;
  String? tuesday_dinner_dish;
  String? wednesday_dinner_dish;
  String? thursday_dinner_dish;
  String? friday_dinner_dish;
  String? saturday_dinner_dish;
  String? sunday_dinner_dish;


  DropdownMenuItem<String> buildMenuItem(String dp) =>
      DropdownMenuItem(
        value: dp,
        child: Text(dp, style: TextStyle(fontSize: 20, color: Colors.white),),
      );


  Future<List<String>> readBreakfastDishes() async {
    final dietaryPreference = widget.dietary_preference;

    final dishesDoc = FirebaseFirestore.instance.collection('dish').where('dietary_preference', isEqualTo: dietaryPreference).where('meal', isEqualTo: 'Breakfast');
    final dishesSnapshot = await dishesDoc.get();

    final List<String> list = dishesSnapshot.docs.map((doc) => doc.data()!['name'].toString()).toList();

    return list;
  }


  Future<List<String>> readLunchDishes(List<String> lunchDishes) async {
    final dietaryPreference = widget.dietary_preference;

    final dishesDoc = FirebaseFirestore.instance.collection('dish').where('dietary_preference', isEqualTo: dietaryPreference).where('meal', isEqualTo: 'Lunch');
    final dishesSnapshot = await dishesDoc.get();

    lunchDishes = dishesSnapshot.docs.map((doc) => doc.data()!['name'].toString()).toList();

    return lunchDishes;
  }



  Future<List<String>> readDinnerDishes(List<String> dinnerDishes) async {
    final dietaryPreference = widget.dietary_preference;

    final dishesDoc = FirebaseFirestore.instance.collection('dish').where('dietary_preference', isEqualTo: dietaryPreference).where('meal', isEqualTo: 'Dinner');
    final dishesSnapshot = await dishesDoc.get();

    final dinnerDishes = dishesSnapshot.docs.map((doc) => doc.data()!['name'].toString()).toList();

    return dinnerDishes;
  }



  Widget createWholeDropDowns(List<String> list, String? monday_dish, String? tuesday_dish){
    return Column(
      children: [
        createOneDropDown(list, "Monday Breakfast Dish", monday_dish),

        SizedBox(height: 20,),

        createOneDropDown(list, "Tuesday Breakfast Dish", tuesday_dish),

        SizedBox(height: 20,),

      ],
    );
  }



  Widget createOneDropDown(List<String> list, String hint, String? dish){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Container(
        width: 370,
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 40),
        decoration: BoxDecoration(color: Colors.grey.shade600.withOpacity(0.6), borderRadius: BorderRadius.circular(16)),
        child: DropdownButtonHideUnderline(
          child: DropdownButtonFormField<String>(
            hint: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                hint,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            value: dish,
            items: list.map(buildMenuItem).toList(),
            validator: (value){
              if(value==null){
                return 'Select a field';
              }
              return null;
            },
            onChanged: (value) => setState(() {
              dish=value!;
            }),
            isExpanded: true,
            borderRadius: BorderRadius.circular(16),
            dropdownColor: Colors.grey.shade600.withOpacity(0.6),

          ),
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.only(top: 50, bottom: 50),
                  child: Text("Add Meals",
                      style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Form(
                      key: _breakfastFormKey,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(28),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            width: 400,
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
                                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                                  child: Text("Breakfast",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                    ),
                                  ),
                                ),

                                FutureBuilder<List<String>>(
                                  future: readBreakfastDishes(),
                                  builder: (context, snapshot){
                                    if(snapshot.hasData){
                                      breakfastDishes = snapshot.data!;
                                      if(breakfastDishes==null){
                                        return Center(child: Text("No User!"));
                                      } else {
                                        return createWholeDropDowns(breakfastDishes, monday_breakfast_dish, tuesday_breakfast_dish);
                                      }
                                    } else if(snapshot.hasError){
                                      return Text('Something went wrong!');
                                    } else {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                  }
                                ),

                              ],
                            ),
                          ),
                        ),
                      )
                    ),



                    Form(
                        key: _lunchFormKey,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(28),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              width: 400,
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
                                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                                    child: Text("Lunch",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white
                                      ),
                                    ),
                                  ),




                                ],
                              ),
                            ),
                          ),
                        )
                    ),



                    Form(
                        key: _dinnerFormKey,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(28),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              width: 400,
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
                                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                                    child: Text("Dinner",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white
                                      ),
                                    ),
                                  ),





                                ],
                              ),
                            ),
                          ),
                        )
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
