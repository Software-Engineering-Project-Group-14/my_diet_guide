import 'package:flutter/material.dart';
import 'package:my_diet_guide/controllers/Controller.dart';

import '../screens/view_diet_details.dart';


class DietController extends Controller {

  final dynamic arguments;

  const DietController({
    Key? key,
    required this.arguments
  }) : super(key: key);

  @override
  State<DietController> createState() => _DietControllerState();
}

class _DietControllerState extends State<DietController> {

  @override
  Widget build(BuildContext context) {
    final args = widget.arguments as Map<String, dynamic>;
    return DietDetails(user_id: args['user_id'], day: args['day']);
  }
}


