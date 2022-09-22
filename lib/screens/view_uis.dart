import 'package:flutter/material.dart';
import 'package:my_diet_guide/screens/change_plan.dart';
import 'package:my_diet_guide/screens/check_bmi.dart';
import 'package:my_diet_guide/screens/login.dart';
import 'package:my_diet_guide/screens/rate.dart';
import 'package:my_diet_guide/screens/record_progress_page.dart';
import 'package:my_diet_guide/screens/signup.dart';
import 'package:my_diet_guide/screens/update_user_details.dart';
import 'package:my_diet_guide/screens/user_dashboard.dart';
import 'package:my_diet_guide/screens/user_details.dart';
import 'package:my_diet_guide/screens/view_diet.dart';

class ViewUI extends StatelessWidget {
  const ViewUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            height: 100,
            //color: Colors.yellow,
            child: Center(
              child: TextButton(
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200),
                  padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(20.0)),
                ),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_){
                      return SignUp();
                    }
                  ));
                },
              ),
            ),
          ),



          Container(
            height: 100,
            //color: Colors.yellow,
            child: Center(
              child: TextButton(
                child: Text(
                  "Log In",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200),
                  padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(20.0)),
                ),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_){
                        return Login();
                      }
                  ));
                },
              ),
            ),
          ),



          Container(
            height: 100,
            //color: Colors.yellow,
            child: Center(
              child: TextButton(
                child: Text(
                  "Enter User Details",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200),
                  padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(20.0)),
                ),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_){
                        return UserDetails();
                      }
                  ));
                },
              ),
            ),
          ),



          Container(
            height: 100,
            //color: Colors.yellow,
            child: Center(
              child: TextButton(
                child: Text(
                  "User Dashboard",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200),
                  padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(20.0)),
                ),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_){
                        return UserDashboard();
                      }
                  ));
                },
              ),
            ),
          ),


        ],
      ),
    );
  }
}
