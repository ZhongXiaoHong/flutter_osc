import 'ResBody.dart';
import 'ResHead.dart';

class ResMessage<T extends ResBody >{
  ResHead head;
  T body;

  ResMessage({this.head, this.body});

  ResMessage.fromJson(Map<String, dynamic> json)
      : head = json['head'],
        body = json['body'];

  Map<String, dynamic> toJson() =>{
    'head':head,
    'body':body
  };
}