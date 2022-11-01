import 'package:age_calculator/age_calculator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_diet_guide/screens/user_biometrics_form.dart';
import 'package:my_diet_guide/widgets/background_image.dart';
import 'package:my_diet_guide/widgets/dropdown_01.dart';
import 'package:my_diet_guide/widgets/text_box_01.dart';

import '../widgets/text_box_02.dart';


class UserDetailsForm extends StatefulWidget {

  final String email;
  final String password;

  const UserDetailsForm({Key? key, required this.email, required this.password}) : super(key: key);

  @override
  State<UserDetailsForm> createState() => _UserDetailsFormState();
}




class _UserDetailsFormState extends State<UserDetailsForm> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String firstName = '';
  String lastName = '';
  String bday ='';
  int age = 0;

  // String? bday = null;
  // int? age;

  final genders = ['Male', 'Female'];
  String? gender;


  DropdownMenuItem<String> buildMenuItem(String dp) =>
      DropdownMenuItem(
        value: dp,
        child: Text(dp, style: TextStyle(fontSize: 19, color: Colors.white),),
      );



  Widget showBirthday(String bday){
    if(bday==''){
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text("Birthday", style: TextStyle(color: Colors.white, fontSize: 19), textAlign: TextAlign.start,),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(bday, style: TextStyle(color: Colors.white, fontSize: 19), textAlign: TextAlign.start,),
      );
    }
  }



  Future signUp() async {
    // String firstName = _firstNameController.text.trim();
    // String lastName = _lastNameController.text.trim();

    Navigator.push(context, MaterialPageRoute(
        builder: (context) =>
            UserBiometricsForm(
                email: widget.email,
                password: widget.password,
                firstName: firstName,
                lastName: lastName,
                age: age,
                bday: bday,
                gender: gender!
            )
    ));

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
                    SizedBox(height: 80,),


                    Text(
                        "User Details",
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                        textAlign: TextAlign.left
                    ),


                    SizedBox(height: 40,),



                    // first name textfield
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    //   child: TextField(
                    //     keyboardType: TextInputType.name,
                    //     controller: _firstNameController,
                    //     decoration: InputDecoration(
                    //       enabledBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(color: Colors.white),
                    //         borderRadius: BorderRadius.circular(12),
                    //       ),
                    //       focusedBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(color: Colors.deepPurple),
                    //         borderRadius: BorderRadius.circular(12),
                    //       ),
                    //       hintText: 'First Name',
                    //       fillColor: Colors.grey.shade200,
                    //       filled: true,
                    //     ),
                    //   ),
                    // ),


                    TextBox02(hint: "First Name", keyboardType: TextInputType.name, value: firstName,),



                    SizedBox(height: 30,),



                    // last name textfield
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    //   child: TextField(
                    //     keyboardType: TextInputType.name,
                    //     decoration: InputDecoration(
                    //       enabledBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(color: Colors.white),
                    //         borderRadius: BorderRadius.circular(12),
                    //       ),
                    //       focusedBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(color: Colors.deepPurple),
                    //         borderRadius: BorderRadius.circular(12),
                    //       ),
                    //       hintText: 'Last Name',
                    //       fillColor: Colors.grey.shade200,
                    //       filled: true,
                    //     ),
                    //   ),
                    // ),

                    TextBox02(hint: "Last Name", keyboardType: TextInputType.name, value: lastName,),



                    SizedBox(height: 30,),



                    // age textfield
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    //   child: TextField(
                    //     keyboardType: TextInputType.number,
                    //     controller: _ageController,
                    //     decoration: InputDecoration(
                    //       enabledBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(color: Colors.white),
                    //         borderRadius: BorderRadius.circular(12),
                    //       ),
                    //       focusedBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(color: Colors.deepPurple),
                    //         borderRadius: BorderRadius.circular(12),
                    //       ),
                    //       hintText: 'Age',
                    //       fillColor: Colors.grey.shade200,
                    //       filled: true,
                    //     ),
                    //   ),
                    // ),

                    //TextBox02(controller: _ageController, hint: "Age", keyboardType: TextInputType.number),



                    //SizedBox(height: 30,),



                    // birthday textfield
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: GestureDetector(
                        onTap: () async {
                          DateTime? datetime = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now()
                          );
                          if(datetime == null) return;
                          setState(() {
                            age = AgeCalculator.age(datetime).years;
                            String month = datetime.month.toString().padLeft(2, '0');
                            String day = datetime.day.toString().padLeft(2, '0');
                            bday = '${datetime.year}/$month/$day';
                          });
                        },
                        child: Container(
                            height: 55,
                            width: 332,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade600.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(16)
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                              child: showBirthday(bday),
                            )
                        ),
                      ),
                    ),




                    SizedBox(height: 30,),




                    // gender dropdown
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
                                "Gender",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
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
                              'Next',
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



class UserDetailValidator{

  static String? validateWeight(String weight){
    bool empty = weight.isEmpty;
    bool contDot = weight.contains('.');
    if(empty){
      return 'cannot be empty';
    } else if(contDot == true){
      return 'Weight should not be a decimal value';
    }
    return null;
  }

  static String? validateHeight(String height){
    bool empty = height.isEmpty;
    bool contDot = height.contains('.');
    if(empty){
      return 'cannot be empty';
    } else if(contDot == true){
      return 'Height should not be a decimal value';
    }
    return null;
  }

  static String? validateTargetWeight(String targetWeight){
    bool empty = targetWeight.isEmpty;
    bool contDot = targetWeight.contains('.');
    if(empty){
      return 'cannot be empty';
    } else if(contDot == true){
      return 'Weight should not be a decimal value';
    }
    return null;
  }

  static String? validateDropDown(String text){
    bool empty = text.isEmpty;
    if(empty){
      return 'cannot be empty';
    }
    return null;
  }

}
