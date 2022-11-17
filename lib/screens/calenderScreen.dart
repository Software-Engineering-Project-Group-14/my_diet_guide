import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_diet_guide/models/Calorie_Calculator.dart';
import 'package:my_diet_guide/widgets/blurred_background_image.dart';
import 'package:my_diet_guide/widgets/bottom_bar.dart';
import 'package:my_diet_guide/widgets/side_bar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../controllers/Controller.dart';

class DietCalender extends StatefulWidget {
  const DietCalender({Key? key}) : super(key: key);

  @override
  State<DietCalender> createState() => _DietCalenderState();
}

class _DietCalenderState extends State<DietCalender> {

  String user_id = Controller.auth!.currentUser!.uid;


  Future<String> getPlanId(String user_id) async {
    final userDoc = FirebaseFirestore.instance.collection('user').doc(user_id);
    final userSnapshot = await userDoc.get();

    String current_plan = userSnapshot.data()!['current_plan'];
    print('current plan id: ' + current_plan);

    return current_plan;
  }


  Widget goToUserBiometrics(String user_id, String plan_id){
    return FutureBuilder<Map<String, dynamic>>(
      future: getUserBiometrics(user_id),
      builder: (context, snapshot){
        if (snapshot.hasData){
          final json = snapshot.data;
          if(json==null){
            return Center(child: Text("No User!"),);
          } else {
            double target_weight = json['target_weight'];
            double current_weight = json['current_weight'];
            double weight_loss_per_day = json['weight_loss_per_day'];
            return goToPlan(plan_id, target_weight, current_weight, weight_loss_per_day);
          }
        } else if(snapshot.hasError){
          return Text("No User Biometrics!", style: TextStyle(color: Colors.white),);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }
    );
  }


  Future<Map<String, dynamic>> getUserBiometrics(String user_id) async {
    print('user_id : '+ user_id);
    final userBioDoc = FirebaseFirestore.instance.collection('user biometrics').doc(user_id);
    final userBioSnapshot = await userBioDoc.get();

    print(userBioSnapshot.data()!);

    String gender = userBioSnapshot.data()!['gender'];
    print('gender :'+ gender);
    String activeness = userBioSnapshot.data()!['activeness'];
    print('activeness :'+ activeness);
    double weight = userBioSnapshot.data()!['weight'];
    print('weight :'+ weight.toString());
    double height = userBioSnapshot.data()!['height'];
    print('height :'+ height.toString());
    int age = userBioSnapshot.data()!['age'];
    print('age :'+ age.toString());
    double target_weight = userBioSnapshot.data()!['target weight'];
    print('target weight :'+ target_weight.toString());
    double current_weight = userBioSnapshot.data()!['calculated_current_weight'];
    print('calculated_current_weight :'+ current_weight.toString());


    double weight_loss_per_day = CalorieCalculator.calorieBurnPerDayInKg(gender, height, weight, age.toDouble(), activeness);
    print('weight_loss_per_day : '+ weight_loss_per_day.toString());

    return{
      'target_weight': target_weight,
      'current_weight': current_weight,
      'weight_loss_per_day': weight_loss_per_day
    };
  }



  Widget goToPlan(String plan_id, double target_weight, double current_weight, double weight_loss_per_day){
    return FutureBuilder<int>(
      future: getPlanDetails(plan_id, target_weight, current_weight, weight_loss_per_day),
      builder: (context, snapshot){
        if (snapshot.hasData){
          final no_of_days_to_diet = snapshot.data;
          if(no_of_days_to_diet==null){
            return Center(child: Text("No User!"),);
          } else {
            return createCalendar(no_of_days_to_diet);
          }
        } else if(snapshot.hasError){
          return Text("No Plan details!", style: TextStyle(color: Colors.white));
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }
    );
  }


  Future<int> getPlanDetails(String plan_id, double target_weight, double current_weight, double weight_loss_per_day) async {
    final planDoc = FirebaseFirestore.instance.collection('diet_plan').doc(plan_id);
    final planSnapshot = await planDoc.get();

    int calorie_gain_per_week = planSnapshot.data()!['calorie_gain_per_plan_per_week'];
    double weight_gain_per_day = CalorieCalculator.calorieToKg(calorie_gain_per_week.toDouble())/7;

    // check if this is a positive value
    double mean_weight_loss_per_day = weight_loss_per_day - weight_gain_per_day;

    int no_of_days_to_diet = ((current_weight- target_weight)/mean_weight_loss_per_day).ceil();
    print('mean weight loss per day : '+ mean_weight_loss_per_day.toString());
    print('weight to be lost : ' + (current_weight- target_weight).toString());
    print("target weight : "+ target_weight.toString());
    print("current weight : "+ current_weight.toString());
    print("no_of_days : "+ ((current_weight - target_weight)/0.2).toString());
    print("no_of_days_to_diet : " + no_of_days_to_diet.toString());
    return no_of_days_to_diet;
  }



  Widget createCalendar(int no_of_days_to_diet){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.white24, Colors.white10],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight
                ),
                borderRadius: BorderRadius.circular(28),
                border: Border.all(width: 2, color: Colors.white10)
            ),
            child: SfCalendar(
              view: CalendarView.month,
              dataSource: MeetingDataSource(getAppointments(no_of_days_to_diet)),
              initialSelectedDate: DateTime.now(),
              initialDisplayDate: DateTime.now(),
              appointmentBuilder: (context, calendarAppointmentDetails) {
                return Container();
              },
              appointmentTextStyle: TextStyle(color: Colors.white, fontSize: 5),
              cellBorderColor: Colors.transparent,
              headerStyle: CalendarHeaderStyle(textStyle: TextStyle(color: Colors.white)),
              monthViewSettings: MonthViewSettings(
                  showAgenda: true,
                  agendaStyle: AgendaStyle(
                      appointmentTextStyle: TextStyle(fontSize: 20, color: Colors.white),
                      backgroundColor: Colors.teal.shade900
                  ),
                  appointmentDisplayMode: MonthAppointmentDisplayMode.indicator,
                  showTrailingAndLeadingDates: false,
                  monthCellStyle: MonthCellStyle(
                    textStyle: TextStyle(color: Colors.white),
                  )
              ),
            ),
          ),
        ),
      ),
    );
  }




  @override
  Widget build(BuildContext context) {
    String user_id = Controller.auth!.currentUser!.uid;

    return Scaffold(
      backgroundColor: Colors.teal.shade900,
      appBar: AppBar(
        backgroundColor: Colors.teal.shade900,
        elevation: 0,
      ),

      drawer: NavigationDrawer(),

      body: Stack(
        children: [
          BlurredBackground(),


          FutureBuilder<String>(
            future: getPlanId(user_id),
            builder: (context, snapshot){
              if (snapshot.hasData){
                final plan_id = snapshot.data;
                return plan_id==null ? Center(child: Text("No User!"),) : goToUserBiometrics(user_id, plan_id);
              } else if(snapshot.hasError){
                return Text("No User Details", style: TextStyle(color: Colors.white));
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
          ),


        ],
      ),

      bottomNavigationBar: BottomBar(user_id: user_id),

    );
  }
}


List<Appointment> getAppointments(int no_of_days_to_diet){
  List<Appointment> meetings = <Appointment>[];

  final DateTime today = DateTime.now();
  final DateTime startTime = DateTime(today.year, today.month, today.day, 0,0,0);
  final DateTime endTime = startTime.add(Duration(hours: 23, minutes: 59, seconds: 59));

  meetings.add(Appointment(
    startTime: startTime,
    endTime: endTime,
    color: Colors.teal.shade900,
    subject: 'Diet',
    isAllDay: true,
    recurrenceRule: "FREQ=DAILY;COUNT=$no_of_days_to_diet",
    notes: 'bla bla bla'
  )
  );

  return meetings;
}


class MeetingDataSource extends CalendarDataSource{
  MeetingDataSource(List<Appointment> source){
    appointments = source;
  }
}