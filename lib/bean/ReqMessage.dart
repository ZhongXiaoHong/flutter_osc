import 'ReqHead.dart';
import 'ReqBody.dart';

class ReqMessage <T extends  ReqBody>{
  ReqHead head;
  T body;

  ReqMessage({this.head, this.body});

  ReqMessage.fromJson(Map<String, dynamic> json)
      : head = json['head'],
        body = json['body'];

  Map<String, dynamic> toJson() =>{
    'head':head,
    'body':body
  };
}
