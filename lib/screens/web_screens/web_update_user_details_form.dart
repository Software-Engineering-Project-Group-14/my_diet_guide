import 'package:age_calculator/age_calculator.dart';
import 'package:flutter/material.dart';
import 'package:my_diet_guide/screens/web_screens/web_update_user_biometrics_form.dart';
import 'package:my_diet_guide/widgets/web_widgets/web_user_navigation_bar.dart';
import 'package:sizer/sizer.dart';

import '../../common/route_constants.dart';
import '../../widgets/web_widgets/web_blurred_backgound.dart';

class WebUpdateDetailsForm extends StatefulWidget {

  final String user_id;

  const WebUpdateDetailsForm({Key? key, required this.user_id}) : super(key: key);

  @override
  State<WebUpdateDetailsForm> createState() => _WebUpdateDetailsFormState();
}

class _WebUpdateDetailsFormState extends State<WebUpdateDetailsForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // final _firstNameController = TextEditingController();
  // final _lastNameController = TextEditingController();

  String firstName = '';
  String lastName = '';
  String bday = '';
  int age = 0;

  final genders = ['Male', 'Female'];
  String? gender;

  DropdownMenuItem<String> buildMenuItem(String dp) =>
      DropdownMenuItem(
        value: dp,
        child: Text(dp, style: TextStyle(fontSize: 19, color: Colors.white),),
      );



  Widget showBirthday(String bday){
    if(bday.isEmpty){
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text("Birthday", style: TextStyle(color: Colors.white, fontSize: 19), textAlign: TextAlign.start,),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(bday, style: TextStyle(color: Colors.white, fontSize: 20), textAlign: TextAlign.start,),
      );
    }
  }



  // @override
  // void dispose(){
  //   super.dispose();
  //   _firstNameController.dispose();
  //   _lastNameController.dispose();
  // }


  Future goToNextPage() async {


    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> WebUpdateBiometricsForm(
        user_id: widget.user_id,
        firstName: firstName,
        lastName: lastName,
        bday: bday,
        gender: gender!,
        age: age,
    )));


    // Navigator.pushNamed(context, RouteConstants.bioUpdateRoute,
    //     arguments: <String, dynamic>{
    //       'user_id': widget.user_id,
    //       'firstName': firstName,
    //       'lastName': lastName,
    //       'bday': bday,
    //       'gender': gender!,
    //       'age': age,
    //
    //     }
    // );
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.teal.shade900,
      appBar: WebUserNavBar(),

      body: Stack(
        children: [
          WebBlurredBackground(),

          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 40,),

                  Text(
                      "Update User Details",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                      textAlign: TextAlign.left
                  ),


                  SizedBox(height: 65,),

                  //TextBox02(hint: "First Name", keyboardType: TextInputType.name, value: firstName,),

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
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 20),
                              border: InputBorder.none,
                              hintText: "First Name",
                              hintStyle: TextStyle(
                                fontSize: 20,
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

                  //TextBox02(hint: "Last Name", keyboardType: TextInputType.name, value: lastName,),

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
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 20),
                              border: InputBorder.none,
                              hintText: "Last Name",
                              hintStyle: TextStyle(
                                fontSize: 20,
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
                          width: 35.w,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade600.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(16)
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 17.5),
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
                      height: 55,
                      width: 35.w,
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


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 100,
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
                        onTap: () async {
                          if(_formKey.currentState!.validate()){
                            await goToNextPage();
                          }
                        },
                        child: Container(
                          width: 100,
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


                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
