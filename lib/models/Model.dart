import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Model{

  @protected
  static FirebaseAuth? auth;

  @protected
  static FirebaseFirestore? firestore;

  static void init({
    required FirebaseAuth auth,
    required FirebaseFirestore firestore
  }){
    Model.auth = auth;
    Model.firestore = firestore;
  }




}