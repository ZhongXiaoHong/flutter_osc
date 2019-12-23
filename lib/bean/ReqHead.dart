import 'package:json_annotation/json_annotation.dart';

import 'dart:convert';

class ReqHead {
  // 交易ID，接口编号
  String tradeId;

  // 时间戳
  String timestamp;

  // 客户端编号
  String clientNo;

  // 版本号
  String versionNo;

  // 用户编号
  String userId;

  // 会话编号
  String tokenId;

  // 校验码
  String validCode;
  ReqHead();

  ReqHead.fromJson(Map<String, dynamic> json)
      : tradeId = json['tradeId'],
        timestamp = json['timestamp'],
        clientNo = json['clientNo'],
        versionNo = json['versionNo'],
        userId = json['userId'],
        tokenId = json['tokenId'],
        validCode = json['validCode'];

  Map<String, dynamic> toJson() =>{
    'tradeId':tradeId,
    'timestamp':timestamp,
    'clientNo':clientNo,
    'versionNo':versionNo,
    'userId':userId,
    'tokenId':tokenId,
    'validCode':validCode
  };
}
