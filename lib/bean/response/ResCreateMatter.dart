import 'ResBody.dart';

class ResCreateMatter extends ResBody {

  String  matterId;

  ResCreateMatter.fromJson(Map<String, dynamic> json)
      : matterId = json['matterId'];

  Map<String, dynamic> toJson() => {
    'matterId': matterId
  };
}