import 'ResBody.dart';

class ResLogin extends ResBody {
  /** 用户编号 */
  String userId;

  //用户腾讯云通讯登录云服务器用
  String userSig;

  /** 资料是否完整 */
  int isProfileSet; //0 资料不完整；1资料完整

  /** tokenId */
  String tokenId;

  //用户状态	int	Y	1:正常 2:冻结
  String status;

  /** 社区编号 */
  String communityNo;

  /** 房屋编号 */
  String roomNo;

  /** 房屋登记号 */
  String houseNo;

  /** 是否已认证*/
  int isAuth; //0:未认证， 1：已认证

  ResLogin.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        userSig = json['userSig'],
        isProfileSet = json['isProfileSet'],
        tokenId = json['tokenId'],
        status = json['status'],
        communityNo = json['communityNo'],
        roomNo = json['roomNo'],
        houseNo = json['houseNo'],
        isAuth = json['isAuth'];

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'userSig': userSig,
        'isProfileSet': isProfileSet,
        'tokenId': tokenId,
        'status': status,
        'communityNo': communityNo,
        'roomNo': roomNo,
        'houseNo': houseNo,
        'isAuth': isAuth,
      };
}
