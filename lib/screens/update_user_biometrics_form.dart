import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_diet_guide/screens/user_dashboard.dart';
import 'package:my_diet_guide/screens/user_profile.dart';
import 'package:my_diet_guide/widgets/blurred_background_image.dart';

import '../widgets/bottom_bar.dart';
import '../widgets/side_bar.dart';
import '../widgets/text_box_02.dart';

class UpdateBiometricsForm extends StatefulWidget {

  final String user_id;
  final String firstName;
  final String lastName;
  final String bday;
  final String gender;

  final int weight;
  final int height;
  final int targetWeight;

  final String dietaryPreference;
  final String activeness;
  final String intensity;

  const UpdateBiometricsForm({
    Key? key,
    required this.user_id,
    required this.firstName,
    required this.lastName,
    required this.bday,
    required this.gender,
    required this.weight,
    required this.height,
    required this.targetWeight,
    required this.dietaryPreference,
    required this.activeness,
    required this.intensity
  }) : super(key: key);

  @override
  State<UpdateBiometricsForm> createState() => _UpdateBiometricsFormState();
}

class _UpdateBiometricsFormState extends State<UpdateBiometricsForm> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  final _targetWeightController = TextEditingController();


  final dietary_preferences = ['Vegetarian', 'Classical', 'Chinese', 'Low carb'];
  late String dietaryPreference;

  final active_types = ['Not very active', 'Moderately active', 'Active'];
  late String activeness;

  final intensities = ['Easy', 'Standard', 'Difficult'];
  late String intensity;



  DropdownMenuItem<String> buildMenuItem(String dp) =>
      DropdownMenuItem(
        value: dp,
        child: Text(dp, style: TextStyle(fontSize: 19, color: Colors.white),),
      );



  @override
  void dispose(){
    super.dispose();
    _weightController.dispose();
    _heightController.dispose();
    _targetWeightController.dispose();
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

    userBioDoc.update({
      'gender': widget.gender,
      'weight': int.parse(_weightController.text.trim()),
      'height': int.parse(_heightController.text.trim()),
      'target weight': int.parse(_targetWeightController.text.trim()),
      'dietary preference': dietaryPreference,
      'activeness': activeness,
      'intensity': intensity
    });
    
    //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UserDashboard()));
  }



  @override
  Widget build(BuildContext context) {

    _weightController.text = widget.weight.toString();
    _heightController.text = widget.height.toString();
    _targetWeightController.text = widget.targetWeight.toString();

    dietaryPreference = widget.dietaryPreference;
    activeness = widget.activeness;
    intensity = widget.intensity;

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
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 40,),

                  TextBox02(controller: _weightController, hint: "Weight", keyboardType: TextInputType.number),

                  SizedBox(height: 30,),

                  TextBox02(controller: _heightController, hint: "Height", keyboardType: TextInputType.number),

                  SizedBox(height: 30,),

                  TextBox02(controller: _targetWeightController, hint: "Target Weight", keyboardType: TextInputType.number),

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: GestureDetector(
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
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: GestureDetector(
                          onTap: updateProfile,
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

      bottomNavigationBar: BottomBar(user_id: widget.user_id),
    );
  }
}
