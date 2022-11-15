
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_diet_guide/common/route_constants.dart';
import 'package:my_diet_guide/controllers/Controller.dart';
import 'package:my_diet_guide/screens/loading_page.dart';
import 'package:my_diet_guide/screens/view_plan_when_select.dart';

import '../common/messgae_constants.dart';
import '../models/DietPlan.dart';
import '../screens/change_plan.dart';
import '../screens/select_plan.dart';
import '../screens/view_diet.dart';


class DietPlanController extends Controller {

  DietPlanController({Key? key, required super.context}) : super(key: key);

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
        page = StreamBuilder<Map<String, dynamic>>(
            stream: DietPlanModel.getDietPlanForUser(user_id:Controller.auth!.currentUser!.uid).asStream(),
            builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot){
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LoadingPage();
              }
              if (snapshot.hasError || snapshot.data==null || !snapshot.data!['success'] && snapshot.data!['msg']!=MessageConstants.NoRegisteredPlan) {
                return const Text(
                  MessageConstants.errorMessage,
                  style: TextStyle(
                      color: Colors.white
                  ),
                );
              }
              if(!snapshot.data!['success']){
                return SelectPlan();
              }else{
                return ChangePlan(currentPlan: snapshot.data!['dietPlan'],);
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