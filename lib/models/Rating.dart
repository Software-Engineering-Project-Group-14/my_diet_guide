
import 'Model.dart';

class Rating extends Model {
  final String email;
  final String rate;
  final String review;

  Rating({
    required this.email,
    required this.rate,
    required this.review
});

  Map<String, dynamic> toJson()=> {
    'email' : email,
    'rate' : rate,
    'review' : review
  };
  static Rating fromJson(Map<String, dynamic> json) => Rating(
      email: json['email'],
      rate: json['rate'],
      review: json['review']
  );
}