import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_diet_guide/models/UserBiometrics.dart';
import 'package:my_diet_guide/screens/signup.dart';
import 'package:my_diet_guide/widgets/background_image.dart';
import 'package:my_diet_guide/widgets/palatte.dart';
import 'forgot_password.dart';

class Login extends StatefulWidget{

  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  const Login({super.key, required this.firestore, required this.auth});

  @override
  State<Login> createState() => _LoginState();

}

class _LoginState extends State<Login> {

  final _formKey = GlobalKey<FormState>();

  String _error = '';

  // text field state
  String email = '';
  String password = '';

  Future signIn() async {
    try{
      await widget.auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      setState(() {
        _error = "Success";
      });

    }catch(error){
      //print(error.toString());
      setState(() {
        _error = "Login credentials are invalid.";
      });
    }
  }

  @override
  Widget build(BuildContext context){
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text(
                      'My Diet Guide',
                      style: HeadingTitle
                    ),


                    const SizedBox(height: 70),

                    Form(
                      key: _formKey,
                      child: Column(
                        children: [

                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade600.withOpacity(0.6),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: TextFormField(
                                    key: Key("email"),
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      errorStyle: TextStyle(
                                        fontSize: 15,
                                        color: Colors.red[1000]
                                      ),
                                      contentPadding: EdgeInsets.symmetric(vertical: 20),
                                      border: InputBorder.none,
                                      hintText: 'Email',
                                      hintStyle: TextStyle(
                                        fontSize: 22,
                                        color: Colors.white
                                      ),
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 20),
                                        child: Icon(
                                          FontAwesomeIcons.solidEnvelope,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      )
                                    ),
                                    validator: (text){
                                      if (text == null || text.isEmpty){
                                        return 'Can\'t be empty';
                                      }
                                      if(!EmailValidator.validate(text)){
                                        return 'Enter a valid email';
                                      }
                                      return null;
                                    },
                                    onChanged: (val) {
                                      setState(() => email = val);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),


                          SizedBox(height: 20.0),


                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade600.withOpacity(0.6),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                    child: TextFormField(
                                      key: Key("password"),
                                      style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.white,
                                      ),
                                      keyboardType: TextInputType.text,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        errorStyle: TextStyle(
                                            fontSize: 15,
                                            color: Colors.red[1000]
                                        ),
                                        contentPadding: EdgeInsets.symmetric(vertical: 20),
                                        border: InputBorder.none,
                                        hintText: 'Password',
                                        hintStyle: TextStyle(
                                          fontSize: 22,
                                          color: Colors.white,
                                        ),
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 20),
                                          child: Icon(
                                            FontAwesomeIcons.lock,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                      validator: (text){
                                        if (text == null || text.isEmpty){
                                          return 'Can\'t be empty';
                                        }
                                        return null;
                                      },
                                      onChanged: (val) {
                                        setState(() => password = val);
                                      },
                                    ),
                                ),
                              ],
                            ),
                          ),
                          


                          SizedBox(height: 10,),



                          // forgot password
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  child: Text("forgot password?",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                    ),
                                  ),
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context){
                                      return ForgotPassword();
                                    }));
                                  },
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 50,),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: GestureDetector(
                              key: Key("login-button"),
                              onTap: () async {
                                if(_formKey.currentState!.validate()){
                                  await signIn();
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.teal.shade900,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Log In',
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


                    SizedBox(height: 12.0),


                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        _error,
                        style: TextStyle(color: Colors.red, fontSize: 20.0),
                        key: Key("error-message"),
                      ),
                    ),

                    const SizedBox(height: 0),

                    // not a member? register now
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Not a member?',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_){
                                  return SignUp();
                                }
                            ));
                          },
                          child: Text(' Register Now',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.teal.shade900,
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

