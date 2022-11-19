import 'package:flutter/material.dart';
import 'package:my_diet_guide/screens/web_screens/add_meals.dart';
import 'package:my_diet_guide/screens/web_screens/web_admin_nav_bar.dart';
import 'package:my_diet_guide/widgets/web_widgets/web_blurred_backgound.dart';

class AddDietPlan extends StatefulWidget {
  const AddDietPlan({Key? key}) : super(key: key);

  @override
  State<AddDietPlan> createState() => _AddDietPlanState();
}

class _AddDietPlanState extends State<AddDietPlan> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final dietary_preferences = ['Vegetarian', 'Energetic', 'Low carb'];
  String? dietaryPreference;

  final active_types = ['Not very active', 'Moderately active', 'Active'];
  String? activeness;

  final intensities = ['Easy', 'Standard', 'Difficult'];
  String? intensity;

  final genders = ['Male', 'Female'];
  String? gender;

  final ageGroups = ['0-12', '13-18', '19-25', '26-45', '46-60', '61-75', 'More than 75'];
  String? ageGroup;


  DropdownMenuItem<String> buildMenuItem(String dp) =>
      DropdownMenuItem(
        value: dp,
        child: Text(dp, style: TextStyle(fontSize: 26, color: Colors.white),),
      );


  bool isNumeric(String? value){
    if(value == null){
      return false;
    }
    return double.tryParse(value) != null;
  }


  Future goToNext() async {
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddMeals(dietary_preference: dietaryPreference!, activeness: activeness!, intensity: intensity!, gender: gender!, ageGroup: ageGroup!)));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade900,
      appBar: WebAdminNavBar(),
      body: Stack(
        children: [
          WebBlurredBackground(),
          SingleChildScrollView(
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
                                  fontSize: 26,
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
                        width: 420,
                        height: 55,
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
                                  fontSize: 26,
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
                        width: 420,
                        height: 55,
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
                                  fontSize: 26,
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


                    SizedBox(height: 30,),


                    //gender dropdown
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
                                "Gender",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                ),
                              ),
                            ),
                            iconSize: 32,
                            iconEnabledColor: Colors.white,
                            value: gender,
                            items: genders.map(buildMenuItem).toList(),
                            validator: (value){
                              if(value==null){
                                return 'Select a field';
                              }
                              return null;
                            },
                            onChanged: (value) => setState(() {
                              gender=value!;
                            }),
                            isExpanded: true,
                            borderRadius: BorderRadius.circular(16),
                            dropdownColor: Colors.grey.shade600.withOpacity(0.6),

                          ),
                        ),
                      ),
                    ),


                    SizedBox(height: 30,),


                    //gender dropdown
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
                                "Age Group",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                ),
                              ),
                            ),
                            iconSize: 32,
                            iconEnabledColor: Colors.white,
                            value: ageGroup,
                            items: ageGroups.map(buildMenuItem).toList(),
                            validator: (value){
                              if(value==null){
                                return 'Select a field';
                              }
                              return null;
                            },
                            onChanged: (value) => setState(() {
                              ageGroup=value!;
                            }),
                            isExpanded: true,
                            borderRadius: BorderRadius.circular(16),
                            dropdownColor: Colors.grey.shade600.withOpacity(0.6),

                          ),
                        ),
                      ),
                    ),



                    SizedBox(height: 70,),



                    //next button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: GestureDetector(
                        onTap: () async {
                          if(_formKey.currentState!.validate()){
                            await goToNext();
                          }
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


                    SizedBox(height: 35,),



                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
