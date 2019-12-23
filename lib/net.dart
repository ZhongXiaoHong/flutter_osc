import 'dart:convert';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'util/MD5Util.dart';
import 'bean/ReqHead.dart';
import 'bean/ReqMessage.dart';
import 'config/UserManager.dart';
import 'bean/ReqBody.dart';
import 'package:http_parser/http_parser.dart';


class HttpManager {
  //全局单例的网络访问
  static final HttpManager _instance = HttpManager._internal();

  //代理服务器Ip
  String proxyIp = '192.168.28.176';

  static HttpManager getInstance() => _instance;

  Dio _dio;

  HttpManager._internal() {
    _initDio();
  }

  _initDio() {
    _dio = Dio(BaseOptions(
      baseUrl: "",
      connectTimeout: 5000,
      receiveTimeout: 100000,
      // 5s
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
    ));
    //设置代理
    _setProxy();
  }

  void _setProxy() {
    if (proxyIp != null && proxyIp.isNotEmpty) {
      if (_dio == null) {
        return;
      }
      (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        client.findProxy = (url) {
          return "PROXY 192.168.28.176:8888";
        };
        //抓Https包设置
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      };
    }
  }

  ReqMessage _provideReqMessage(String _tradeId, ReqBody reqbody) {
    int versionNo = _getAppVersionNo();
    String tradeId = _tradeId;
    String userId = UserManager.getInstance().getUserId();
    String tokenId = UserManager.getInstance().getTokenId();

    var now = new DateTime.now();
    var formatter = new DateFormat('yyyyMMddHHmmss');
    String timestamp = formatter.format(now);
    String validCode = MD5Util.deal(tradeId +
        timestamp +
        versionNo.toString() +
        userId +
        "");
    ReqHead head = ReqHead();
    head.tradeId = tradeId;
    head.timestamp = timestamp;
    head.clientNo = '2';
    head.versionNo = versionNo.toString();
    head.userId = userId;
    head.tokenId = tokenId;
    head.validCode = validCode;
    ReqMessage reqMessage = ReqMessage();
    reqMessage.head = head;
    reqMessage.body = reqbody;

    return reqMessage;
  }

  post(String _tradeId, ReqBody data) async {
    Response response;

    response = await _dio.post(
      "http://app-api.gdktxtech.com:8080/ktx-inter/inter/api",
      data: _provideReqMessage(_tradeId, data),
    );
    print(response.data);
  }

  multiPart(String _tradeId, ReqBody data) async {
    Response response;

    FormData formData = FormData.fromMap({
      "content": jsonEncode(_provideReqMessage(_tradeId, data)),
      "files": await MultipartFile.fromFile(r"F:\\test1.jpg",
          filename: "test1.jpg",
          contentType: MediaType('image', 'jpeg'))
    });

    response = await _dio.post(
      "http://app-api.gdktxtech.com:8080/ktx-inter/inter/api",
      data: formData,
    );
    print(response.data);
  }

  int _getAppVersionNo() {
    return 73;
  }


  multiPart2() async {
    Response response;

    Dio _dio2 = Dio(BaseOptions(
      baseUrl: "",
      connectTimeout: 5000,
      receiveTimeout: 100000,
      // 5s
      responseType: ResponseType.json,
    ));
    FormData formData = FormData.fromMap({
      "content": "TMD  橡树园A2 栋门禁开不了门！！！",
      "file": await MultipartFile.fromFile(r"F:\\test1.jpg",
          filename: "test1.jpg",
          contentType: MediaType('image', 'jpeg'))
    });

    response = await _dio2.post(
      "http://192.168.28.176:8080/retrofitServer2/UploadFileAndTextServlet",
      data: formData,
    );
    print(response.data);
  }
}
