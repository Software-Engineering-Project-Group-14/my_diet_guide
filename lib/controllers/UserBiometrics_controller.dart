
import 'package:flutter/material.dart';
import 'package:my_diet_guide/common/route_constants.dart';
import 'package:my_diet_guide/controllers/Controller.dart';

import '../screens/login.dart';
import '../screens/update_user_biometrics_form.dart';
import '../screens/user_biometrics_form.dart';
import '../screens/web_screens/web_login.dart';

class UserBiometricsController extends Controller {


  UserBiometricsController({Key? key, required super.context}) : super(key: key);

  @override
  State<UserBiometricsController> createState() => _UserBiometricsControllerState();
}

class _UserBiometricsControllerState extends State<UserBiometricsController> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Controller.auth!.authStateChanges(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          late Widget page;
          switch(widget.subRoute){

            case RouteConstants.bioCreateSubRoute:{
              final args = widget.arguments as Map<String, dynamic>;
              page = UserBiometricsForm(
                  email: args['email'],
                  password: args['password'],
                  firstName: args['firstName'],
                  lastName: args['lastName'],
                  age: args['age'],
                  bday: args['bday'],
                  gender: args['gender']
              );
            }
            break;

            case RouteConstants.bioUpdateSubRoute:{
              final args = widget.arguments as Map<String, dynamic>;
              page =UpdateBiometricsForm(
                user_id: args['user_id']!,
                firstName: args['firstName']!,
                lastName: args['lastName']!,
                bday: args['bday']!,
                gender: args['gender']!,
                age: args['age']!,
              );

            }
            break;

            default:{
              throw Exception('Unknown route: ${RouteConstants.bioRoute}${widget.subRoute} ');
            }

          }

          return page;
        }else{
          return LayoutBuilder(builder: (context, constraints){
            if(constraints.maxWidth < 600){
              return Login();
            } else {
              return WebLogin();
            }
          });
        }
      },
    );
  }

}
