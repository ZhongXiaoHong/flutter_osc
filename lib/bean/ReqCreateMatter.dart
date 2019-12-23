import 'ReqBody.dart';

class ReqCreateMatter extends ReqBody {
  int type; //是	, 1报修 2投诉 3建议
  String roomNo; //是	, 当前默认房屋编号
  int repairType; //否, 若是报修任务，此字段为必传:1室内报修 2公共区域报修
  String content; //否	, 具体内容
  String expectDealTime; //否	, 期望处理时间。报修时传入。格式如2018-01-01 00:00:00
  String mobileNo; //是, 默认为当前用户手机号码

  List<Map<String, int>> picProperties; //是, 图片属性，对应图片顺序传入图片属性

  String video; //	String		否	视频名称（发送视频文件名称）根据uploadOssFile 接口上传返回获取
  int videoWidth; //	Number		否	视频宽度
  int videoHeight; //	Number		否	视频高度
  int duration; //	Number		否	视频时长（秒）

  ReqCreateMatter();

  ReqCreateMatter.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        roomNo = json['roomNo'],
        repairType = json['repairType'],
        content = json['content'],
        expectDealTime = json['expectDealTime'],
        mobileNo = json['mobileNo'],
        picProperties = json['picProperties'],
        video = json['video'],
        videoWidth = json['videoWidth'],
        videoHeight = json['videoHeight'],
        duration = json['duration'];

  Map<String, dynamic> toJson() => {
        'type': type,
        'roomNo': roomNo,
        'repairType': repairType,
        'content': content,
        'expectDealTime': expectDealTime,
        'mobileNo': mobileNo,
        'picProperties': picProperties,
        'video': video,
        'videoWidth': videoWidth,
        'videoHeight': videoHeight,
        'duration': duration,
      };
}
