import 'package:cloud_firestore/cloud_firestore.dart';

class RateModel{

  late double rate;
  late String review;
  late String user_id;

  RateModel(this.rate, this.user_id, this.review);

  @override
  String toString(){
    return "User id: $user_id,  Rate: $rate\n$review";
  }

  Future<bool> addRateToFirestore() async {
    final data = {"rate":rate,"review":review,"user_id":user_id};
    try{
      DocumentReference<Map<String,dynamic>> result = await FirebaseFirestore.instance.collection('rate').add(data);
      return true;
    }catch(error){
      return false;
    }
  }

  //Factory constructor
  // Get firebase document snapshot, convert it to Rate object and returns
  factory RateModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot, SnapshotOptions? options,) {
    final data = snapshot.data();
    return RateModel(data?['rate'], data?['user_id'], data?['review']);
  }


}