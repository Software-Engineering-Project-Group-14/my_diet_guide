import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_diet_guide/screens/dashboard_change.dart';
import 'package:my_diet_guide/screens/web_screens/web_signup.dart';
import '../../common/route_constants.dart';
import '../../controllers/Controller.dart';
import '../../widgets/background_image.dart';
import '../../widgets/web_widgets/web_background_image.dart';
import '../signup.dart';

class WebLogin extends StatefulWidget {
  const WebLogin({Key? key}) : super(key: key);

  @override
  State<WebLogin> createState() => _WebLoginState();
}

class _WebLoginState extends State<WebLogin> {
  final _formKey = GlobalKey<FormState>();

  String _error = '';

  // text field state
  String email = '';
  String password = '';

  Future signIn() async {
    try{
      await Controller.auth!.signInWithEmailAndPassword(email: email, password: password);
      setState(() {
        _error = "Success";
      });
      Navigator.of(context).push(MaterialPageRoute(
          builder: (_){
            return DashboardChange();
          }
      ));

    }catch(error){
      //print(error.toString());
      setState(() {
        _error = "Login credentials are invalid.";
      });
    }
  }

  @override
  Widget build(BuildContext context){
    final currentWidth = MediaQuery.of(context).size.width;

    return Stack(
        children: [
          WebBackgroundImage(),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        'My Diet Guide',
                        style: TextStyle(
                            fontSize: 65,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        )
                    ),


                    const SizedBox(height: 70),

                    Form(
                      key: _formKey,
                      child: Column(
                        children: [

                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            width: 600,
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
                                      fontSize: 26,
                                      color: Colors.white,
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                        errorStyle: TextStyle(
                                            fontSize: 40,
                                            color: Colors.red[1000]
                                        ),
                                        contentPadding: EdgeInsets.symmetric(vertical: 20),
                                        border: InputBorder.none,
                                        hintText: 'Email',
                                        hintStyle: TextStyle(
                                            fontSize: 26,
                                            color: Colors.white
                                        ),
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 20),
                                          child: Icon(
                                            FontAwesomeIcons.solidEnvelope,
                                            color: Colors.white,
                                            size:32,
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
                            width: 600,
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
                                      fontSize: 26,
                                      color: Colors.white,
                                    ),
                                    keyboardType: TextInputType.text,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      errorStyle: TextStyle(
                                          fontSize: 40,
                                          color: Colors.red[1000]
                                      ),
                                      contentPadding: EdgeInsets.symmetric(vertical: 20),
                                      border: InputBorder.none,
                                      hintText: 'Password',
                                      hintStyle: TextStyle(
                                        fontSize: 26,
                                        color: Colors.white,
                                      ),
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 20),
                                        child: Icon(
                                          FontAwesomeIcons.lock,
                                          color: Colors.white,
                                          size: 32,
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
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  child: Text("forgot password?",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                    ),
                                  ),
                                  onTap: (){
                                    Navigator.pushNamed(context, RouteConstants.forgotPasswordRoute);
                                    // Navigator.push(context, MaterialPageRoute(builder: (context){
                                    //  return ForgotPassword();
                                    //}));
                                  },
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 75,),

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
                                width: 520,
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.teal.shade900,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Log in',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight:FontWeight.bold,
                                      fontSize: 24,
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
                        style: TextStyle(color: Colors.red, fontSize: 40.0),
                        key: Key("error-message"),
                      ),
                    ),

                    const SizedBox(height: 0),

                    // not a member? register now
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Not a member?  ',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_){
                                  return WebSignUp();
                                }
                            ));
                          },
                          child: Text(' Register Now',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.teal.shade900,
                              fontSize: 18
                            ),
                          ),
                        ),
                      ],
                    ),


                    // SizedBox(height: 40,),
                    //
                    //
                    // Container(
                    //   padding: EdgeInsets.only(right: currentWidth*0.025),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.end,
                    //     children: [
                    //       GestureDetector(
                    //         onTap: (){
                    //           Navigator.of(context).push(MaterialPageRoute(
                    //               builder: (_){
                    //                 return AdminLogin();
                    //               }
                    //           ));
                    //         },
                    //         child: Container(
                    //           padding: const EdgeInsets.all(10),
                    //           decoration: BoxDecoration(
                    //             color: Colors.teal.shade900,
                    //             borderRadius: BorderRadius.circular(8),
                    //           ),
                    //           child: const Center(
                    //             child: Text(
                    //               'Admin ?',
                    //               style: TextStyle(
                    //                 color: Colors.white,
                    //                 fontWeight:FontWeight.bold,
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),

                  ],
                ),
              ),
            ),
          ),
        ]
    );
  }
}
