import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class Controller extends StatelessWidget {

  static FirebaseAuth? auth;
  static FirebaseFirestore? firestore;

  static void init({
    required FirebaseAuth auth,
    required FirebaseFirestore firestore
  }){
    Controller.auth = auth;
    Controller.firestore = firestore;
  }

  const Controller({Key? key}) : super(key: key);

}