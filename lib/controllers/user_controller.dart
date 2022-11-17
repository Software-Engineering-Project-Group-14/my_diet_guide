

import 'package:flutter/material.dart';
import 'package:my_diet_guide/common/route_constants.dart';
import 'package:my_diet_guide/controllers/Controller.dart';

import '../screens/login.dart';
import '../screens/update_user_details_form.dart';
import '../screens/user_details_form.dart';
import '../screens/user_profile.dart';
import '../screens/web_screens/web_login.dart';


class UserDetailsController extends Controller {


  UserDetailsController({Key? key, required super.context}) : super(key: key);

  @override
  State<UserDetailsController> createState() => _UserDetailsControllerState();



}

class _UserDetailsControllerState  extends State<UserDetailsController>{
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Controller.auth!.authStateChanges(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          late Widget page;
          switch(widget.subRoute){

            case RouteConstants.userDetailsViewSubRoute:{
              page = UserProfile();
            }
            break;

            case RouteConstants.userDetailsCreateSubRoute:{
              final args = widget.arguments as Map<String, String>;
              page = UserDetailsForm(
                  email: args['email']!,
                  password: args['password']!
              );
            }
            break;

            case RouteConstants.userDetailsUpdateSubRoute:{
              page = UpdateDetailsForm(user_id: Controller.auth!.currentUser!.uid);
            }
            break;

            default:{
              throw Exception('Unknown route: ${RouteConstants.userDetailsRoute}${widget.subRoute} ');
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