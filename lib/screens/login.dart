import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_diet_guide/screens/signup.dart';
import 'package:my_diet_guide/widgets/background_image.dart';
import 'package:my_diet_guide/widgets/palatte.dart';
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

                          // Padding(
                          //   padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                          //   child: TextFormField(
                          //     decoration: InputDecoration(
                          //         enabledBorder: OutlineInputBorder(
                          //             borderRadius: BorderRadius.circular(12),
                          //             borderSide: BorderSide(color: Colors.white)
                          //         ),
                          //         focusedBorder: OutlineInputBorder(
                          //             borderSide: BorderSide(color: Colors.deepPurple),
                          //             borderRadius: BorderRadius.circular(12)
                          //         ),
                          //         hintText: 'Email',
                          //         fillColor: Colors.grey[200],
                          //         filled: true
                          //     ),
                          //     validator: (text){
                          //       if (text == null || text.isEmpty){
                          //         return 'Can\'t be empty';
                          //       }
                          //       if(!EmailValidator.validate(text)){
                          //         return 'Enter a valid email';
                          //       }
                          //       return null;
                          //     },
                          //     onChanged: (val) {
                          //       setState(() => email = val);
                          //     },
                          //   ),
                          // ),

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
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
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
                                      style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.white,
                                      ),
                                      keyboardType: TextInputType.text,
                                      obscureText: true,
                                      decoration: InputDecoration(
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


                          // Padding(
                          //   padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                          //   child: TextFormField(
                          //     decoration: InputDecoration(
                          //       enabledBorder: OutlineInputBorder(
                          //           borderRadius: BorderRadius.circular(12),
                          //           borderSide: BorderSide(color: Colors.white)
                          //       ),
                          //       focusedBorder: OutlineInputBorder(
                          //           borderSide: BorderSide(color: Colors.deepPurple),
                          //           borderRadius: BorderRadius.circular(12)
                          //       ),
                          //       hintText: 'Password',
                          //       fillColor: Colors.grey[200],
                          //       filled: true,
                          //     ),
                          //     validator: (text){
                          //       if (text == null || text.isEmpty){
                          //         return 'Can\'t be empty';
                          //       }
                          //       return null;
                          //     },
                          //     obscureText: true,
                          //     onChanged: (val) {
                          //       setState(() => password = val);
                          //     },
                          //   ),
                          // ),



                          SizedBox(height: 50,),



                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: ElevatedButton(
                          //       style: ElevatedButton.styleFrom(
                          //           primary: Colors.deepPurple,
                          //           fixedSize: Size(300, 50)
                          //       ),
                          //       child: Text(
                          //           'Sign In',
                          //           style: GoogleFonts.aBeeZee(
                          //               fontSize: 20,
                          //               color: Colors.black
                          //           )
                          //       ),
                          //       onPressed: () async {
                          //         if(_formKey.currentState!.validate()){
                          //           await signIn();
                          //         }
                          //       }
                          //   ),
                          // ),


                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: GestureDetector(
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


                    Text(
                      _error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),

                    ),

                    const SizedBox(height: 0),

                    //Not a memeber register now
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    //   child: Column(
                    //     children: [
                    //       Row(
                    //         children: [
                    //           Text(
                    //               'Not a memeber?',
                    //               style: GoogleFonts.notoSans(
                    //                   fontSize: 15,
                    //                   color: Colors.indigo
                    //               )
                    //           ),
                    //           GestureDetector(
                    //             onTap: () {
                    //               Navigator.of(context).push(MaterialPageRoute(
                    //                   builder: (_){
                    //                     return SignUp();
                    //                   }
                    //               ));
                    //             },
                    //             child: Text(
                    //               ' Register now',
                    //               style: GoogleFonts.notoSans(
                    //                   fontSize: 15,
                    //                   color: Colors.indigo
                    //               ),),
                    //           )
                    //         ],
                    //       ),
                    //       Padding(
                    //         padding: const EdgeInsets.only(top: 10),
                    //         child: Row(
                    //           children: [
                    //             GestureDetector(
                    //               onTap: (){
                    //                 Navigator.of(context).push(MaterialPageRoute(
                    //                   builder: (_){
                    //                     return ForgotPassword();
                    //                   },
                    //                 ));
                    //               },
                    //               child: Text(
                    //                   'Forgot Password?',
                    //                   style: GoogleFonts.notoSans(
                    //                       fontSize: 15,
                    //                       color: Colors.red
                    //                   )
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // )


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

