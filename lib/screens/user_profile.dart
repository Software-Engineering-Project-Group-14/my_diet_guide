import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_diet_guide/models/UserBiometrics.dart';
import 'package:my_diet_guide/screens/update_user_details_form.dart';
import '../models/user.dart';
import '../widgets/blurred_background_image.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/side_bar.dart';

class UserProfile extends StatelessWidget {

  final String user_id;
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

  UserProfile({Key? key, required this.user_id}) : super(key: key);


  // Future getUserInfo(String user_id) async {
  //   DocumentSnapshot? ds1;
  //
  //   await FirebaseFirestore.instance.collection('user').doc(user_id).get().then((value){ds1 = value;});
  //
  //   firstName = ds1!['first name'];
  //   lastName = ds1!['last name'];
  //   bday = ds1!['birthday'];
  //
  //   DocumentSnapshot? ds2;
  //
  //   await FirebaseFirestore.instance.collection('user biometrics').doc(user_id).get().then((value){ds2 = value;});
  //
  //   gender = ds2!['gender'];
  //   weight = ds2!['weight'];
  //   targetWeight = ds2!['target weight'];
  //   dietaryPreference = ds2!['dietary preference'];
  //   activeness = ds2!['activeness'];
  //   intensity = ds2!['intensity'];
  // }


  Future<Map<String, dynamic>> readUser() async{
    final userDoc = FirebaseFirestore.instance.collection('user').doc(user_id);
    final snapshot1 = await userDoc.get();

    if(snapshot1.exists){
      User user = User.fromJson(snapshot1.data()!);
      firstName = user.firstName;
      lastName = user.lastName;
      bday = user.birthday;
    }

    final userBioDoc = FirebaseFirestore.instance.collection('user biometrics').doc(user_id);
    final snapshot2 = await userBioDoc.get();

    if(snapshot2.exists){
      UserBiometrics userBio = UserBiometrics.fromJson(snapshot2.data()!);
      gender = userBio.gender;
      weight = userBio.weight;
      height = userBio.height;
      targetWeight = userBio.targetWeight;
      dietaryPreference = userBio.dietaryPreference;
      activeness = userBio.activeness;
      intensity = userBio.intensity;
    }

    return {
      'first name' : firstName,
      'last name': lastName,
      'birthday' : bday,
      'gender': gender,
      'weight': weight,
      'height': height,
      'target weight': targetWeight,
      'dietary preference': dietaryPreference,
      'activeness': activeness,
      'intensity': intensity
    };
  }


  Widget buildUser(Map<String, dynamic> map) {

    firstName = map['first name'];
    lastName = map['last name'];
    bday = map['birthday'];

    gender= map['gender'];
    weight= map['weight'];
    height= map['height'];
    targetWeight= map['target weight'];
    dietaryPreference= map['dietary preference'];
    activeness= map['activeness'];
    intensity= map['intensity'];

    return Column(
      children: [
        SizedBox(height: 30,),

        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 20),
          child: Text("Name : $firstName", style: TextStyle(fontSize: 19, color: Colors.white),),
        ),

        SizedBox(height: 20,),

        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 20),
          child: Text("Birthday : $bday", style: TextStyle(fontSize: 19, color: Colors.white),),
        ),

        SizedBox(height: 20,),

        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 20),
          child: Text("Age : 23 years", style: TextStyle(fontSize: 19, color: Colors.white),),
        ),

        SizedBox(height: 20,),

        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 20),
          child: Text("Gender : $gender", style: TextStyle(fontSize: 19, color: Colors.white),),
        ),

        SizedBox(height: 20,),

        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 20),
          child: Text("Weight : $weight kg", style: TextStyle(fontSize: 19, color: Colors.white),),
        ),

        SizedBox(height: 20,),

        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 20),
          child: Text("Height : $height cm", style: TextStyle(fontSize: 19, color: Colors.white),),
        ),

        SizedBox(height: 20,),

        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 20),
          child: Text("Dietary Preference : $dietaryPreference", style: TextStyle(fontSize: 19, color: Colors.white),),
        ),

        SizedBox(height: 20,),

        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 20),
          child: Text("Activeness : $activeness", style: TextStyle(fontSize: 19, color: Colors.white),),
        ),

        SizedBox(height: 20,),

        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 20),
          child: Text("Dietary Intensity : $intensity", style: TextStyle(fontSize: 19, color: Colors.white),),
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
                Center(
                  child: Text("User Profile", style: TextStyle(color: Colors.white, fontSize: 28),),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: ClipRRect(
                    //borderRadius: BorderRadius.circular(28),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                      child: Container(
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
                              return data==null ? Center(child: Text("No User!"),) : buildUser(data!);
                            } else if (snapshot.hasError){
                              return Text('Something went wrong!');
                            } else {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
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
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => UpdateDetailsForm(user_id: user_id, firstName:firstName, lastName:lastName , bday: bday, weight: weight, height: height, targetWeight: targetWeight, dietaryPreference: dietaryPreference, activeness: activeness, intensity: intensity, gender: gender)));
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

      bottomNavigationBar: BottomBar(user_id: user_id),

    );
  }
}
