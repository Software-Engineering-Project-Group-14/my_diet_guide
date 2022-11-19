import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../common/route_constants.dart';
import '../../models/ProgressRecorder.dart';
import '../../widgets/web_widgets/web_blurred_backgound.dart';
import '../../widgets/web_widgets/web_user_navigation_bar.dart';

class WebRecordProgress extends StatefulWidget {

  final String user_id;
  final String meal;
  final String dishName;
  final String dishImage;
  final String description;

  const WebRecordProgress({Key? key, required this.user_id, required this.meal, required this.dishName, required this.dishImage, required this.description}) : super(key: key);

  @override
  State<WebRecordProgress> createState() => _WebRecordProgressState();
}

class _WebRecordProgressState extends State<WebRecordProgress> {
  @override
  Widget build(BuildContext context) {
    var today_day_int = DateTime.now().weekday;
    late String today_day;

    if(today_day_int==1){
      today_day='Monday';
    } else if(today_day_int==2){
      today_day='Tuesday';
    } else if(today_day_int==3){
      today_day='Wednesday';
    }else if(today_day_int==4){
      today_day='Thursday';
    }else if(today_day_int==5){
      today_day='Friday';
    }else if(today_day_int==6){
      today_day='Saturday';
    }else if(today_day_int==7){
      today_day='Sunday';
    }

    String month = DateTime.now().month.toString().padLeft(2, '0');
    String date = DateTime.now().day.toString().padLeft(2, '0');
    String today_date = '${DateTime.now().year}/$month/$date';

    return Scaffold(
      backgroundColor: Colors.teal.shade900,
      appBar: WebUserNavBar(),

      body: Stack(
        children: [
          WebBlurredBackground(),

          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Center(
                      child: Text('Record Your Progress', style: TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),),
                    ),
                  ),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(28),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                      child: Container(
                        width: 75.w,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.white24, Colors.white10],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight
                            ),
                            borderRadius: BorderRadius.circular(28),
                            border: Border.all(width: 2, color: Colors.white10)
                        ),
                        child: Column(
                          children: [

                            Padding(
                              padding: const EdgeInsets.only(top: 30, bottom: 50),
                              child: Text("${widget.meal}  :  $today_date - $today_day", style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),),
                            ),


                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  //width: 44.w,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [

                                      Center(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(24),
                                          child: Image(
                                            image: AssetImage(widget.dishImage),
                                            fit: BoxFit.cover,
                                            width: 200,
                                            height: 200,
                                          ),
                                        ),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 10),
                                        child: Text(widget.dishName, style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),),
                                      ),

                                      SizedBox(height: 30,),

                                      Padding(
                                          padding: EdgeInsets.only(bottom: 50),
                                          child: Container(
                                            width: 25.w,
                                            child: Text(widget.description, style: TextStyle(color: Colors.white, fontSize: 18), textAlign: TextAlign.center,),
                                          )
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(width: 10.w,),

                                Container(
                                  //width: 40.w,
                                  padding: EdgeInsets.only(right: 25),
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 80),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 25),
                                          child: Text("Record Your Progress", style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold)),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              children: [
                                                Column(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: ()async{
                                                        ProgressRecorder.recordProgress(widget.user_id, DateTime.now(), widget.meal, widget.dishName, "Did not complete");
                                                        Navigator.pushNamed(context, RouteConstants.homeRoute);
                                                      },
                                                      child: Container(
                                                        padding: EdgeInsets.only(bottom: 5),
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(25),
                                                          color: Colors.yellow.shade300,
                                                        ),
                                                        width: 25,
                                                        height: 25,
                                                      ),
                                                    ),
                                                    SizedBox(height: 10,),
                                                    Text("Did not complete", style: TextStyle(color: Colors.white, fontSize: 15),)
                                                  ],
                                                ),

                                                SizedBox(height: 40,),

                                                Column(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: (){
                                                        ProgressRecorder.recordProgress(widget.user_id, DateTime.now(), widget.meal, widget.dishName, "Partially Completed");
                                                        Navigator.pushNamed(context, RouteConstants.homeRoute);
                                                      },
                                                      child: Container(
                                                        padding: EdgeInsets.only(bottom: 5),
                                                        width: 25,
                                                        height: 25,
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(25),
                                                          color:Colors.lime.shade400,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 10,),
                                                    Text("Partially Completed", style: TextStyle(color: Colors.white, fontSize: 15),)
                                                  ],
                                                ),
                                              ],
                                            ),

                                            SizedBox(width: 35,),

                                            Column(
                                              children: [
                                                Column(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: (){
                                                        ProgressRecorder.recordProgress(widget.user_id, DateTime.now(), widget.meal, widget.dishName, "Completed");
                                                        Navigator.pushNamed(context, RouteConstants.homeRoute);
                                                      },
                                                      child: Container(
                                                        padding: EdgeInsets.only(bottom: 5),
                                                        width: 25,
                                                        height: 25,
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(25),
                                                          color: Colors.green.shade300,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 10,),
                                                    Text("Completed", style: TextStyle(color: Colors.white, fontSize: 15),)
                                                  ],
                                                ),

                                                SizedBox(height: 40,),


                                                Column(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: (){
                                                        ProgressRecorder.recordProgress(widget.user_id, DateTime.now(), widget.meal, widget.dishName, "Over ate");
                                                        Navigator.pushNamed(context, RouteConstants.homeRoute);
                                                      },
                                                      child: Container(
                                                        padding: EdgeInsets.only(bottom: 5),
                                                        width: 25,
                                                        height: 25,
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(25),
                                                          color: Colors.red,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 10,),
                                                    Text("Over ate", style: TextStyle(color: Colors.white, fontSize: 15),)
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),



                                // if(isRecorded == false) Text('') else Text('Your progress already has been recorded. If you want to change, You can change below'),
                                //
                                // SizedBox(height: 20,),

                                Container(
                                  child: Column(
                                    children: [

                                    ],
                                  ),
                                ),



                                SizedBox(height: 40,),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
