import 'package:flutter/material.dart';

class UserDetails2 extends StatefulWidget {
  const UserDetails2({Key? key}) : super(key: key);

  @override
  State<UserDetails2> createState() => _UserDetails2State();
}

class _UserDetails2State extends State<UserDetails2> {

  int currentStep = 0;

  List<Step> getSteps() => [
    Step(
      title: Text("Goal"),
      content: Container(),
      isActive: currentStep>=0,
    ),
    Step(
      title: Text("Activeness"),
      content: Container(),
      isActive: currentStep>=1,
    ),
    Step(
      title: Text("Difficulty"),
      content: Container(),
      isActive: currentStep>=2,
    ),
    Step(
      title: Text("Dietary Preference"),
      content: Container(),
      isActive: currentStep>=3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stepper(
        type: StepperType.vertical,
        steps: getSteps(),
        currentStep: currentStep,
        onStepContinue: (){

          final isLastStep = currentStep == getSteps().length-1;

          if(isLastStep){
            //send data to server
          } else{
            setState(() {
              currentStep += 1;
            });
          }
        },
        onStepCancel: (){
          currentStep == 0 ? null : () => setState(() {
            currentStep -= 1;
          });
        },
      ),
    );

    Widget getGoalsContainer(){
      
    }
  }
}
