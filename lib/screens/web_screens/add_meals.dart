import 'package:flutter/material.dart';
import 'package:my_diet_guide/widgets/background_image.dart';

class AddMeals extends StatefulWidget {

  final String dietary_preference;
  final String activeness;
  final String intensity;
  final String gender;
  final String ageGroup;

  const AddMeals({Key? key, required this.dietary_preference, required this.activeness, required this.intensity, required this.gender, required this.ageGroup}) : super(key: key);

  @override
  State<AddMeals> createState() => _AddMealsState();
}

class _AddMealsState extends State<AddMeals> {

  final GlobalKey<FormState> _breakfastFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _lunchFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _dinnerFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Row(
              children: [
                Form(
                  key: _breakfastFormKey,
                  child: Column(
                  )
                ),



                Form(
                    key: _lunchFormKey,
                    child: Column(
                    )
                ),



                Form(
                    key: _dinnerFormKey,
                    child: Column(
                    )
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
