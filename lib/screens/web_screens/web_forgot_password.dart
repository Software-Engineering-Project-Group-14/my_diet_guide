import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/blurred_background_image.dart';


class WebForgotPassword extends StatefulWidget {
  const WebForgotPassword({Key? key}) : super(key: key);

  @override
  State<WebForgotPassword> createState() => _WebForgotPasswordState();
}

class _WebForgotPasswordState extends State<WebForgotPassword> {

  final _formKey = GlobalKey<FormState>();

  String _error = '';

  // text field state
  String email = '';
  String password = '';

  Future passwordReset() async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            content: Text(
              'Password reset link sent. Check your email',
              style: TextStyle(
                  color: Colors.black,
                fontSize: 40
              ),
            ),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "OK",
                    style: TextStyle(
                      fontSize: 45
                    ),
                  )
              )
            ],
          );
        },
      );

    }on FirebaseException catch(error){
      // print(error.code);
      if(error.code == 'user-not-found'){
        setState(() {
          _error = 'This email is not signed up';
        });
      }else{
        setState(() {
          _error = 'An error occurred. Try again';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade900,
      body: Stack(
          children: [
            const BlurredBackground(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(40, 40, 40, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Enter Your Email and we will send you a password resetting mail',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50,),
                Form(
                  key: _formKey,
                  child: Column(

                    children: [
                      Padding(
                        padding: const EdgeInsets.all(40),
                        child: Container(
                          width: 800,
                          child: TextFormField(
                            style: TextStyle(
                                fontSize: 45
                            ),
                            decoration: InputDecoration(
                                errorStyle: TextStyle(
                                    fontSize: 40
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(color: Colors.white)
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.deepPurple),
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                hintText: 'Email',
                                fillColor: Colors.grey[200],
                                filled: true,
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
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.teal.shade900,
                                fixedSize: const Size(500, 80)
                            ),
                            child: Text(
                                'Reset Password',
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 45,
                                    color: Colors.white
                                )
                            ),
                            onPressed: () async {
                              if(_formKey.currentState!.validate()){
                                await passwordReset();
                              }
                            }
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        _error,
                        style: const TextStyle(color: Colors.red, fontSize: 40.0),

                      ),
                    ],
                  ),
                ),
              ],
            ),
          ]
      ),
    );
  }
}

