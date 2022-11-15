import 'package:age_calculator/age_calculator.dart';
import 'package:flutter/material.dart';
import 'package:my_diet_guide/screens/web_screens/web_user_biometrics_form.dart';

import '../../widgets/background_image.dart';

class WebUserDetailsForm extends StatefulWidget {

  final String email;
  final String password;

  const WebUserDetailsForm({Key? key, required this.email, required this.password}) : super(key: key);

  @override
  State<WebUserDetailsForm> createState() => _WebUserDetailsFormState();
}

class _WebUserDetailsFormState extends State<WebUserDetailsForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String firstName = '';
  String lastName = '';
  String bday = '';
  int age = 0;

  // String? bday = null;
  // int? age;

  final genders = ['Male', 'Female'];
  String? gender;


  DropdownMenuItem<String> buildMenuItem(String dp) =>
      DropdownMenuItem(
        value: dp,
        child: Text(dp, style: TextStyle(fontSize: 26, color: Colors.white),),
      );



  Widget showBirthday(String bday){
    if(bday.isEmpty){
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text("Birthday", style: TextStyle(color: Colors.white, fontSize: 26), textAlign: TextAlign.start,),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(bday, style: TextStyle(color: Colors.white, fontSize: 26), textAlign: TextAlign.start,),
      );
    }
  }



  Future signUp() async {
    // String firstName = _firstNameController.text.trim();
    // String lastName = _lastNameController.text.trim();

    // Navigator.pushNamed(context, RouteConstants.bioCreateRoute,
    //     arguments: <String, dynamic>{
    //       'email': widget.email,
    //       'password': widget.password,
    //       'firstName': firstName,
    //       'lastName': lastName,
    //       'age': age,
    //       'bday': bday,
    //       'gender': gender!
    //     }
    // );

    Navigator.push(context, MaterialPageRoute(
        builder: (context) =>
            WebUserBiometricsForm(
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
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 80,),


                      Text(
                          "User Details",
                          style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),
                          textAlign: TextAlign.left
                      ),


                      SizedBox(height: 55,),


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
                                  fontSize: 26,
                                  color: Colors.white,
                                ),
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 20),
                                  border: InputBorder.none,
                                  hintText: "First Name",
                                  hintStyle: TextStyle(
                                    fontSize: 26,
                                    color: Colors.white,
                                  ),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                  ),
                                ),
                                onChanged: (val){
                                  setState(() => firstName = val);
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
                                  fontSize: 26,
                                  color: Colors.white,
                                ),
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 20),
                                  border: InputBorder.none,
                                  hintText: "Last Name",
                                  hintStyle: TextStyle(
                                    fontSize: 26,
                                    color: Colors.white,
                                  ),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                  ),
                                ),
                                onChanged: (val){
                                  setState(() => lastName = val);
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
                              width: 420,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade600.withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(16)
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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



                      SizedBox(height: 70,),



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


                    ],
                  ),
                ),
              ),
            ),
          ),
        ]
    );
  }
}
