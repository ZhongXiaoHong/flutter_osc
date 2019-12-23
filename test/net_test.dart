import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osc/bean/ReqCreateMatter.dart';
import 'package:flutter_osc/bean/ReqLogin.dart';
import 'package:flutter_osc/bean/response/ResLogin.dart';
import 'package:flutter_osc/bean/response/ResMessage.dart';
import 'package:flutter_osc/util/MD5Util.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';
import 'dart:io';


import 'package:flutter_osc/net.dart';
void main() {


//  test("zhong", ()async{
//    ReqLogin reqLogin = ReqLogin();
//    reqLogin.bchannelId = 'android';
//    reqLogin.buserId = '';
//    reqLogin.deviceType = 3;
//    reqLogin.loginType = 0;
//    reqLogin.mobileNo = '13724188569';
//    reqLogin.password = MD5Util.deal('888888');
//    Response<ResMessage<ResLogin>> result= await HttpManager.getInstance().post("loginV2",reqLogin);
//    print(result);
//  });


  test("上传图文", ()async{
    ReqCreateMatter reqCreateMatter = ReqCreateMatter();
    reqCreateMatter.type = 1;
    reqCreateMatter.roomNo = '518000';
    reqCreateMatter.repairType = 1;
    reqCreateMatter.content = '保修保修罢休';
    reqCreateMatter.mobileNo = '13724188569';
    reqCreateMatter.expectDealTime = '2019-12-27 11:59:00';
    List<Map<String,int>>listMap = new  List<Map<String,int>>();

    listMap.add({'picHeigth':960,'picLength':540});
    reqCreateMatter.picProperties = listMap;
    reqCreateMatter.video = 'propMatter/20191224002410093503.mp4';
    reqCreateMatter.videoWidth = 0;
    reqCreateMatter.videoHeight = 0;
    reqCreateMatter.duration = 3;




    Response<ResMessage<ResLogin>> result= await HttpManager.getInstance().multiPart("createMatter",reqCreateMatter);
    print(result);
  });

//  test("上传图文2", ()async{
//   var result= await HttpManager.getInstance().multiPart2();
//  });






}