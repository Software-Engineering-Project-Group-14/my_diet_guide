import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:my_diet_guide/widgets/web_widgets/web_blurred_backgound.dart';

class AddNewDish extends StatefulWidget {
  const AddNewDish({Key? key}) : super(key: key);

  @override
  State<AddNewDish> createState() => _AddNewDishState();
}

class _AddNewDishState extends State<AddNewDish> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final dietary_preferences = ['Vegetarian', 'Energetic', 'Low carb'];
  String? dietaryPreference;

  final meals = ['Breakfast', 'Lunch', 'Dinner'];
  String? meal;

  String name = '';
  String description = '';
  String dishImage = '';
  String calorie_gain_per_meal = '';

  PlatformFile? pickedfile;


  DropdownMenuItem<String> buildMenuItem(String dp) =>
      DropdownMenuItem(
        value: dp,
        child: Text(dp, style: TextStyle(fontSize: 20, color: Colors.white),),
      );


  bool isNumeric(String? value){
    if(value == null){
      return false;
    }
    return double.tryParse(value) != null;
  }



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebBlurredBackground(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.teal.shade900,
            elevation: 0,
          ),

          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Text("Add a new diet plan",
                          style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),
                          textAlign: TextAlign.left
                      ),
                    ),


                    SizedBox(height: 35,),


                    Container(
                      width: 500,
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade600.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: TextFormField(
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 20),
                                border: InputBorder.none,
                                hintText: "Dish Name",
                                hintStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                ),
                              ),
                              onChanged: (val){
                                setState(() => name = val);
                              },
                              validator: (text){
                                if(text == null || text.isEmpty){
                                  return 'Cannot be empty';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 30,),

                    Container(
                      width: 500,
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade600.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: TextFormField(
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 20),
                                border: InputBorder.none,
                                hintText: "Description",
                                hintStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                ),
                              ),
                              onChanged: (val){
                                setState(() => description = val);
                              },
                              validator: (text){
                                if(text == null || text.isEmpty){
                                  return 'Cannot be empty';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 30,),

                    Container(
                      width: 500,
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade600.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: TextFormField(
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 20),
                                border: InputBorder.none,
                                hintText: "Calorie gain per day",
                                hintStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                ),
                              ),
                              onChanged: (val){
                                setState(() => calorie_gain_per_meal = val);
                              },
                              validator: (text){
                                if(text == null || text.isEmpty){
                                  return 'Cannot be empty';
                                } else if(isNumeric(text) == false){
                                  return 'Value should be a number';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),


                    SizedBox(height: 30,),


                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
                        width: 420,
                        height: 55,
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        decoration: BoxDecoration(color: Colors.grey.shade600.withOpacity(0.6), borderRadius: BorderRadius.circular(16)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButtonFormField<String>(
                            hint: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Dietary Preference",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            iconSize: 32,
                            iconEnabledColor: Colors.white,
                            value: dietaryPreference,
                            items: dietary_preferences.map(buildMenuItem).toList(),
                            validator: (value){
                              if(value==null){
                                return 'Select a field';
                              }
                              return null;
                            },
                            onChanged: (value) => setState(() {
                              dietaryPreference=value!;
                            }),
                            isExpanded: true,
                            borderRadius: BorderRadius.circular(16),
                            dropdownColor: Colors.grey.shade600.withOpacity(0.6),
                          ),
                        ),
                      ),
                    ),


                    SizedBox(height: 30,),


                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
                        width: 420,
                        height: 55,
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        decoration: BoxDecoration(color: Colors.grey.shade600.withOpacity(0.6), borderRadius: BorderRadius.circular(16)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButtonFormField<String>(
                            hint: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Meal Type",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            iconSize: 32,
                            iconEnabledColor: Colors.white,
                            value: meal,
                            items: meals.map(buildMenuItem).toList(),
                            validator: (value){
                              if(value==null){
                                return 'Select a field';
                              }
                              return null;
                            },
                            onChanged: (value) => setState(() {
                              meal=value!;
                            }),
                            isExpanded: true,
                            borderRadius: BorderRadius.circular(16),
                            dropdownColor: Colors.grey.shade600.withOpacity(0.6),

                          ),
                        ),
                      ),
                    ),


                    SizedBox(height: 30,),



                  ],
                ),
              ),
            )
          ),
        ),

      ],
    );
  }
}
