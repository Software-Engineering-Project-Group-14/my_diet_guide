import 'package:flutter/material.dart';
import 'package:my_diet_guide/controllers/Controller.dart';
import 'package:my_diet_guide/screens/check_bmi.dart';

class BMIController extends Controller {
  const BMIController({Key? key}) : super(key: key);

  @override
  State<BMIController> createState() => _BMIControllerState();
}

class _BMIControllerState extends State<BMIController> {
  @override
  Widget build(BuildContext context) {
    return CheckBMI();
  }
}


