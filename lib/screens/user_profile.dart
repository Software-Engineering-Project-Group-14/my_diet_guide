import 'dart:ui';
import 'package:age_calculator/age_calculator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_diet_guide/models/UserBiometrics.dart';
import 'package:my_diet_guide/screens/update_user_details_form.dart';
import '../models/user.dart';
import '../widgets/blurred_background_image.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/side_bar.dart';


class UserProfile extends StatefulWidget {

  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  //final String user_id;

  const UserProfile({Key? key, required this.firestore, required this.auth}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}



class _UserProfileState extends State<UserProfile> {
  late String firstName;
  late String lastName;
  late String bday;
  late int age;
  late String gender;
  late int weight;
  late int height;
  late int targetWeight;
  late String dietaryPreference;
  late String activeness;
  late String intensity;


  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();


  Future<Map<String, dynamic>> readUser() async{
    final userDoc = widget.firestore.collection('user').doc(widget.auth.currentUser!.uid);
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


    return Column(
      key: Key("user-details"),
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

        SizedBox(height: 10,),

      ],
    );
  }



  Future<Map<String, dynamic>> readUserBiometrics() async{
    final userBioDoc = FirebaseFirestore.instance.collection('user biometrics').doc(widget.auth.currentUser!.uid);
    final snapshot2 = await userBioDoc.get();

    if(snapshot2.exists){
      gender = snapshot2.data()!['gender'];
      weight = snapshot2.data()!['weight'];
      height = snapshot2.data()!['height'];
      targetWeight = snapshot2.data()!['target weight'];
      dietaryPreference = snapshot2.data()!['dietary preference'];
      activeness = snapshot2.data()!['activeness'];
      intensity = snapshot2.data()!['intensity'];
    }

    return {
      'gender': gender,
      'weight': weight,
      'height': height,
      'target weight': targetWeight,
      'dietary preference': dietaryPreference,
      'activeness': activeness,
      'intensity': intensity
    };
  }



  Widget buildUserBiometrics(Map<String, dynamic> map) {
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
        SizedBox(height: 10,),

        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Text("Gender : $gender", style: TextStyle(fontSize: 19, color: Colors.white),),
        ),

        SizedBox(height: 20,),

        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Text("Weight : $weight kg", style: TextStyle(fontSize: 19, color: Colors.white),),
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
          child: Text("Target Weight : $targetWeight kg", style: TextStyle(fontSize: 19, color: Colors.white),),
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
      appBar: AppBar(
        backgroundColor: Colors.teal.shade900,
        elevation: 0,
      ),

      drawer: NavigationDrawer(),

      body: Stack(
        children: [
          BlurredBackground(),

          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30,),
                // Center(
                //   child: Text("User Id - ${widget.user_id}", style: TextStyle(color: Colors.white, fontSize: 28),),
                // ),
                Center(
                  child: Text("User Profile", style: TextStyle(color: Colors.white, fontSize: 28),),
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
                            width: 360,
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

                          Container(
                            width: 360,
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
                              future: readUserBiometrics(),
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
                      padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                      backgroundColor: MaterialStateProperty.all(Colors.teal.shade900),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ))
                    ),
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => UpdateDetailsForm(user_id: widget.auth.currentUser!.uid, firestore: widget.firestore, auth: widget.auth)));
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

      bottomNavigationBar: BottomBar(user_id: widget.auth.currentUser!.uid, firestore: widget.firestore, auth: widget.auth,),

    );
  }

}
