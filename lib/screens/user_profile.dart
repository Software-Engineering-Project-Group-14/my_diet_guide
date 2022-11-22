import 'dart:ui';
import 'package:age_calculator/age_calculator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../common/route_constants.dart';
import '../controllers/Controller.dart';
import '../widgets/blurred_background_image.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/side_bar.dart';


class UserProfile extends StatefulWidget {


  //final String user_id;

  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}



class _UserProfileState extends State<UserProfile> {
  late String firstName;
  late String lastName;
  late String bday;
  late int age;
  late String gender;
  late num weight;
  late num height;
  late num targetWeight;
  late num currentWeight;
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
    print(firstName);
    print(lastName);
    print(bday);

    int byear = int.parse(bday.substring(0,4));
    int bmonth = int.parse(bday.substring(5,7));
    int bdate = int.parse(bday.substring(8,10));

    DateTime dob = DateTime(byear, bmonth, bdate);
    age = AgeCalculator.age(dob).years;
    print(age);

    return FutureBuilder<Map<String, dynamic>>(
      future: readUserBiometrics(firstName, lastName, bday, age),
      builder: (context, snapshot){
        if(snapshot.hasData){
          final data = snapshot.data;
          return data==null ? Center(child: Text("No User!"),) : buildUserBiometrics(data);
        } else if (snapshot.hasError){
          print(snapshot.error.toString());
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
    print(snapshot2.data()!.toString());

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

    print(firstName + lastName + bday + age.toString() + gender + weight.toString() + height.toString() + targetWeight.toString() + currentWeight.toString() + dietaryPreference + activeness + activeness);

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
                  //    Navigator.of(context).push(MaterialPageRoute(builder: (context) => UpdateDetailsForm(user_id: widget.auth.currentUser!.uid, firestore: widget.firestore, auth: widget.auth)));
                      Navigator.pushNamed(context, RouteConstants.userDetailsUpdateRoute);
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

      bottomNavigationBar: BottomBar(user_id: Controller.auth!.currentUser!.uid),

    );
  }

}
