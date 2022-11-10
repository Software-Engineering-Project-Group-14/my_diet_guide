import 'package:flutter/material.dart';
import 'package:my_diet_guide/controllers/Controller.dart';

import '../screens/rate.dart';


class RateController extends Controller {
  const RateController({Key? key}) : super(key: key);

  @override
  State<RateController> createState() => _RateControllerState();
}

class _RateControllerState extends State<RateController> {
  @override
  Widget build(BuildContext context) {
    return Rate();
  }
}


