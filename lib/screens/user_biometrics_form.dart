import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_diet_guide/common/route_constants.dart';
import 'package:my_diet_guide/models/Calorie_Calculator.dart';
import '../models/UserBiometrics.dart';
import '../widgets/background_image.dart';

class UserBiometricsForm extends StatefulWidget {

  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final int age;
  final String gender;
  final String bday;

  const UserBiometricsForm({
    Key? key,
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.bday,
    required this.gender
  }) : super(key: key);

  @override
  State<UserBiometricsForm> createState() => _UserBiometricsFormState();
}




class _UserBiometricsFormState extends State<UserBiometricsForm> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // final _weightController = TextEditingController();
  // final _heightController = TextEditingController();
  // final _targetWeightController = TextEditingController();

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
        child: Text(dp, style: TextStyle(fontSize: 19, color: Colors.white),),
      );


  bool isNumeric(String value){
    if(value == null){
      return false;
    }
    return double.tryParse(value) != null;
  }



  // @override
  // void dispose(){
  //   super.dispose();
  //   _weightController.dispose();
  //   _heightController.dispose();
  //   _targetWeightController.dispose();
  // }


  Future signUp() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: widget.email, password: widget.password
    );

    String userId = FirebaseAuth.instance.currentUser!.uid;

    addUserType(userId);

    addUserDetails(userId, widget.firstName, widget.lastName, widget.email, widget.bday);

    addUserBiometrics(
        userId,
        widget.age,
        widget.gender,
        double.parse(weight),
        double.parse(height),
        double.parse(targetWeight),
        dietaryPreference!,
        activeness!,
        intensity!
    );

    Navigator.pushNamed(context, RouteConstants.planSelectRoute,);

  }


  Future addUserType(String userId) async {
    final appUserType = FirebaseFirestore.instance.collection('app_users').doc(userId);

    final json = {
      'u_id': userId,
      'type': 'user',
    };

    await appUserType.set(json);
  }


  Future addUserDetails(String userId, String firstName, String lastName, String email, String bday) async {
    final userDoc = FirebaseFirestore.instance.collection('user').doc(userId);

    final json = {
      'user_id': userId,
      'first name': firstName,
      'last name': lastName,
      'email': email,
      'birthday': bday
    };

    await userDoc.set(json);
  }



  Future addUserBiometrics(String userId, int age, String gender, double weight, double height, double targetWeight, String dietaryPreference, String activeness, String intensity) async {
    final userBiometricsDoc = FirebaseFirestore.instance.collection('user biometrics').doc(userId);
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);
    final json = {
      'user_id': userId,
      'age': age,
      'gender': gender,
      'weight': weight,
      'height': height,
      'target weight': targetWeight,
      'dietary preference': dietaryPreference,
      'activeness': activeness,
      'intensity': intensity,
      'calculated_current_weight':weight-CalorieCalculator.calorieBurnPerDayInKg(gender, height.toDouble(), weight.toDouble(), age.toDouble(), activeness),
      'last_calorie_calculated_date': today
    };

    await userBiometricsDoc.set(json);
  }




  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          BackgroundImage(),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 40,),


                    Text("User Biometrics",
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                        textAlign: TextAlign.left),


                    SizedBox(height: 40,),



                    //weight textfield
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    //   child: TextField(
                    //     keyboardType: TextInputType.number,
                    //     controller: _weightController,
                    //     decoration: InputDecoration(
                    //       enabledBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(color: Colors.white),
                    //         borderRadius: BorderRadius.circular(12),
                    //       ),
                    //       focusedBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(color: Colors.deepPurple),
                    //         borderRadius: BorderRadius.circular(12),
                    //       ),
                    //       hintText: 'Weight (kg)',
                    //       fillColor: Colors.grey.shade200,
                    //       filled: true,
                    //     ),
                    //   ),
                    // ),

                    //TextBox02(hint: "Weight", keyboardType: TextInputType.number, value: weight,),

                    Container(
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
                                fontSize: 19,
                                color: Colors.white,
                              ),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 20),
                                border: InputBorder.none,
                                hintText: "Weight (kg)",
                                hintStyle: TextStyle(
                                  fontSize: 19,
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



                    //height textfield
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    //   child: TextField(
                    //     keyboardType: TextInputType.number,
                    //     controller: _heightController,
                    //     decoration: InputDecoration(
                    //       enabledBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(color: Colors.white),
                    //         borderRadius: BorderRadius.circular(12),
                    //       ),
                    //       focusedBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(color: Colors.deepPurple),
                    //         borderRadius: BorderRadius.circular(12),
                    //       ),
                    //       hintText: 'Height (cm)',
                    //       fillColor: Colors.grey.shade200,
                    //       filled: true,
                    //     ),
                    //   ),
                    // ),

                    //TextBox02(hint: "Height", keyboardType: TextInputType.number, value: height,),

                    Container(
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
                                fontSize: 19,
                                color: Colors.white,
                              ),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 20),
                                border: InputBorder.none,
                                hintText: "Height (cm)",
                                hintStyle: TextStyle(
                                  fontSize: 19,
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


                    SizedBox(height: 20,),



                    //target weight textfield
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    //   child: TextField(
                    //     keyboardType: TextInputType.number,
                    //     controller: _targetWeightController,
                    //     decoration: InputDecoration(
                    //       enabledBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(color: Colors.white),
                    //         borderRadius: BorderRadius.circular(12),
                    //       ),
                    //       focusedBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(color: Colors.deepPurple),
                    //         borderRadius: BorderRadius.circular(12),
                    //       ),
                    //       hintText: 'Target Weight (kg)',
                    //       fillColor: Colors.grey.shade200,
                    //       filled: true,
                    //     ),
                    //   ),
                    // ),

                    //TextBox02(hint: "Target Weight", keyboardType: TextInputType.number, value: targetWeight,),

                    Container(
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
                                fontSize: 19,
                                color: Colors.white,
                              ),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 20),
                                border: InputBorder.none,
                                hintText: "Target Weight (kg)",
                                hintStyle: TextStyle(
                                  fontSize: 19,
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
                                }else if(double.parse(text) >= double.parse(weight)){
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
                                  fontSize: 19,
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
                                  fontSize: 19,
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
                                  fontSize: 19,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: GestureDetector(
                        onTap: () async {
                          if(_formKey.currentState!.validate()){
                            await signUp();
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.teal.shade900,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight:FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),


                  ],
                ),
              ),
            ),
          ),
        ]
    );
  }
}
