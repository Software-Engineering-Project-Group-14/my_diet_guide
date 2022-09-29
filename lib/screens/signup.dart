import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_diet_guide/screens/user_details_form.dart';
import 'package:my_diet_guide/widgets/background_image.dart';
import 'package:my_diet_guide/widgets/palatte.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  //text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool error = false;


  //function for sign up a user
  //function for sign up a user
  Future signUpFunc() async {
    if (passwordConfirmed()) {
      String email = _emailController.text.trim();
      String password = _passwordController.text.trim();
      Navigator.push(context, MaterialPageRoute(builder: (context) =>
          UserDetailsForm(email: email, password: password)));
    }
  }

    bool passwordConfirmed() {
      if (_passwordController.text.trim() ==
          _confirmPasswordController.text.trim()) {
        return true;
      } else {
        showDialog(context: context, builder: (context) {
          return AlertDialog(
              content: Text('Passwords doesn\'t match!'),
              backgroundColor: Colors.red[200],
              actions: <Widget>[
                new MaterialButton(
                  color: Colors.red,
                  child: new Text("OK", style: TextStyle(color: Colors.white),),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ]
          );
        });
        return false;
      }
    }

    @override
    void dispose() {
      // TODO: implement dispose
      _emailController.dispose();
      _passwordController.dispose();
      _confirmPasswordController.dispose();
      super.dispose();
    }

    @override
    Widget build(BuildContext context) {
      return Stack(
          children: [
            BackgroundImage(),
            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                title: const Text('Sign Up',),
              ),

              body: SafeArea(
                child: SingleChildScrollView(
                  child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      SizedBox(height: 30,),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Sign Up',
                            style: HeadingTitle
                        ),
                      ),


                      SizedBox(height: 25,),
                      //input email
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade600.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        width: 300,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: TextField(
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                              ),
                              controller: _emailController,
                              decoration: InputDecoration(
                                errorStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.red[1000]
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 0),
                                border: InputBorder.none,
                                hintText: '   Email',
                                hintStyle: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 25,),
                      //Password
                      //input password
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade600.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        width: 300,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: TextField(
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                              ),
                              controller: _passwordController,
                              decoration: InputDecoration(
                                errorStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.red[1000]
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 0),
                                border: InputBorder.none,
                                hintText: '   Password',
                                hintStyle: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 25,),
                      //Confirm password
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade600.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        width: 300,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: TextField(
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                              ),
                              controller: _confirmPasswordController,
                              decoration: InputDecoration(
                                errorStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.red[1000]
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 0),
                                border: InputBorder.none,
                                hintText: '   Confirm Password',
                                hintStyle: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 70,),
                      //Sign Up button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 350,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25.0),
                              child: GestureDetector(
                                onTap: signUpFunc,
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      color: Colors.teal.shade900,
                                      borderRadius: BorderRadius.circular(16)),
                                  child: Center(
                                    child: Text('Sign Up',
                                      style: TextStyle(color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),),
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
              ),
            ),
          ]
      );
    }
  }
