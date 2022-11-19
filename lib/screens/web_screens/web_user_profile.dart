import 'dart:ui';

import 'package:age_calculator/age_calculator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_diet_guide/screens/web_screens/web_update_user_details_form.dart';
import 'package:sizer/sizer.dart';

import '../../common/route_constants.dart';
import '../../controllers/Controller.dart';
import '../../widgets/web_widgets/web_blurred_backgound.dart';
import '../../widgets/web_widgets/web_user_navigation_bar.dart';

class WebUserProfile extends StatefulWidget {
  const WebUserProfile({Key? key}) : super(key: key);

  @override
  State<WebUserProfile> createState() => _WebUserProfileState();
}

class _WebUserProfileState extends State<WebUserProfile> {
  late String firstName;
  late String lastName;
  late String bday;
  late int age;
  late String gender;
  late double weight;
  late double height;
  late double targetWeight;
  late double currentWeight;
  late String dietaryPreference;
  late String activeness;
  late String intensity;


  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();


  Future<Map<String, dynamic>> readUser() async{
    final userDoc = Controller.firestore!.collection('user').doc(Controller.auth!.currentUser!.uid);
    final snapshot1 = await userDoc.get();

    if(snapshot1.exists){
      firstName = snapshot1.data()!['first name'];
      lastName = snapshot1.data()!['last name'];
      bday = snapshot1.data()!['birthday'];
    }

    return {
      'first name' : firstName,
      'last name': lastName,
      'birthday' : bday,
    };
  }



  Widget buildUser(Map<String, dynamic> map) {

    firstName = map['first name'];
    lastName = map['last name'];
    bday = map['birthday'];

    int byear = int.parse(bday.substring(0,4));
    int bmonth = int.parse(bday.substring(5,7));
    int bdate = int.parse(bday.substring(8,10));

    DateTime dob = DateTime(byear, bmonth, bdate);
    age = AgeCalculator.age(dob).years;

    return FutureBuilder<Map<String, dynamic>>(
        future: readUserBiometrics(firstName, lastName, bday, age),
        builder: (context, snapshot){
          if(snapshot.hasData){
            final data = snapshot.data;
            return data==null ? Center(child: Text("No User!"),) : buildUserBiometrics(data);
          } else if (snapshot.hasError){
            return Center(child: Text('Something went wrong!'));
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }
    );
  }



  Future<Map<String, dynamic>> readUserBiometrics(String firstName, String lastName, String bday, int age) async{
    final userBioDoc = FirebaseFirestore.instance.collection('user biometrics').doc(Controller.auth!.currentUser!.uid);
    final snapshot2 = await userBioDoc.get();

    if(snapshot2.exists){
      gender = snapshot2.data()!['gender'];
      weight = snapshot2.data()!['weight'];
      height = snapshot2.data()!['height'];
      targetWeight = snapshot2.data()!['target weight'];
      currentWeight = snapshot2.data()!['calculated_current_weight'];
      dietaryPreference = snapshot2.data()!['dietary preference'];
      activeness = snapshot2.data()!['activeness'];
      intensity = snapshot2.data()!['intensity'];
    }

    return {
      'first name': firstName,
      'last name': lastName,
      'bday': bday,
      'age': age,
      'gender': gender,
      'weight': weight,
      'height': height,
      'target weight': targetWeight,
      'current weight': currentWeight,
      'dietary preference': dietaryPreference,
      'activeness': activeness,
      'intensity': intensity
    };
  }



  Widget buildUserBiometrics(Map<String, dynamic> map) {
    firstName = map['first name'];
    lastName = map['last name'];
    bday = map['bday'];
    age = map['age'];
    gender= map['gender'];
    weight= map['weight'];
    height= map['height'];
    targetWeight= map['target weight'];
    dietaryPreference= map['dietary preference'];
    activeness= map['activeness'];
    intensity= map['intensity'];

    return Column(
      key: Key('user-biometrics'),
      children: [
        SizedBox(height: 30,),

        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Text("Name : $firstName $lastName", style: TextStyle(fontSize: 19, color: Colors.white),),
        ),

        SizedBox(height: 20,),

        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Text("Birthday : $bday", style: TextStyle(fontSize: 19, color: Colors.white),),
        ),

        SizedBox(height: 20,),

        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Text("Age : $age years", style: TextStyle(fontSize: 19, color: Colors.white),),
        ),

        SizedBox(height: 20,),

        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Text("Gender : $gender", style: TextStyle(fontSize: 19, color: Colors.white),),
        ),

        SizedBox(height: 20,),

        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Text("Weight before diet : $weight kg", style: TextStyle(fontSize: 19, color: Colors.white),),
        ),

        SizedBox(height: 20,),

        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Text("Current Weight : ${currentWeight.toStringAsFixed(3)} kg", style: TextStyle(fontSize: 19, color: Colors.white),),
        ),

        SizedBox(height: 20,),

        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Text("Target Weight : $targetWeight kg", style: TextStyle(fontSize: 19, color: Colors.white),),
        ),

        SizedBox(height: 20,),

        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Text("Height : $height cm", style: TextStyle(fontSize: 19, color: Colors.white),),
        ),

        SizedBox(height: 20,),

        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Text("Dietary Preference : $dietaryPreference", style: TextStyle(fontSize: 19, color: Colors.white),),
        ),

        SizedBox(height: 20,),

        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Text("Activeness : $activeness", style: TextStyle(fontSize: 19, color: Colors.white),),
        ),

        SizedBox(height: 20,),

        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Text("Intensity : $intensity", style: TextStyle(fontSize: 19, color: Colors.white),),
        ),


        SizedBox(height: 30,),
      ],
    );
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
            child: Column(
              children: [
                SizedBox(height: 30,),
                // Center(
                //   child: Text("User Id - ${widget.user_id}", style: TextStyle(color: Colors.white, fontSize: 28),),
                // ),
                Center(
                  child: Text("User Profile", style: TextStyle(color: Colors.white, fontSize: 40),),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: ClipRRect(
                    //borderRadius: BorderRadius.circular(28),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                      child: Column(
                        children: [
                          Container(
                            width: 400,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Colors.white24, Colors.white10],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight
                                ),
                                //borderRadius: BorderRadius.circular(28),
                                border: Border.all(width: 2, color: Colors.white10)
                            ),
                            child: FutureBuilder<Map<String,dynamic>>(
                              future: readUser(),
                              builder: (context, snapshot){
                                if(snapshot.hasData){
                                  final data = snapshot.data;
                                  return data==null ? Center(child: Text("No User!"),) : buildUser(data);
                                } else if (snapshot.hasError){
                                  return Center(child: Text('Something went wrong!'));
                                } else {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),

                Center(
                  child: TextButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.all(25)),
                          backgroundColor: MaterialStateProperty.all(Colors.teal.shade900),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ))
                      ),
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WebUpdateDetailsForm(user_id: FirebaseAuth.instance.currentUser!.uid)));
                        //Navigator.pushNamed(context, RouteConstants.userDetailsUpdateRoute);
                      },
                      child: Container(
                        child: Text("Update My Details", style: TextStyle(color: Colors.white, fontSize: 18),),
                      )
                  ),
                ),

                SizedBox(height: 40,),
              ],
            ),
          ),
        ],
      ),

    );
  }
}
