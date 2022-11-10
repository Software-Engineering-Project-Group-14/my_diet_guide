import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:my_diet_guide/common/route_constants.dart';
import 'package:my_diet_guide/controllers/Controller.dart';

import '../models/UserBiometrics.dart';
import '../screens/change_plan.dart';
import '../screens/select_plan.dart';
import '../screens/view_diet.dart';


class DietPlanController extends Controller {

  final String subRoute;
  final dynamic? arguments;

  const DietPlanController({
    super.key,
    required this.subRoute,
    this.arguments
  });

  @override
  State<DietPlanController> createState() => _DietPlanControllerState();



}

class _DietPlanControllerState  extends State<DietPlanController>{

  @override
  Widget build(BuildContext context) {
    final auth = Controller.auth;
    late Widget page;
    switch(widget.subRoute){

      case RouteConstants.planSelectSubRoute:{
        final userBiometrics = widget.arguments as UserBiometrics;
        page = SelectPlan(userBiometrics: userBiometrics);
      }
      break;

      case RouteConstants.planViewSubRoute:{
        page = ViewDietPlan(user_id: auth!.currentUser!.uid);
      }
      break;

      case RouteConstants.planChangeSubRoute:{
        page = ChangePlan();
      }
      break;

      default:{
        throw Exception('Unknown route: ${RouteConstants.planRoute}${widget.subRoute} ');
      }

    }

    return page;

    /*
    return Navigator(
      key: GlobalKey<NavigatorState>(),
      initialRoute: widget.subRoute,
      onGenerateRoute: (settings) {
        late Widget page;

        if(settings.name == RouteConstants.planSelectSubRoute){
          final userBiometrics = widget.arguments as UserBiometrics;
          page = SelectPlan(userBiometrics: userBiometrics);

        }else if(settings.name == RouteConstants.planViewSubRoute){
          page = ViewDietPlan(user_id: auth!.currentUser!.uid);

        }else if(settings.name == RouteConstants.planChangeSubRoute){
          page = ChangePlan();

        }else{
          throw Exception('Unknown route: ${RouteConstants.planRoute}${settings.name} ');
        }

        return MaterialPageRoute<dynamic>(
          builder: (context) {
            return page;
          },
          settings: settings,
        );
      },
    );
     */
  }


}