import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:convert/convert.dart';

class MD5Util {

  static String deal(String data) {
    var content = new Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    // 这里其实就是 digest.toString()
    return hex.encode(digest.bytes).toUpperCase();
  }

}