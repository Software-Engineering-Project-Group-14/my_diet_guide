import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_diet_guide/screens/web_screens/admin_dashboard.dart';
import 'package:my_diet_guide/widgets/web_widgets/web_blurred_backgound.dart';
import 'package:my_diet_guide/screens/web_screens/web_admin_nav_bar.dart';

import '../../common/route_constants.dart';

class UpdateMeals extends StatefulWidget {

  final String dietary_preference;
  final String activeness;
  final String intensity;
  final String gender;
  final String ageGroup;
  final String planId;

  const UpdateMeals({Key? key, required this.dietary_preference, required this.activeness, required this.intensity, required this.gender, required this.ageGroup, required this.planId}) : super(key: key);

  @override
  State<UpdateMeals> createState() => _UpdateMealsState();
}

class _UpdateMealsState extends State<UpdateMeals> {

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
        child: Text(dp, style: TextStyle(fontSize: 16, color: Colors.white),),
      );




  Future<List<String>> readBreakfastDishes() async {
    final dietaryPreference = widget.dietary_preference;

    final dishesDoc = FirebaseFirestore.instance.collection('dish').where('dietary_preference', isEqualTo: dietaryPreference).where('meal', isEqualTo: 'Breakfast');
    final dishesSnapshot = await dishesDoc.get();

    final List<String> list = dishesSnapshot.docs.map((doc) => doc.data()!['name'].toString()).toList();

    return list;
  }




  Future<List<String>> readLunchDishes() async {
    final dietaryPreference = widget.dietary_preference;

    final dishesDoc = FirebaseFirestore.instance.collection('dish').where('dietary_preference', isEqualTo: dietaryPreference).where('meal', isEqualTo: 'Lunch');
    final dishesSnapshot = await dishesDoc.get();

    final List<String> list = dishesSnapshot.docs.map((doc) => doc.data()!['name'].toString()).toList();

    return list;
  }




  Future<List<String>> readDinnerDishes() async {
    final dietaryPreference = widget.dietary_preference;

    final dishesDoc = FirebaseFirestore.instance.collection('dish').where('dietary_preference', isEqualTo: dietaryPreference).where('meal', isEqualTo: 'Dinner');
    final dishesSnapshot = await dishesDoc.get();

    final List<String> list = dishesSnapshot.docs.map((doc) => doc.data()!['name'].toString()).toList();

    return list;
  }


  Widget createBreakfastDropDown(List<String> list){
    return Column(
      children: [

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            height: 65,
            padding: EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(color: Colors.grey.shade600.withOpacity(0.6), borderRadius: BorderRadius.circular(16)),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField<String>(
                hint: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Monday Breakfast Dish",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                value: monday_breakfast_dish,
                items: list.map(buildMenuItem).toList(),
                validator: (value){
                  if(value==null){
                    return 'Select a field';
                  }
                  return null;
                },
                onChanged: (value) => setState(() {
                  monday_breakfast_dish=value!;
                }),
                isExpanded: true,
                borderRadius: BorderRadius.circular(16),
                dropdownColor: Colors.grey.shade600.withOpacity(0.6),
              ),
            ),
          ),
        ),

        SizedBox(height: 20,),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            height: 65,
            padding: EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(color: Colors.grey.shade600.withOpacity(0.6), borderRadius: BorderRadius.circular(16)),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField<String>(
                hint: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Tuesday Breakfast Dish",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                value: tuesday_breakfast_dish,
                items: list.map(buildMenuItem).toList(),
                validator: (value){
                  if(value==null){
                    return 'Select a field';
                  }
                  return null;
                },
                onChanged: (value) => setState(() {
                  tuesday_breakfast_dish=value!;
                }),
                isExpanded: true,
                borderRadius: BorderRadius.circular(16),
                dropdownColor: Colors.grey.shade600.withOpacity(0.6),
              ),
            ),
          ),
        ),


        SizedBox(height: 20,),


        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            height: 65,
            padding: EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(color: Colors.grey.shade600.withOpacity(0.6), borderRadius: BorderRadius.circular(16)),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField<String>(
                hint: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Wednesday Breakfast Dish",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                value: wednesday_breakfast_dish,
                items: list.map(buildMenuItem).toList(),
                validator: (value){
                  if(value==null){
                    return 'Select a field';
                  }
                  return null;
                },
                onChanged: (value) => setState(() {
                  wednesday_breakfast_dish=value!;
                }),
                isExpanded: true,
                borderRadius: BorderRadius.circular(16),
                dropdownColor: Colors.grey.shade600.withOpacity(0.6),
              ),
            ),
          ),
        ),

        SizedBox(height: 20,),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            height: 65,
            padding: EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(color: Colors.grey.shade600.withOpacity(0.6), borderRadius: BorderRadius.circular(16)),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField<String>(
                hint: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Thursday Breakfast Dish",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                value: thursday_breakfast_dish,
                items: list.map(buildMenuItem).toList(),
                validator: (value){
                  if(value==null){
                    return 'Select a field';
                  }
                  return null;
                },
                onChanged: (value) => setState(() {
                  thursday_breakfast_dish=value!;
                }),
                isExpanded: true,
                borderRadius: BorderRadius.circular(16),
                dropdownColor: Colors.grey.shade600.withOpacity(0.6),
              ),
            ),
          ),
        ),

        SizedBox(height: 20,),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            height: 65,
            padding: EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(color: Colors.grey.shade600.withOpacity(0.6), borderRadius: BorderRadius.circular(16)),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField<String>(
                hint: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Friday Breakfast Dish",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                value: friday_breakfast_dish,
                items: list.map(buildMenuItem).toList(),
                validator: (value){
                  if(value==null){
                    return 'Select a field';
                  }
                  return null;
                },
                onChanged: (value) => setState(() {
                  friday_breakfast_dish=value!;
                }),
                isExpanded: true,
                borderRadius: BorderRadius.circular(16),
                dropdownColor: Colors.grey.shade600.withOpacity(0.6),
              ),
            ),
          ),
        ),

        SizedBox(height: 20,),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            height: 65,
            padding: EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(color: Colors.grey.shade600.withOpacity(0.6), borderRadius: BorderRadius.circular(16)),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField<String>(
                hint: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Saturday Breakfast Dish",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                value: saturday_breakfast_dish,
                items: list.map(buildMenuItem).toList(),
                validator: (value){
                  if(value==null){
                    return 'Select a field';
                  }
                  return null;
                },
                onChanged: (value) => setState(() {
                  saturday_breakfast_dish=value!;
                }),
                isExpanded: true,
                borderRadius: BorderRadius.circular(16),
                dropdownColor: Colors.grey.shade600.withOpacity(0.6),
              ),
            ),
          ),
        ),

        SizedBox(height: 20,),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            height: 65,
            padding: EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(color: Colors.grey.shade600.withOpacity(0.6), borderRadius: BorderRadius.circular(16)),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField<String>(
                hint: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Sunday Breakfast Dish",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                value: sunday_breakfast_dish,
                items: list.map(buildMenuItem).toList(),
                validator: (value){
                  if(value==null){
                    return 'Select a field';
                  }
                  return null;
                },
                onChanged: (value) => setState(() {
                  sunday_breakfast_dish=value!;
                }),
                isExpanded: true,
                borderRadius: BorderRadius.circular(16),
                dropdownColor: Colors.grey.shade600.withOpacity(0.6),
              ),
            ),
          ),
        ),

        SizedBox(height: 20,),

      ],
    );
  }




  Widget createLunchDropDown(List<String> list){
    return Column(
      children: [

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            height: 65,
            padding: EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(color: Colors.grey.shade600.withOpacity(0.6), borderRadius: BorderRadius.circular(16)),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField<String>(
                hint: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Monday Lunch Dish",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                value: monday_lunch_dish,
                items: list.map(buildMenuItem).toList(),
                validator: (value){
                  if(value==null){
                    return 'Select a field';
                  }
                  return null;
                },
                onChanged: (value) => setState(() {
                  monday_lunch_dish=value!;
                }),
                isExpanded: true,
                borderRadius: BorderRadius.circular(16),
                dropdownColor: Colors.grey.shade600.withOpacity(0.6),
              ),
            ),
          ),
        ),

        SizedBox(height: 20,),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            height: 65,
            padding: EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(color: Colors.grey.shade600.withOpacity(0.6), borderRadius: BorderRadius.circular(16)),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField<String>(
                hint: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Tuesday Lunch Dish",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                value: tuesday_lunch_dish,
                items: list.map(buildMenuItem).toList(),
                validator: (value){
                  if(value==null){
                    return 'Select a field';
                  }
                  return null;
                },
                onChanged: (value) => setState(() {
                  tuesday_lunch_dish=value!;
                }),
                isExpanded: true,
                borderRadius: BorderRadius.circular(16),
                dropdownColor: Colors.grey.shade600.withOpacity(0.6),
              ),
            ),
          ),
        ),


        SizedBox(height: 20,),


        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            height: 65,
            padding: EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(color: Colors.grey.shade600.withOpacity(0.6), borderRadius: BorderRadius.circular(16)),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField<String>(
                hint: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Wednesday Lunch Dish",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                value: wednesday_lunch_dish,
                items: list.map(buildMenuItem).toList(),
                validator: (value){
                  if(value==null){
                    return 'Select a field';
                  }
                  return null;
                },
                onChanged: (value) => setState(() {
                  wednesday_lunch_dish=value!;
                }),
                isExpanded: true,
                borderRadius: BorderRadius.circular(16),
                dropdownColor: Colors.grey.shade600.withOpacity(0.6),
              ),
            ),
          ),
        ),

        SizedBox(height: 20,),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            height: 65,
            padding: EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(color: Colors.grey.shade600.withOpacity(0.6), borderRadius: BorderRadius.circular(16)),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField<String>(
                hint: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Thursday Lunch Dish",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                value: thursday_lunch_dish,
                items: list.map(buildMenuItem).toList(),
                validator: (value){
                  if(value==null){
                    return 'Select a field';
                  }
                  return null;
                },
                onChanged: (value) => setState(() {
                  thursday_lunch_dish=value!;
                }),
                isExpanded: true,
                borderRadius: BorderRadius.circular(16),
                dropdownColor: Colors.grey.shade600.withOpacity(0.6),
              ),
            ),
          ),
        ),

        SizedBox(height: 20,),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            height: 65,
            padding: EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(color: Colors.grey.shade600.withOpacity(0.6), borderRadius: BorderRadius.circular(16)),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField<String>(
                hint: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Friday Lunch Dish",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                value: friday_lunch_dish,
                items: list.map(buildMenuItem).toList(),
                validator: (value){
                  if(value==null){
                    return 'Select a field';
                  }
                  return null;
                },
                onChanged: (value) => setState(() {
                  friday_lunch_dish=value!;
                }),
                isExpanded: true,
                borderRadius: BorderRadius.circular(16),
                dropdownColor: Colors.grey.shade600.withOpacity(0.6),
              ),
            ),
          ),
        ),

        SizedBox(height: 20,),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            height: 65,
            padding: EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(color: Colors.grey.shade600.withOpacity(0.6), borderRadius: BorderRadius.circular(16)),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField<String>(
                hint: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Saturday Lunch Dish",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                value: saturday_lunch_dish,
                items: list.map(buildMenuItem).toList(),
                validator: (value){
                  if(value==null){
                    return 'Select a field';
                  }
                  return null;
                },
                onChanged: (value) => setState(() {
                  saturday_lunch_dish=value!;
                }),
                isExpanded: true,
                borderRadius: BorderRadius.circular(16),
                dropdownColor: Colors.grey.shade600.withOpacity(0.6),
              ),
            ),
          ),
        ),

        SizedBox(height: 20,),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            height: 65,
            padding: EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(color: Colors.grey.shade600.withOpacity(0.6), borderRadius: BorderRadius.circular(16)),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField<String>(
                hint: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Sunday Lunch Dish",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                value: sunday_lunch_dish,
                items: list.map(buildMenuItem).toList(),
                validator: (value){
                  if(value==null){
                    return 'Select a field';
                  }
                  return null;
                },
                onChanged: (value) => setState(() {
                  sunday_lunch_dish=value!;
                }),
                isExpanded: true,
                borderRadius: BorderRadius.circular(16),
                dropdownColor: Colors.grey.shade600.withOpacity(0.6),
              ),
            ),
          ),
        ),

        SizedBox(height: 20,),

      ],
    );
  }




  Widget createDinnerDropDown(List<String> list){
    return Column(
      children: [

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            height: 65,
            padding: EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(color: Colors.grey.shade600.withOpacity(0.6), borderRadius: BorderRadius.circular(16)),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField<String>(
                hint: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Monday Dinner Dish",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                value: monday_dinner_dish,
                items: list.map(buildMenuItem).toList(),
                validator: (value){
                  if(value==null){
                    return 'Select a field';
                  }
                  return null;
                },
                onChanged: (value) => setState(() {
                  monday_dinner_dish=value!;
                }),
                isExpanded: true,
                borderRadius: BorderRadius.circular(16),
                dropdownColor: Colors.grey.shade600.withOpacity(0.6),
              ),
            ),
          ),
        ),

        SizedBox(height: 20,),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            height: 65,
            padding: EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(color: Colors.grey.shade600.withOpacity(0.6), borderRadius: BorderRadius.circular(16)),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField<String>(
                hint: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Tuesday Dinner Dish",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                value: tuesday_dinner_dish,
                items: list.map(buildMenuItem).toList(),
                validator: (value){
                  if(value==null){
                    return 'Select a field';
                  }
                  return null;
                },
                onChanged: (value) => setState(() {
                  tuesday_dinner_dish=value!;
                }),
                isExpanded: true,
                borderRadius: BorderRadius.circular(16),
                dropdownColor: Colors.grey.shade600.withOpacity(0.6),
              ),
            ),
          ),
        ),


        SizedBox(height: 20,),


        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            height: 65,
            padding: EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(color: Colors.grey.shade600.withOpacity(0.6), borderRadius: BorderRadius.circular(16)),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField<String>(
                hint: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Wednesday Dinner Dish",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                value: wednesday_dinner_dish,
                items: list.map(buildMenuItem).toList(),
                validator: (value){
                  if(value==null){
                    return 'Select a field';
                  }
                  return null;
                },
                onChanged: (value) => setState(() {
                  wednesday_dinner_dish=value!;
                }),
                isExpanded: true,
                borderRadius: BorderRadius.circular(16),
                dropdownColor: Colors.grey.shade600.withOpacity(0.6),
              ),
            ),
          ),
        ),

        SizedBox(height: 20,),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            height: 65,
            padding: EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(color: Colors.grey.shade600.withOpacity(0.6), borderRadius: BorderRadius.circular(16)),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField<String>(
                hint: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Thursday Dinner Dish",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                value: thursday_dinner_dish,
                items: list.map(buildMenuItem).toList(),
                validator: (value){
                  if(value==null){
                    return 'Select a field';
                  }
                  return null;
                },
                onChanged: (value) => setState(() {
                  thursday_dinner_dish=value!;
                }),
                isExpanded: true,
                borderRadius: BorderRadius.circular(16),
                dropdownColor: Colors.grey.shade600.withOpacity(0.6),
              ),
            ),
          ),
        ),

        SizedBox(height: 20,),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            height: 65,
            padding: EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(color: Colors.grey.shade600.withOpacity(0.6), borderRadius: BorderRadius.circular(16)),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField<String>(
                hint: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Friday Dinner Dish",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                value: friday_dinner_dish,
                items: list.map(buildMenuItem).toList(),
                validator: (value){
                  if(value==null){
                    return 'Select a field';
                  }
                  return null;
                },
                onChanged: (value) => setState(() {
                  friday_dinner_dish=value!;
                }),
                isExpanded: true,
                borderRadius: BorderRadius.circular(16),
                dropdownColor: Colors.grey.shade600.withOpacity(0.6),
              ),
            ),
          ),
        ),

        SizedBox(height: 20,),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            height: 65,
            padding: EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(color: Colors.grey.shade600.withOpacity(0.6), borderRadius: BorderRadius.circular(16)),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField<String>(
                hint: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Saturday Dinner Dish",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                value: saturday_dinner_dish,
                items: list.map(buildMenuItem).toList(),
                validator: (value){
                  if(value==null){
                    return 'Select a field';
                  }
                  return null;
                },
                onChanged: (value) => setState(() {
                  saturday_dinner_dish=value!;
                }),
                isExpanded: true,
                borderRadius: BorderRadius.circular(16),
                dropdownColor: Colors.grey.shade600.withOpacity(0.6),
              ),
            ),
          ),
        ),

        SizedBox(height: 20,),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            height: 65,
            padding: EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(color: Colors.grey.shade600.withOpacity(0.6), borderRadius: BorderRadius.circular(16)),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField<String>(
                hint: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Sunday Dinner Dish",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                value: sunday_dinner_dish,
                items: list.map(buildMenuItem).toList(),
                validator: (value){
                  if(value==null){
                    return 'Select a field';
                  }
                  return null;
                },
                onChanged: (value) => setState(() {
                  sunday_dinner_dish=value!;
                }),
                isExpanded: true,
                borderRadius: BorderRadius.circular(16),
                dropdownColor: Colors.grey.shade600.withOpacity(0.6),
              ),
            ),
          ),
        ),

        SizedBox(height: 20,),

      ],
    );
  }




  Future<double> getCalorieGains(String? dishName) async {
    final dishDoc = FirebaseFirestore.instance.collection('dish').doc(dishName);
    final dishDocSnapshot = await dishDoc.get();

    double calorie_gain_per_meal = dishDocSnapshot.data()!['calorie_gain_per_meal'];
    return calorie_gain_per_meal;
  }



  Future<String> getPlanId(String collectionName, String nextIdRef) async {
    final planDoc = FirebaseFirestore.instance.collection(collectionName).doc(nextIdRef);
    final planSnapshot = await planDoc.get();

    String planId = planSnapshot.data()!['id'].toString();
    return planId;
  }



  Future<Map<String,dynamic>> addBreakfast() async {
    final breakfastId = await getPlanId('breakfast', 'nextId');

    double monday_cal = await getCalorieGains(monday_breakfast_dish);
    double tuesday_cal = await getCalorieGains(tuesday_breakfast_dish);
    double wednesday_cal = await getCalorieGains(wednesday_breakfast_dish);
    double thursday_cal = await getCalorieGains(thursday_breakfast_dish);
    double friday_cal = await getCalorieGains(friday_breakfast_dish);
    double saturday_cal = await getCalorieGains(saturday_breakfast_dish);
    double sunday_cal = await getCalorieGains(sunday_breakfast_dish);
    final double calorie_gain_per_meal_per_week = monday_cal + tuesday_cal + wednesday_cal + thursday_cal + friday_cal + saturday_cal + sunday_cal;

    final breakfastDoc = FirebaseFirestore.instance.collection('breakfast').doc(breakfastId);

    final json = {
      'activeness': widget.activeness,
      'age_group': widget.ageGroup,
      'calorie_gain_per_meal_per_week': calorie_gain_per_meal_per_week,
      'dietary_preference': widget.dietary_preference,
      'gender': widget.gender,
      'intensity': widget.intensity,
      'monday_dish_id': monday_breakfast_dish,
      'tuesday_dish_id': tuesday_breakfast_dish,
      'wednesday_dish_id': wednesday_breakfast_dish,
      'thursday_dish_id': thursday_breakfast_dish,
      'friday_dish_id': friday_breakfast_dish,
      'saturday_dish_id': saturday_breakfast_dish,
      'sunday_dish_id': sunday_breakfast_dish,
    };

    await breakfastDoc.set(json);

    await updateNextId(breakfastId, "breakfast", "nextId");

    return {
      'breakfast_id': breakfastId,
      'breakfast_calorie': calorie_gain_per_meal_per_week,
    };
  }



  Future<Map<String,dynamic>> addLunch() async {
    final lunchId = await getPlanId('lunch', 'nextId');

    double monday_cal = await getCalorieGains(monday_lunch_dish);
    double tuesday_cal = await getCalorieGains(tuesday_lunch_dish);
    double wednesday_cal = await getCalorieGains(wednesday_lunch_dish);
    double thursday_cal = await getCalorieGains(thursday_lunch_dish);
    double friday_cal = await getCalorieGains(friday_lunch_dish);
    double saturday_cal = await getCalorieGains(saturday_lunch_dish);
    double sunday_cal = await getCalorieGains(sunday_lunch_dish);
    final double calorie_gain_per_meal_per_week = monday_cal + tuesday_cal + wednesday_cal + thursday_cal + friday_cal + saturday_cal + sunday_cal;

    final lunchDoc = FirebaseFirestore.instance.collection('lunch').doc(lunchId);

    final json = {
      'activeness': widget.activeness,
      'age_group': widget.ageGroup,
      'calorie_gain_per_meal_per_week': calorie_gain_per_meal_per_week,
      'dietary_preference': widget.dietary_preference,
      'gender': widget.gender,
      'intensity': widget.intensity,
      'monday_dish_id': monday_lunch_dish,
      'tuesday_dish_id': tuesday_lunch_dish,
      'wednesday_dish_id': wednesday_lunch_dish,
      'thursday_dish_id': thursday_lunch_dish,
      'friday_dish_id': friday_lunch_dish,
      'saturday_dish_id': saturday_lunch_dish,
      'sunday_dish_id': sunday_lunch_dish,
    };

    await lunchDoc.set(json);

    await updateNextId(lunchId, "lunch", "nextId");

    return {
      'lunch_id': lunchId,
      'lunch_calorie': calorie_gain_per_meal_per_week,
    };
  }



  Future<Map<String,dynamic>> addDinner() async {
    final dinnerId = await getPlanId('dinner', 'nextId');

    double monday_cal = await getCalorieGains(monday_dinner_dish);
    double tuesday_cal = await getCalorieGains(tuesday_dinner_dish);
    double wednesday_cal = await getCalorieGains(wednesday_dinner_dish);
    double thursday_cal = await getCalorieGains(thursday_dinner_dish);
    double friday_cal = await getCalorieGains(friday_dinner_dish);
    double saturday_cal = await getCalorieGains(saturday_dinner_dish);
    double sunday_cal = await getCalorieGains(sunday_dinner_dish);
    final double calorie_gain_per_meal_per_week = monday_cal + tuesday_cal + wednesday_cal + thursday_cal + friday_cal + saturday_cal + sunday_cal;

    final dinnerDoc = FirebaseFirestore.instance.collection('dinner').doc(dinnerId);

    final json = {
      'activeness': widget.activeness,
      'age_group': widget.ageGroup,
      'calorie_gain_per_meal_per_week': calorie_gain_per_meal_per_week,
      'dietary_preference': widget.dietary_preference,
      'gender': widget.gender,
      'intensity': widget.intensity,
      'monday_dish_id': monday_dinner_dish,
      'tuesday_dish_id': tuesday_dinner_dish,
      'wednesday_dish_id': wednesday_dinner_dish,
      'thursday_dish_id': thursday_dinner_dish,
      'friday_dish_id': friday_dinner_dish,
      'saturday_dish_id': saturday_dinner_dish,
      'sunday_dish_id': sunday_dinner_dish,
    };

    await dinnerDoc.set(json);

    await updateNextId(dinnerId, "dinner", "nextId");

    return {
      'dinner_id': dinnerId,
      'dinner_calorie': calorie_gain_per_meal_per_week,
    };
  }



  Future updateNextId(String id, String collectionName, String docName) async {
    await FirebaseFirestore.instance.collection(collectionName).doc(docName).update({'id': int.parse(id)+1});
    await FirebaseFirestore.instance.collection(collectionName).doc('details').update({'count': int.parse(id)});
  }



  Future addDietPlan() async {

    final Map<String, dynamic> breakfastMap = await addBreakfast();
    final Map<String, dynamic> lunchMap = await addLunch();
    final Map<String, dynamic> dinnerMap = await addDinner();

    final String breakfast_id = breakfastMap['breakfast_id'];
    final String lunch_id = lunchMap['lunch_id'];
    final String dinner_id = dinnerMap['dinner_id'];

    final int breakfast_calorie = breakfastMap['breakfast_calorie'];
    final int lunch_calorie = lunchMap['lunch_calorie'];
    final int dinner_calorie = dinnerMap['dinner_calorie'];

    final int calorie_gain_per_plan_per_week = breakfast_calorie + lunch_calorie + dinner_calorie;

    final dietPlanDoc = FirebaseFirestore.instance.collection('diet_plan').doc(widget.planId);

    final json = {
      'activeness': widget.activeness,
      'age_group': widget.ageGroup,
      'calorie_gain_per_plan_per_week': calorie_gain_per_plan_per_week,
      'dietary_preference': widget.dietary_preference,
      'gender': widget.gender,
      'intensity': widget.intensity,
      'breakfast_id': breakfast_id,
      'lunch_id': lunch_id,
      'dinner_id': dinner_id,
      'plan_image': "assets/images/meals/${widget.dietary_preference}.png"
    };

    await dietPlanDoc.update(json);

  }





  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebBlurredBackground(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: WebAdminNavBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.only(top: 50, bottom: 50),
                  child: Text("Update Meals",
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
                                          fontSize: 28,
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
                                            return createBreakfastDropDown(breakfastDishes);
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
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white
                                      ),
                                    ),
                                  ),


                                  FutureBuilder<List<String>>(
                                      future: readLunchDishes(),
                                      builder: (context, snapshot){
                                        if(snapshot.hasData){
                                          lunchDishes = snapshot.data!;
                                          if(lunchDishes==null){
                                            return Center(child: Text("No User!"));
                                          } else {
                                            return createLunchDropDown(lunchDishes);
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
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white
                                      ),
                                    ),
                                  ),

                                  FutureBuilder<List<String>>(
                                      future: readDinnerDishes(),
                                      builder: (context, snapshot){
                                        if(snapshot.hasData){
                                          dinnerDishes = snapshot.data!;
                                          if(dinnerDishes==null){
                                            return Center(child: Text("No User!"));
                                          } else {
                                            return createDinnerDropDown(dinnerDishes);
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

                  ],
                ),

                SizedBox(height: 35,),


                //next button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: () async {
                      if(_breakfastFormKey.currentState!.validate() && _lunchFormKey.currentState!.validate() && _dinnerFormKey.currentState!.validate()){
                        addDietPlan();
                        Navigator.pushNamed(context, RouteConstants.homeRoute);                      }
                    },
                    child: Container(
                      width: 420,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.teal.shade900,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          'Next',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight:FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),


                SizedBox(height: 40,),

              ],
            ),
          ),
        )
      ],
    );
  }
}
