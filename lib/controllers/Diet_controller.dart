import 'package:flutter/material.dart';
import 'package:my_diet_guide/controllers/Controller.dart';
import 'package:my_diet_guide/screens/loading_page.dart';

import '../common/route_constants.dart';
import '../models/Dish.dart';
import '../screens/error.dart';
import '../screens/view_diet_day_when_select.dart';
import '../screens/view_diet_details.dart';


class DietController extends Controller {

  DietController({Key? key, required super.context}) : super(key: key);

  @override
  State<DietController> createState() => _DietControllerState();
}

class _DietControllerState extends State<DietController> {

  @override
  Widget build(BuildContext context) {

    final auth = Controller.auth;
    late Widget page;

    switch(widget.subRoute){
      case RouteConstants.dietViewSubRoute:{
        final args = widget.arguments as Map<String, dynamic>;
        page = DietDetails(user_id: args['user_id'], day: args['day']);
      }
      break;
      case RouteConstants.dietViewSelectSubRoute:{
        try{
          final args = widget.arguments as Map<String, dynamic>;
          page = StreamBuilder<Map<String, Dish>>(
              stream: Dish.getByDay(
                  day: args['day'],
                  breakfast_id: args['breakfast_id'],
                  lunch_id: args['lunch_id'],
                  dinner_id: args['dinner_id']
              ).asStream(),
              builder: (BuildContext context, AsyncSnapshot<Map<String, Dish>> snapshot){
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const LoadingPage();
                }
                return ViewDietWhenSelect(
                  dishBreakfast: snapshot.data!['dishBreakfast']!,
                  dishLunch: snapshot.data!['dishLunch']!,
                  dishDinner: snapshot.data!['dishDinner']!,
                  day: args['day'],
                );
              }
          );
        }catch(error){
          return ErrorScreen();
        }
      }
    }
    return page;
  }
}


