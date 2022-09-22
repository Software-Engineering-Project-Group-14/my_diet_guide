import 'package:flutter/material.dart';

class UpdateUserDetailsPage extends StatefulWidget {
  const UpdateUserDetailsPage({Key? key}) : super(key: key);

  @override
  State<UpdateUserDetailsPage> createState() => _UpdateUserDetailsPageState();
}

class _UpdateUserDetailsPageState extends State<UpdateUserDetailsPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // TextEditingController weight = TextEditingController();
  // TextEditingController height = TextEditingController();
  // TextEditingController targetWeight = TextEditingController();

  late String new_weight;
  late String new_height;
  late String new_targetWeight;
  String? new_dietaryPreference;
  String? new_intensity;
  String? new_activeness;

  final dietary_preferences = ['Vegetarian', 'Classical', 'Chinese', 'Low carb'];

  final active_types = ['Not very active', 'Moderately active', 'Active'];

  final intensities = ['Easy', 'Standard', 'Difficult'];

  DropdownMenuItem<String> buildMenuItem(String dp) =>
      DropdownMenuItem(
        value: dp,
        child: Text(dp, style: TextStyle(fontSize: 17),),
      );

  @override
  Widget build(BuildContext context) {

    // weight.text = '70';
    // height.text = '155';
    // targetWeight.text = '60';
    // String? dietaryPreference = 'Vegetarian';
    // String? intensity = 'Medium';
    // String? activeness = 'Active';

    //new_weight = weight.text;
    //new_height = height.text;
    //new_targetWeight = targetWeight.text;

    return Scaffold(
      backgroundColor: Colors.green.shade100,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40,),

              Text("Update User Details",
                  style: TextStyle(
                      fontSize: 32, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left),

              SizedBox(height: 40,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child:Row(
                  children: [
                    Text("Weight(kg) : ", style: TextStyle(fontSize: 17),),

                    Flexible(
                      child: TextFormField(
                        //controller: weight,
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
                          new_weight = text!;
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
                        //controller: height,
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
                          new_height = text!;
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
                        //controller: targetWeight,
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
                          new_targetWeight = text!;
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
                            value: new_dietaryPreference,
                            items: dietary_preferences.map(buildMenuItem).toList(),
                            onChanged: (value) => setState(() {
                              this.new_dietaryPreference=value;
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
                            value: new_activeness,
                            items: active_types.map(buildMenuItem).toList(),
                            onChanged: (value) => setState(() {
                              this.new_activeness=value;
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
                            value: new_intensity,
                            items: intensities.map(buildMenuItem).toList(),
                            onChanged: (value) => setState(() {
                              this.new_intensity=value;
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
                      'Update',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                      ),
                    ),
                  )
              ),

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
