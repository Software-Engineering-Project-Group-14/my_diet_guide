import 'package:flutter/material.dart';
import 'package:my_diet_guide/screens/user_biometrics_form.dart';
import 'package:my_diet_guide/widgets/background_image.dart';


class UserDetailsForm extends StatefulWidget {

  final String email;
  final String password;

  const UserDetailsForm({Key? key, required this.email, required this.password}) : super(key: key);

  @override
  State<UserDetailsForm> createState() => _UserDetailsFormState();
}




class _UserDetailsFormState extends State<UserDetailsForm> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();

  String? bday = null;

  final genders = ['Male', 'Female'];
  String? gender;


  DropdownMenuItem<String> buildMenuItem(String dp) =>
    DropdownMenuItem(
      value: dp,
      child: Text(dp, style: TextStyle(fontSize: 17),),
    );



  Widget showBirthday(String? bday){
    if(bday==null){
      return Text("Birthday", style: TextStyle(color: Colors.black54), textAlign: TextAlign.start,);
    } else {
      return Text(bday, style: TextStyle(color: Colors.black54), textAlign: TextAlign.start,);
    }
  }



  @override
  void dispose(){
    super.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
  }



  Future signUp() async {
    String firstName = _firstNameController.text.trim();
    String lastName = _lastNameController.text.trim();
    int age = int.parse(_ageController.text.trim());

    Navigator.push(context, MaterialPageRoute(
      builder: (context) =>
        UserBiometricsForm(
          email: widget.email,
          password: widget.password,
          firstName: firstName,
          lastName: lastName,
          age: age,
          bday: bday!,
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
                  SizedBox(height: 40,),


                  Text(
                    "User Details",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                    textAlign: TextAlign.left
                  ),


                  SizedBox(height: 30,),



                  // first name textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      keyboardType: TextInputType.name,
                      controller: _firstNameController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'First Name',
                        fillColor: Colors.grey.shade200,
                        filled: true,
                      ),
                    ),
                  ),



                  SizedBox(height: 20,),



                  // last name textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Last Name',
                        fillColor: Colors.grey.shade200,
                        filled: true,
                      ),
                    ),
                  ),



                  SizedBox(height: 20,),



                  // age textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: _ageController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Age',
                        fillColor: Colors.grey.shade200,
                        filled: true,
                      ),
                    ),
                  ),



                  SizedBox(height: 20,),



                  // birthday textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
                          String month = datetime.month.toString().padLeft(2, '0');
                          String day = datetime.day.toString().padLeft(2, '0');
                          bday = '${datetime.year}/$month/$day';
                        });
                      },
                      child: Container(
                          height: 55,
                          width: 365,
                          child: Container(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                              child: showBirthday(bday),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(12)
                          )
                      ),
                    ),
                  ),




                  SizedBox(height: 20,),




                  //dropdown
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    height: 55,
                    width: 362,
                    decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(12)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButtonFormField<String>(
                        hint: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Dietary Preference"),
                        ),
                        iconSize: 32,
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
                        borderRadius: BorderRadius.circular(12),
                        dropdownColor: Colors.grey.shade200,

                      ),
                    ),
                  ),



                  SizedBox(height: 40,),



                  //register button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: GestureDetector(
                      onTap: signUp,
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
