import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_diet_guide/widgets/web_widgets/web_user_navigation_bar.dart';
import 'package:sizer/sizer.dart';

import '../../common/route_constants.dart';
import '../../models/Calorie_Calculator.dart';
import '../../widgets/web_widgets/web_blurred_backgound.dart';

class WebUpdateBiometricsForm extends StatefulWidget {

  final String user_id;
  final String firstName;
  final String lastName;
  final String bday;
  final String gender;
  final int age;

  const WebUpdateBiometricsForm({Key? key, required this.user_id, required this.firstName, required this.lastName, required this.bday, required this.gender, required this.age}) : super(key: key);

  @override
  State<WebUpdateBiometricsForm> createState() => _WebUpdateBiometricsFormState();
}

class _WebUpdateBiometricsFormState extends State<WebUpdateBiometricsForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String weight = '';
  String height = '';
  String targetWeight = '';


  final dietary_preferences = ['Vegetarian', 'Energetic', 'Low carb'];
  String? dietaryPreference;

  final active_types = ['Not very active', 'Moderately active', 'Active'];
  String? activeness;

  final intensities = ['Easy', 'Standard', 'Difficult'];
  String? intensity;


  DropdownMenuItem<String> buildMenuItem(String dp) =>
      DropdownMenuItem(
        value: dp,
        child: Text(dp, style: TextStyle(fontSize: 20, color: Colors.white),),
      );



  bool isNumeric(String value){
    if(value == null){
      return false;
    }
    return double.tryParse(value) != null;
  }



  Future updateProfile() async {
    String user_id = widget.user_id;

    final userDoc = FirebaseFirestore.instance.collection('user').doc(user_id);

    userDoc.update({
      'first name': widget.firstName,
      'last name': widget.lastName,
      'birthday': widget.bday
    });

    final userBioDoc = FirebaseFirestore.instance.collection('user biometrics').doc(user_id);
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);
    userBioDoc.update({
      'age': widget.age,
      'gender': widget.gender,
      'weight': int.parse(weight),
      'height': int.parse(height),
      'target weight': int.parse(targetWeight),
      'dietary preference': dietaryPreference,
      'activeness': activeness,
      'intensity': intensity,
      'calculated_current_weight':int.parse(weight)-CalorieCalculator.calorieBurnPerDayInKg(widget.gender, double.parse(height), double.parse(height), widget.age.toDouble(), activeness!),
      'last_calorie_calculated_date': today
    });

    Navigator.pushNamed(context, RouteConstants.planSelectRoute);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade900,
      //appBar: WebUserNavBar(),

      body: Stack(
        children: [
          WebBlurredBackground(),

          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 30,),

                  Text(
                      "Update User Details",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                      textAlign: TextAlign.left
                  ),


                  SizedBox(height: 30,),


                  Container(
                    width: 40.w,
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
                              hintText: "Weight (kg)",
                              hintStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                              ),
                            ),
                            onChanged: (val){
                              setState(() => weight = val);
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

                  //TextBox02(hint: "Height", keyboardType: TextInputType.number, value: height,),

                  Container(
                    width: 40.w,
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
                              hintText: "Height (cm)",
                              hintStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                              ),
                            ),
                            onChanged: (val){
                              setState(() => height = val);
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

                  //TextBox02(hint: "Target Weight", keyboardType: TextInputType.number, value: targetWeight,),

                  Container(
                    width: 40.w,
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
                              hintText: "Target Weight (kg)",
                              hintStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                              ),
                            ),
                            onChanged: (val){
                              setState(() => targetWeight = val);
                            },
                            validator: (text){
                              if(text == null || text.isEmpty){
                                return 'Cannot be empty';
                              } else if(isNumeric(text) == false){
                                return 'Value should be a number';
                              } else if(double.parse(text) >= double.parse(weight)){
                                return 'Target weight should be less than your current weight';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 30,),


                  // dietary preference dropdown
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                      height: 55,
                      width: 35.w,
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



                  // activeness dropdown
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                      height: 55,
                      width: 35.w,
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      decoration: BoxDecoration(color: Colors.grey.shade600.withOpacity(0.6), borderRadius: BorderRadius.circular(16)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField<String>(
                          hint: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Activeness",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          iconSize: 32,
                          iconEnabledColor: Colors.white,
                          value: activeness,
                          items: active_types.map(buildMenuItem).toList(),
                          validator: (value){
                            if(value==null){
                              return 'Select a field';
                            }
                            return null;
                          },
                          onChanged: (value) => setState(() {
                            activeness=value!;
                          }),
                          isExpanded: true,
                          borderRadius: BorderRadius.circular(16),
                          dropdownColor: Colors.grey.shade600.withOpacity(0.6),

                        ),
                      ),
                    ),
                  ),



                  SizedBox(height: 30,),



                  // intensity dropdown
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                      height: 55,
                      width: 35.w,
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      decoration: BoxDecoration(color: Colors.grey.shade600.withOpacity(0.6), borderRadius: BorderRadius.circular(16)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField<String>(
                          hint: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Diet Plan Intensity",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          iconSize: 32,
                          iconEnabledColor: Colors.white,
                          value: intensity,
                          items: intensities.map(buildMenuItem).toList(),
                          validator: (value){
                            if(value==null){
                              return 'Select a field';
                            }
                            return null;
                          },
                          onChanged: (value) => setState(() {
                            intensity=value!;
                          }),
                          isExpanded: true,
                          borderRadius: BorderRadius.circular(16),
                          dropdownColor: Colors.grey.shade600.withOpacity(0.6),

                        ),
                      ),
                    ),
                  ),



                  SizedBox(height: 50,),



                  //register button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 150,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.teal.shade900,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: Text(
                              'Back',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight:FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: 15.w,),

                      GestureDetector(
                        onTap: () async{
                          if(_formKey.currentState!.validate()){
                            await updateProfile();
                          }
                        },
                        child: Container(
                          width: 150,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.teal.shade900,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: Text(
                              'Update',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight:FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),


                  SizedBox(height: 50,)

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
