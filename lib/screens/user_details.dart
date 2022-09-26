import 'package:flutter/material.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({Key? key}) : super(key: key);

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String weight;
  late String height;
  late String targetWeight;

  final dietary_preferences = ['Vegetarian', 'Classical', 'Chinese', 'Low carb'];
  String? dietaryPreference;

  final active_types = ['Not very active', 'Moderately active', 'Active'];
  String? activeness;

  final intensities = ['Easy', 'Standard', 'Difficult'];
  String? intensity;

  DropdownMenuItem<String> buildMenuItem(String dp) =>
    DropdownMenuItem(
      value: dp,
      child: Text(dp, style: TextStyle(fontSize: 17),),
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40,),

              Text("User Details",
                  style: TextStyle(
                      fontSize: 32, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left),

              SizedBox(height: 30,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child:Row(
                  children: [
                    Text("Weight(kg) : ", style: TextStyle(fontSize: 17),),

                    Flexible(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green.shade100),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                        ),
                        validator: (text){
                          return UserDetailValidator.validateWeight(text!);
                        },
                        onSaved: (text){
                          weight = text!;
                        },
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child:Row(
                  children: [
                    Text("Height(cm) : ", style: TextStyle(fontSize: 17),),

                    Flexible(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green.shade100),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                        ),
                        validator: (text){
                          return UserDetailValidator.validateHeight(text!);
                        },
                        onSaved: (text){
                          height = text!;
                        },
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child:Row(
                  children: [
                    Text("Target Weight(kg) : ", style: TextStyle(fontSize: 17),),

                    Flexible(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green.shade100),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                        ),
                        validator: (text){
                          return UserDetailValidator.validateTargetWeight(text!);
                        },
                        onSaved: (text){
                          targetWeight = text!;
                        },
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Text("Dietary Preference : ", style: TextStyle(fontSize: 17),),

                    Flexible(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(25)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            iconSize: 32,
                            value: dietaryPreference,
                            items: dietary_preferences.map(buildMenuItem).toList(),
                            onChanged: (value) => setState(() {
                              this.dietaryPreference=value;
                            }),
                            isExpanded: true,
                            borderRadius: BorderRadius.circular(25),
                            dropdownColor: Colors.grey.shade200,

                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Text("Activeness : ", style: TextStyle(fontSize: 17),),

                    Flexible(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(25)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            iconSize: 32,
                            value: activeness,
                            items: active_types.map(buildMenuItem).toList(),
                            onChanged: (value) => setState(() {
                              this.activeness=value;
                            }),
                            isExpanded: true,
                            borderRadius: BorderRadius.circular(25),
                            dropdownColor: Colors.grey.shade200,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Text("Intensity : ", style: TextStyle(fontSize: 17),),

                    Flexible(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(25)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            iconSize: 32,
                            value: intensity,
                            items: intensities.map(buildMenuItem).toList(),
                            onChanged: (value) => setState(() {
                              this.intensity=value;
                            }),
                            isExpanded: true,
                            borderRadius: BorderRadius.circular(25),
                            dropdownColor: Colors.grey.shade200,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(height: 40,),

              Container(
                height: 50,
                width: 130,
                child: ElevatedButton(
                  onPressed: (){
                    if(_formKey.currentState!.validate()){      //check if validate
                      _formKey.currentState!.save();              // save the inputs
                      //print(weight + height + targetWeight + dietaryPreference! + activeness! + intensity!);
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade300),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)
                    )),
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                )
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image(
                    image: AssetImage('assets/images/user details/join-us.png'),
                    fit: BoxFit.cover,
                    width: 80,
                    height: 80,
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 20))
                ],
              )


            ],
          ),
        ),
      ),
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
