import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_diet_guide/screens/signup.dart';

import 'forgot_password.dart';

class Login extends StatefulWidget{
  const Login({super.key});

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
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
    }catch(error){
      //print(error.toString());
      setState(() {
        _error = "Login credentials are invalid.";
      });
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.menu_book,
                  size: 50,
                ),
                // Hello again
                Text(
                  'Welcome to',
                  style: GoogleFonts.poppins(
                      fontSize: 52
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'MyDietGuide',
                  style: GoogleFonts.poppins(
                      fontSize: 52
                  ),
                ),
                const SizedBox(height: 50),

                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: Colors.white)
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.deepPurple),
                                  borderRadius: BorderRadius.circular(12)
                              ),
                              hintText: 'Email',
                              fillColor: Colors.grey[200],
                              filled: true
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
                      SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.white)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.deepPurple),
                                borderRadius: BorderRadius.circular(12)
                            ),
                            hintText: 'Password',
                            fillColor: Colors.grey[200],
                            filled: true,
                          ),
                          validator: (text){
                            if (text == null || text.isEmpty){
                              return 'Can\'t be empty';
                            }
                            return null;
                          },
                          obscureText: true,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                        ),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.deepPurple,
                                fixedSize: Size(300, 50)
                            ),
                            child: Text(
                                'Sign In',
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 20,
                                    color: Colors.black
                                )
                            ),
                            onPressed: () async {
                              if(_formKey.currentState!.validate()){
                                await signIn();
                              }
                            }
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.0),
                Text(
                  _error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),

                ),

                const SizedBox(height: 25,),

                //Not a memeber register now
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                              'Not a memeber?',
                              style: GoogleFonts.notoSans(
                                  fontSize: 15,
                                  color: Colors.indigo
                              )
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_){
                                    return SignUp();
                                  }
                              ));
                            },
                            child: Text(
                              ' Register now',
                              style: GoogleFonts.notoSans(
                                  fontSize: 15,
                                  color: Colors.indigo
                              ),),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_){
                                    return ForgotPassword();
                                  },
                                ));
                              },
                              child: Text(
                                  'Forgot Password?',
                                  style: GoogleFonts.notoSans(
                                      fontSize: 15,
                                      color: Colors.red
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}

