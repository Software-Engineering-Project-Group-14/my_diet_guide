import 'package:cloud_firestore/cloud_firestore.dart';

import 'Model.dart';

class RateModel extends Model{

  late double rate;
  late String review;
  late String? email;

  RateModel(this.rate, this.email, this.review);

  @override
  String toString(){
    return "Email: $email,  Rate: $rate\n$review";
  }

  Future<bool> add() async {
    final data = {"rate":rate,"review":review,"email":email};
    try{
      DocumentReference<Map<String,dynamic>> result = await Model.firestore!.collection('rate').add(data);
      return true;
    }catch(error){
      return false;
    }
  }

  static Stream<QuerySnapshot> getRateStream(){
    return Model.firestore!.collection('rate').snapshots();
  }

}