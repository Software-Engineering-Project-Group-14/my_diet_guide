import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget{
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();

}

class _LoginState extends State<Login> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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

                //Email text field
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email'
                        ),
                      ),
                    ),
                  ),
                ),

                //Password text field
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password'
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                  child: Container(
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Center(
                      child: Text(
                          'Sign In',
                          style: GoogleFonts.aBeeZee(
                              fontSize: 20
                          )
                      ),

                    ),
                  ),
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
                          Text(
                            ' Register now',
                            style: GoogleFonts.notoSans(
                                fontSize: 15,
                                color: Colors.indigo
                            ),)
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Text(
                                'Forgot Password?',
                                style: GoogleFonts.notoSans(
                                    fontSize: 15,
                                    color: Colors.red
                                )
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
