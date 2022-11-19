import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_diet_guide/screens/web_screens/web_admin_nav_bar.dart';
import 'package:my_diet_guide/widgets/web_widgets/web_delete_diet_card.dart';

import '../../widgets/web_widgets/web_blurred_backgound.dart';

class DeleteDietPlan extends StatefulWidget {
  const DeleteDietPlan({Key? key}) : super(key: key);

  @override
  State<DeleteDietPlan> createState() => _DeleteDietPlanState();
}

class _DeleteDietPlanState extends State<DeleteDietPlan> {
  List<String> docIds = [];

  Future getDocId() async{
    await FirebaseFirestore.instance.collection('diet_plan').get().then((QuerySnapshot querySnapshot) => {
      querySnapshot.docs.forEach((doc) {
        docIds.add(doc.id);
      })
    });
  }
  bool isNumeric(String s) {
    return double.tryParse(s) != null;
  }

  Widget buildBreakfastDiet(Map<String, dynamic> map){
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('breakfast');
    return
        FutureBuilder<DocumentSnapshot>(
            future: collectionReference.doc(map['breakfast_id']).get(),
            builder: ((context, snapshot){
              if((snapshot.connectionState == ConnectionState.done)){
                Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                return WebDeleteDietCard(details: data, meal: "Breakfast",); //data is a map
              }
              return CircularProgressIndicator();
            })
        );
  }
  Widget buildLunchDiet(Map<String, dynamic> map){
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('lunch');
    return
      FutureBuilder<DocumentSnapshot>(
          future: collectionReference.doc(map['lunch_id']).get(),
          builder: ((context, snapshot){
            if((snapshot.connectionState == ConnectionState.done)){
              Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
              return WebDeleteDietCard(details: data, meal: 'Lunch',); //data is a map
            }
            return CircularProgressIndicator();
          })
      );
  }
  Widget buildDinnerDiet(Map<String, dynamic> map){
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('dinner');
    return
      FutureBuilder<DocumentSnapshot>(
          future: collectionReference.doc(map['dinner_id']).get(),
          builder: ((context, snapshot){
            if((snapshot.connectionState == ConnectionState.done)){
              Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
              return WebDeleteDietCard(details: data, meal: 'Dinner',); //data is a map
            }
            return CircularProgressIndicator();
          })
      );
  }

  Widget getCollections(BuildContext context, String docId){
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('diet_plan');
    return Column(
      children: [
        Divider(color: Colors.white , thickness: 2, indent: 20, endIndent: 20,),
        ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.white24, Colors.white10],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight
                  ),
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(docId, style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),

                  SizedBox(width: 20,),

                  FutureBuilder<DocumentSnapshot>(
                      future: collectionReference.doc(docId).get(),
                      builder: ((context, snapshot){
                        if((snapshot.connectionState == ConnectionState.done) && isNumeric(docId)){
                          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                          return buildBreakfastDiet(data); //data is a map
                        }
                        return CircularProgressIndicator();
                      })
                  ),
                  SizedBox(width: 20,),

                  FutureBuilder<DocumentSnapshot>(
                      future: collectionReference.doc(docId).get(),
                      builder: ((context, snapshot){
                        if((snapshot.connectionState == ConnectionState.done) && isNumeric(docId)){
                          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                          return buildLunchDiet(data); //data is a map
                        }
                        return CircularProgressIndicator();
                      })
                  ),
                  SizedBox(width: 20,),

                  FutureBuilder<DocumentSnapshot>(
                      future: collectionReference.doc(docId).get(),
                      builder: ((context, snapshot){
                        if((snapshot.connectionState == ConnectionState.done) && isNumeric(docId)){
                          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                          return buildDinnerDiet(data); //data is a map
                        }
                        return CircularProgressIndicator();
                      })
                  ),

                  SizedBox(width: 150,),
                  TextButton(
                    onPressed: () async{
                      var collection = FirebaseFirestore.instance.collection('diet_plan');
                      await collection.doc(docId).delete();
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DeleteDietPlan()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Delete Plan", style: TextStyle(color: Colors.white),),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red.shade400),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 10)),
                        elevation: MaterialStateProperty.all(5),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
        Divider(color: Colors.white , thickness: 2, indent: 20, endIndent: 20,),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.teal.shade900,
      appBar: WebAdminNavBar(),
      body:
         Stack(
           children: [
             WebBlurredBackground(),
             FutureBuilder(
              future: getDocId(),
              builder: (context, snapshot){
                  return ListView.builder(
                    itemCount: docIds.length,
                    itemBuilder: (context, index){
                      return ListTile(
                        title: isNumeric(docIds[index]) ? getCollections(context, docIds[index]): Text(''),
                      );
                    },
                  );
              },
        ),
           ],
         ),
    );
  }
}

