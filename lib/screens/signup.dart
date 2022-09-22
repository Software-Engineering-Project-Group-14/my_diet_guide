import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[800],
        title: const Text('Check BMI',),
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

                    //Full Name
                    Row(
                      children: [
                        //current weight
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Name : ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        //input current weight
                        SizedBox(
                          width: 300,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              decoration: InputDecoration(
                                  labelText: 'Enter Name'
                              ),
                            ),
                          ),
                        )
                      ],
                    ),

                    //Email
                    Row(
                      children: [
                        //current weight
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Email : ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        //input current weight
                        SizedBox(
                          width: 250,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              decoration: InputDecoration(
                                  labelText: 'Enter Email'
                              ),
                            ),
                          ),
                        )
                      ],
                    ),

                    //Password
                    Row(
                      children: [
                        //password
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Password : ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        //input password
                        SizedBox(
                          width: 250,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  labelText: 'Enter Password'
                              ),
                            ),
                          ),
                        )
                      ],
                    ),

                    //current weight
                    Row(
                      children: [
                        //current weight
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Confirm \nPassword : ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        //input current weight
                        SizedBox(
                          width: 250,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  labelText: 'Confirm Password'
                              ),
                            ),
                          ),
                        )
                      ],
                    ),

                    //Address
                    Row(
                      children: [
                        //current weight
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Address : ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        //input current weight
                        SizedBox(
                          width: 250,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              decoration: InputDecoration(
                                  labelText: 'Enter Address'
                              ),
                            ),
                          ),
                        )
                      ],
                    ),

                    //Mobile No.
                    Row(
                      children: [
                        //Mobile No.
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Mobile No. : ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        //input Mobile No.
                        SizedBox(
                          width: 250,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              decoration: InputDecoration(
                                  labelText: 'Enter Mobile No.'
                              ),
                            ),
                          ),
                        )
                      ],
                    ),

                    SizedBox(height: 20,),
                    //Sign Up button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: GestureDetector(
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
