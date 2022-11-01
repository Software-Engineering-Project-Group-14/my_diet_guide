import 'package:age_calculator/age_calculator.dart';
import 'package:flutter/material.dart';
import 'package:my_diet_guide/screens/update_user_biometrics_form.dart';
import 'package:my_diet_guide/widgets/blurred_background_image.dart';
import 'package:my_diet_guide/widgets/bottom_bar.dart';
import 'package:my_diet_guide/widgets/side_bar.dart';
import '../widgets/text_box_02.dart';

class UpdateDetailsForm extends StatefulWidget {

  final String user_id;

  const UpdateDetailsForm({
    Key? key,
    required this.user_id,
  }) : super(key: key);

  @override
  State<UpdateDetailsForm> createState() => _UpdateDetailsFormState();
}

class _UpdateDetailsFormState extends State<UpdateDetailsForm> {

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



  // @override
  // void dispose(){
  //   super.dispose();
  //   _firstNameController.dispose();
  //   _lastNameController.dispose();
  // }


  Future goToNextPage() async {
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UpdateBiometricsForm(user_id: widget.user_id, firstName: firstName, lastName: lastName, bday: bday, gender: gender!, age: age,)));
  }



  @override
  Widget build(BuildContext context) {

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

                  TextBox02(hint: "First Name", keyboardType: TextInputType.name, value: firstName,),

                  SizedBox(height: 30,),

                  TextBox02(hint: "Last Name", keyboardType: TextInputType.name, value: lastName,),

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


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: GestureDetector(
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
                      ),


                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: GestureDetector(
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
                      ),
                    ],
                  ),
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
