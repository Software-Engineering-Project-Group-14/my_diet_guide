
import 'package:flutter/material.dart';
import 'package:my_diet_guide/common/route_constants.dart';
import 'package:my_diet_guide/controllers/Controller.dart';
import 'package:my_diet_guide/screens/loading_page.dart';
import 'package:my_diet_guide/screens/view_plan_when_select.dart';
import 'package:my_diet_guide/screens/web_screens/add_diet_plan.dart';
import 'package:my_diet_guide/screens/web_screens/update_diet_plan.dart';
import 'package:my_diet_guide/screens/web_screens/view_all_plans.dart';
import 'package:my_diet_guide/screens/web_screens/web_change_plan.dart';
import 'package:my_diet_guide/screens/web_screens/web_view_plan_select.dart';

import '../models/DietPlan.dart';
import '../models/Dish.dart';
import '../models/Meal.dart';
import '../models/UserBiometrics.dart';
import '../screens/change_plan.dart';
import '../screens/dashboard_change.dart';
import '../screens/login.dart';
import '../screens/select_plan.dart';
import '../screens/view_diet.dart';
import '../screens/web_screens/web_login.dart';
import '../screens/web_screens/web_select_plan.dart';
import '../screens/web_screens/web_view_diet.dart';


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
  
  Future<Map<String, Map<String, Dish?>>> getAllDish(DietPlanModel dietPlanModel) async{
    Map<String, Map<String, Dish?>> dietDetails = {};
    Meal? breakfast = await Meal.get(dietPlanModel.breakfast_id, 'breakfast');
    Meal? lunch = await Meal.get(dietPlanModel.lunch_id, 'lunch');
    Meal? dinner = await Meal.get(dietPlanModel.dinner_id, 'dinner');
    dietDetails['monday'] = {};
    dietDetails['monday']!['breakfast'] = await Dish.get(breakfast!.monday_dish_id);
    dietDetails['monday']!['lunch'] = await Dish.get(lunch!.monday_dish_id);
    dietDetails['monday']!['dinner'] = await Dish.get(dinner!.monday_dish_id);
    dietDetails['tuesday'] = {};
    dietDetails['tuesday']!['breakfast'] = await Dish.get(breakfast.tuesday_dish_id);
    dietDetails['tuesday']!['lunch'] = await Dish.get(lunch.tuesday_dish_id);
    dietDetails['tuesday']!['dinner'] = await Dish.get(dinner.tuesday_dish_id);
    dietDetails['wednesday'] = {};
    dietDetails['wednesday']!['breakfast'] = await Dish.get(breakfast.wednesday_dish_id);
    dietDetails['wednesday']!['lunch'] = await Dish.get(lunch.wednesday_dish_id);
    dietDetails['wednesday']!['dinner'] = await Dish.get(dinner.wednesday_dish_id);
    dietDetails['thursday'] = {};
    dietDetails['thursday']!['breakfast'] = await Dish.get(breakfast.thursday_dish_id);
    dietDetails['thursday']!['lunch'] = await Dish.get(lunch.thursday_dish_id);
    dietDetails['thursday']!['dinner'] = await Dish.get(dinner.thursday_dish_id);
    dietDetails['friday'] = {};
    dietDetails['friday']!['breakfast'] = await Dish.get(breakfast.friday_dish_id);
    dietDetails['friday']!['lunch'] = await Dish.get(lunch.friday_dish_id);
    dietDetails['friday']!['dinner'] = await Dish.get(dinner.friday_dish_id);
    dietDetails['saturday'] = {};
    dietDetails['saturday']!['breakfast'] = await Dish.get(breakfast.saturday_dish_id);
    dietDetails['saturday']!['lunch'] = await Dish.get(lunch.saturday_dish_id);
    dietDetails['saturday']!['dinner'] = await Dish.get(dinner.saturday_dish_id);
    dietDetails['sunday'] = {};
    dietDetails['sunday']!['breakfast'] = await Dish.get(breakfast.sunday_dish_id);
    dietDetails['sunday']!['lunch'] = await Dish.get(lunch.sunday_dish_id);
    dietDetails['sunday']!['dinner'] = await Dish.get(dinner.sunday_dish_id);
    return dietDetails;
  }
  
  
  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Controller.auth!.authStateChanges(),
      builder: (context, snapshot){
        if(snapshot.hasData){
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
              page = LayoutBuilder(
                  builder: (context, constraints){
                    if(constraints.maxWidth < 600){
                      return ViewDietPlan(user_id: auth!.currentUser!.uid);
                    }else{
                      return WebViewDietPlan(user_id: auth!.currentUser!.uid);
                    }
                  }
              );
            }
            break;

            case RouteConstants.planViewSelectSubRoute:{
              if(widget.arguments == null){
                return DashboardChange();
              }
              final dietPlanModel = widget.arguments as DietPlanModel;
              
              page = LayoutBuilder(builder: (context, constraints){
                if(constraints.maxWidth < 600){
                  return  ViewPlanSelect(dietPlanModel: dietPlanModel);
                } else {

                  return StreamBuilder(
                      stream: getAllDish(dietPlanModel).asStream(),
                      builder: (BuildContext context,AsyncSnapshot<Map<String, Map<String, Dish?>>> snapshot){
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
                        final dietDetails = snapshot.data;
                        return WebViewPlanWhenSelect(dietDetails: dietDetails!);

                  });
                }
              });
            }
            break;

            case RouteConstants.planViewAllUpdateSubRoute:{
              page = StreamBuilder(
                  stream: DietPlanModel.getAllPlans().asStream(),
                  builder: (BuildContext context, AsyncSnapshot<List<DietPlanModel>> snapshot){
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const LoadingPage();
                    }
                    if (snapshot.hasError || snapshot.data==null) {
                      return Text(
                        snapshot.error.toString(),
                        style: TextStyle(
                            color: Colors.black
                        ),
                      );
                    }
                    List<DietPlanModel> l = snapshot.data!;
                    return WebAllPlansView(allPlans: l);
                  }
              );
            }
            break;

            case RouteConstants.planAddSubRoute:{
              page = AddDietPlan();
            }
            break;

            case RouteConstants.planUpdateSubRoute:{
              page = UpdateDietPlan();
            }
            break;


            default:{
              throw Exception('Unknown route: ${RouteConstants.planRoute}${widget.subRoute} ');
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