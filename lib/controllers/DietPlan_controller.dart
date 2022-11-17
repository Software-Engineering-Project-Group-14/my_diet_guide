
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_diet_guide/common/route_constants.dart';
import 'package:my_diet_guide/controllers/Controller.dart';
import 'package:my_diet_guide/screens/loading_page.dart';
import 'package:my_diet_guide/screens/view_plan_when_select.dart';
import 'package:my_diet_guide/screens/web_screens/web_change_plan.dart';

import '../common/messgae_constants.dart';
import '../models/DietPlan.dart';
import '../models/UserBiometrics.dart';
import '../screens/change_plan.dart';
import '../screens/select_plan.dart';
import '../screens/view_diet.dart';
import '../screens/web_screens/web_select_plan.dart';


class DietPlanController extends Controller {

  DietPlanController({Key? key, required super.context}) : super(key: key);

  @override
  State<DietPlanController> createState() => _DietPlanControllerState();



}

class _DietPlanControllerState  extends State<DietPlanController>{

  Future<Map<String, dynamic>> getData() async{
    Map<String, dynamic> ret = {};
    Map<String, dynamic> getCurrent = await DietPlanModel.getDietPlanForUser(user_id:Controller.auth!.currentUser!.uid);
    DietPlanModel? currentPlan;
    String? currentPlanId;
    if(getCurrent['success']) {
      currentPlan = getCurrent['dietPlan'];
      currentPlanId = currentPlan!.planId;
    }
    ret['currentPlan'] = currentPlan;
    ret['userBiometrics'] = await UserBiometrics.getUserBiometrics(user_id:Controller.auth!.currentUser!.uid);
    List<DietPlanModel> recommendedplan = await DietPlanModel.
    getMostReccomendedPlans(userBiometrics: ret['userBiometrics'], currentPlanId: currentPlanId);
    ret['recommendedPlans'] = recommendedplan;
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    final auth = Controller.auth;
    late Widget page;
    switch(widget.subRoute){


      case RouteConstants.planSelectSubRoute:{
        page = StreamBuilder<Map<String, dynamic>>(
            stream: getData().asStream(),
            builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot){
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LoadingPage();
              }
              if (snapshot.hasError || snapshot.data==null) {
                return Text(
                  snapshot.error.toString(),
                  style: TextStyle(
                      color: Colors.white
                  ),
                );
              }
              if(snapshot.data!['currentPlan']==null){
                return LayoutBuilder(
                    builder: (context, constraints){
                      if(constraints.maxWidth < 600){
                        return SelectPlan(recommendedPlans: snapshot.data!['recommendedPlans'],);
                      }else{
                        return WebSelectPlan(recommendedPlans: snapshot.data!['recommendedPlans'],);
                      }
                    }
                );
              }else{
                return LayoutBuilder(
                    builder: (context, constraints){
                      if(constraints.maxWidth < 600){
                        return ChangePlan(currentPlan: snapshot.data!['currentPlan'], recommendedPlans: snapshot.data!['recommendedPlans'],);
                      }else{
                        return WebChangePlan(currentPlan: snapshot.data!['currentPlan'],recommendedPlans: snapshot.data!['recommendedPlans'],);
                      }
                    }
                );
              }
            }
        );
      }
      break;

      case RouteConstants.planViewSubRoute:{
        page = ViewDietPlan(user_id: auth!.currentUser!.uid);
      }
      break;

      case RouteConstants.planViewSelectSubRoute:{

        final dietPlanModel = widget.arguments as DietPlanModel;
        page = ViewPlanSelect(dietPlanModel: dietPlanModel);
      }
      break;

      default:{
        throw Exception('Unknown route: ${RouteConstants.planRoute}${widget.subRoute} ');
      }

    }

    return page;

  }


}