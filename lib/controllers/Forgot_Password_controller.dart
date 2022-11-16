import 'package:flutter/material.dart';
import 'package:my_diet_guide/controllers/Controller.dart';

import '../screens/forgot_password.dart';
import '../screens/web_screens/web_forgot_password.dart';

class ForgotPasswordController extends Controller {
  ForgotPasswordController({Key? key, required super.context}) : super(key: key);

  @override
  State<ForgotPasswordController> createState() => _ForgotPasswordControllerState();
}

class _ForgotPasswordControllerState extends State<ForgotPasswordController> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints){
          if(constraints.maxWidth < 600){
            return ForgotPassword();
          }else{
            return WebForgotPassword();
          }
        }
    );
  }
}