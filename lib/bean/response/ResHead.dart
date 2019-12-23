class ResHead {
  // 交易ID，接口编号
  String tradeId;

  // 时间戳
  String timestamp;

  // 返回码
  int respCode;

  // 返回消息
  String respMsg;


  ResHead.fromJson(Map<String, dynamic> json)
      : tradeId = json['tradeId'],
        timestamp = json['timestamp'],
        respCode = json['respCode'],
        respMsg = json['respMsg'];

  Map<String, dynamic> toJson() =>{
    'tradeId':tradeId,
    'timestamp':timestamp,
    'respCode':respCode,
    'respMsg':respMsg,
  };
}
