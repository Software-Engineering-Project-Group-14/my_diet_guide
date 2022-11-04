import 'package:cloud_firestore/cloud_firestore.dart';

class RateModel{

  late double rate;
  late String review;
  late String? email;

  RateModel(this.rate, this.email, this.review);

  @override
  String toString(){
    return "Email: $email,  Rate: $rate\n$review";
  }

  Future<bool> addRateToFirestore() async {
    final data = {"rate":rate,"review":review,"email":email};
    try{
      DocumentReference<Map<String,dynamic>> result = await FirebaseFirestore.instance.collection('rate').add(data);
      return true;
    }catch(error){
      return false;
    }
  }

  static Stream<QuerySnapshot> getRateStream(){
    return FirebaseFirestore.instance.collection('rate').snapshots();
  }

  static int testSample(){
    return 8;
  }

}