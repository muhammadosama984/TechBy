import 'package:techby/database/ads.dart';

class savedAds {
  String email;
  ads Ad;

  savedAds({required this.email, required this.Ad});

  static savedAds fromJson(Map<String, dynamic> json) =>
      savedAds(Ad: json['ads'], email: json['email']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['ads'] = Ad;
    data['email'] = email;

    return data;

  }
}
