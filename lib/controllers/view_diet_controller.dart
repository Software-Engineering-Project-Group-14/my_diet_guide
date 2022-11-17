import 'package:flutter/material.dart';
import 'package:my_diet_guide/controllers/Controller.dart';
import 'package:my_diet_guide/screens/view_diet.dart';
import 'package:my_diet_guide/screens/web_screens/web_view_diet.dart';


class ViewDietController extends Controller{
  late String user_id;
  ViewDietController({Key? key, required super.context, required this.user_id}) : super(key: key);

  @override
  State<ViewDietController> createState() => _ViewDietControllerState();
}

class _ViewDietControllerState extends State<ViewDietController> {

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if(constraints.maxWidth < 600) {
        return ViewDietPlan(user_id: widget.user_id);
      } else {
        return WebViewDietPlan(user_id: widget.user_id);
      }
    });
  }
}