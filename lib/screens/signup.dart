import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();

  bool error = false;
  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _firstnameController.dispose();
    _lastnameController.dispose();
    super.dispose();
  }

  //function for sign up a user
  Future signUpFunc() async{
    if(passwordConfirmed()){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());

      //add user details
      addUserDetails(
          _firstnameController.text.trim(),
          _lastnameController.text.trim(),
          _emailController.text.trim());
      showDialog(context: context, builder: (context){
        return AlertDialog(
            content: Text('User Added!'),
            backgroundColor: Colors.green[200],
            actions: <Widget>[
              new MaterialButton(
                color: Colors.green,
                child: new Text("OK", style: TextStyle(color: Colors.white),),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ]
        );
      });
    }

  }
  Future addUserDetails(
      String firstname, String lastname, String email
      ) async {
    await FirebaseFirestore.instance.collection('user').add(
      {
        'first name' : firstname,
        'last name' : lastname,
        'email' : email
      }
    );
  }

  bool passwordConfirmed(){
    if(_passwordController.text.trim() == _confirmPasswordController.text.trim()){
      return true;
    }else{
      showDialog(context: context, builder: (context){
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[800],
        title: const Text('Sign Up',),
      ),

      body: SafeArea(
          child: SingleChildScrollView(
            child:
                Column(
                  children: [

                    SizedBox(height: 10,),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Sign Up',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    SizedBox(height: 30,),
                    //First Name
                        SizedBox(
                          width: 300,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: TextField(
                                controller: _firstnameController,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.grey
                                    )
                                  ),
                                    labelText: 'Enter First Name',
                                ),
                              ),
                            ),
                          ),
                        ),

                    SizedBox(height: 10,),
                    //Last Name
                        SizedBox(
                          width: 300,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: _lastnameController,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: Colors.grey
                                      )
                                  ),
                                  labelText: 'Enter Last Name'
                              ),
                            ),
                          ),
                        ),


                    SizedBox(height: 10,),
                        //input email
                        SizedBox(
                          width: 300,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: Colors.grey
                                      )
                                  ),
                                  labelText: 'Enter Email'
                              ),
                            ),
                          ),
                        ),

                    SizedBox(height: 10,),
                    //Password
                        //input password
                        SizedBox(
                          width: 300,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: _passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: Colors.grey
                                      )
                                  ),
                                  labelText: 'Enter Password'
                              ),
                            ),
                          ),
                        ),

                    SizedBox(height: 10,),
                    //Confirm password
                        SizedBox(
                          width: 300,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: _confirmPasswordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: Colors.grey
                                      )
                                  ),
                                  labelText: 'Confirm Password'
                              ),
                            ),
                          ),
                        ),


                    SizedBox(height: 10,),
                    SizedBox(height: 20,),
                    //Sign Up button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: GestureDetector(
                        onTap: signUpFunc,
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                            child: Text('Sign Up',
                              style: TextStyle(color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
          ),
      ),
    );
  }
}
