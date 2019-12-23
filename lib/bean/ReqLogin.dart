import 'ReqBody.dart';
import 'dart:convert';

class ReqLogin extends ReqBody {
  /** 用户登录 */
  String mobileNo;

  /** 登录类型 */
  int loginType;

  /** 密码 */
  String password;

  /** 设备类型 */
  int deviceType;

  /** 百度channelId */
  String bchannelId;

  /** 百度userId */
  String buserId;

  ReqLogin();

  ReqLogin.fromJson(Map<String, dynamic> json)
      : mobileNo = json['mobileNo'],
        loginType = json['loginType'],
        password = json['password'],
        deviceType = json['deviceType'],
        bchannelId = json['bchannelId'],
        buserId = json['buserId'];

  Map<String, dynamic> toJson() => {
        'mobileNo': mobileNo,
        'loginType': loginType,
        'password': password,
        'deviceType': deviceType,
        'bchannelId': bchannelId,
        'buserId': buserId
      };


}
