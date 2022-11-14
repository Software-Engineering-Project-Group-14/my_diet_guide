import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_diet_guide/models/Model.dart';

abstract class Controller extends StatefulWidget {

  static FirebaseAuth? auth;

  static FirebaseFirestore? firestore;

  late String subRoute;
  late String parentRoute;
  late String route;
  late dynamic arguments;
  final BuildContext context;

  static void init({
    required FirebaseAuth auth,
    required FirebaseFirestore firestore
  }){
    Controller.auth = auth;
    Controller.firestore = firestore;
    Model.init(auth: auth, firestore: firestore);
  }

  Controller({Key? key, required this.context}) : super(key: key){
    route = ModalRoute.of(context)!.settings.name!;
    List<String> routesList = route.split('/');
    if(routesList.length == 1){
      parentRoute = '';
    }else if( routesList.length >= 2){
      parentRoute = routesList[1];
      if(routesList.length >=3)  subRoute = routesList[2];
    }
    arguments = ModalRoute.of(context)!.settings.arguments;
  }

}