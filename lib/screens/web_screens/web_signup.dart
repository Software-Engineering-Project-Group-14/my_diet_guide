import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_diet_guide/common/route_constants.dart';
import 'package:my_diet_guide/screens/web_screens/web_user_details_form.dart';
import 'package:my_diet_guide/widgets/background_image.dart';
import 'package:my_diet_guide/widgets/palatte.dart';

class WebSignUp extends StatefulWidget {
  const WebSignUp({Key? key}) : super(key: key);

  @override
  State<WebSignUp> createState() => _WebSignUpState();
}

class _WebSignUpState extends State<WebSignUp> {

  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String confirmPassword = '';

  bool error = false;


  //function for sign up a user
  Future signUpFunc() async {
    if (passwordConfirmed()) {
      // Navigator.pushNamed(context, RouteConstants.userDetailsCreateRoute,
      //     arguments: <String, String>{
      //       'email': email,
      //       'password': password
      //     }
      // );
      Navigator.push(context, MaterialPageRoute(builder: (context) =>
        WebUserDetailsForm(email: email, password: password)));
    }
  }

  bool passwordConfirmed() {
    if (password == confirmPassword) {
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
  Widget build(BuildContext context) {
    return Stack(
        children: [
          BackgroundImage(),
          Scaffold(
            backgroundColor: Colors.transparent,

            body: Center(
              child: SingleChildScrollView(
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Sign Up',
                          style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          )
                      ),
                    ),


                    SizedBox(height: 45,),


                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade600.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            width: 500,
                            child: Center(
                              child: TextFormField(
                                style: TextStyle(
                                  fontSize: 26,
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                    errorStyle: TextStyle(
                                        fontSize: 15,
                                        color: Colors.red[1000]
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 20),
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
                                        size: 32,
                                      ),
                                    )
                                ),
                                onChanged: (val){
                                  setState(() => email = val);
                                },
                                validator: (text){
                                  if(text == null || text.isEmpty){
                                    return 'Cannot be empty';
                                  }
                                  return null;
                                },
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
                            width: 500,
                            child: Center(
                              child: TextFormField(
                                obscureText: true,
                                style: TextStyle(
                                  fontSize: 26,
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                  errorStyle: TextStyle(
                                      fontSize: 15,
                                      color: Colors.red[1000]
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 20),
                                  border: InputBorder.none,
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                      fontSize: 26,
                                      color: Colors.white
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
                                onChanged: (val){
                                  setState(() => password = val);
                                },
                                validator: (text){
                                  if(text == null || text.isEmpty){
                                    return 'Cannot be empty';
                                  }
                                  return null;
                                },
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
                            width: 500,
                            child: Center(
                              child: TextFormField(
                                obscureText: true,
                                style: TextStyle(
                                  fontSize: 26,
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                  errorStyle: TextStyle(
                                      fontSize: 15,
                                      color: Colors.red[1000]
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 20),
                                  border: InputBorder.none,
                                  hintText: 'Confirm Password',
                                  hintStyle: TextStyle(
                                      fontSize: 26,
                                      color: Colors.white
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
                                onChanged: (val){
                                  setState(() => confirmPassword = val);
                                },
                                validator: (text){
                                  if(text == null || text.isEmpty){
                                    return 'Cannot be empty';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),


                          SizedBox(height: 60,),


                          //Sign Up button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 550,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25.0),
                                  child: GestureDetector(
                                    onTap: () async {
                                      if(_formKey.currentState!.validate()){
                                        await signUpFunc();
                                      }
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                          color: Colors.teal.shade900,
                                          borderRadius: BorderRadius.circular(16)),
                                      child: Center(
                                        child: Text('Sign Up',
                                          style: TextStyle(color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25),),
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
                    //input email




                    SizedBox(height: 25,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already a member?',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, RouteConstants.homeRoute);
                            //   Navigator.of(context).push(MaterialPageRoute(
                            //      builder: (_){
                            //        return Login(firestore: FirebaseFirestore.instance, auth: FirebaseAuth.instance);
                            //      }
                            //   )
                            // );
                          },
                          child: Text('    Log in',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.teal.shade900,
                              fontSize: 18
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
