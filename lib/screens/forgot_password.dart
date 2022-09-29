import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/blurred_background_image.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

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
          return const AlertDialog(
            content: Text(
                'Password rest link sent. Check your email',
                style: TextStyle(
                  color: Colors.white
                ),
            ),
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal.shade900,
        appBar: AppBar(
          backgroundColor: Colors.teal.shade900,
          elevation: 0,
          title: const Text('Reset Password'),
          toolbarHeight: 100,
        ),
        body: Stack(
          children: [
            const BlurredBackground(),
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: Text(
                    'Enter Your Email and we will send you a password resetting mail',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
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
                                  borderSide: const BorderSide(color: Colors.white)
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.deepPurple),
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.deepPurple,
                                fixedSize: const Size(300, 50)
                            ),
                            child: Text(
                                'Reset Password',
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 20,
                                    color: Colors.black
                                )
                            ),
                            onPressed: () async {
                              if(_formKey.currentState!.validate()){
                                await passwordReset();
                              }
                            }
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      Text(
                        _error,
                        style: const TextStyle(color: Colors.red, fontSize: 14.0),

                      ),
                    ],
                  ),
                ),
              ],
            ),
          ]
        ),
      ),
    );
  }
}

