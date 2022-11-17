import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ViewDiet{
  late String user_id;
  late String dietary_preference;
  late String intensity;
  late String activeness;
  ViewDiet({required this.user_id});

  Future<Map<String, dynamic>> getInfo() async{
    final userBioDoc = FirebaseFirestore.instance.collection('user biometrics').doc(user_id);
    final bioSnapshot = await userBioDoc.get();

    if(bioSnapshot.exists){
      dietary_preference = bioSnapshot['dietary preference'];
      intensity = bioSnapshot['intensity'];
      activeness = bioSnapshot['activeness'];
    }

    return{
      'dietary_preference':dietary_preference,
      'intensity': intensity,
      'activeness': activeness
    };
  }

}