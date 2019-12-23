class UserManager {

  String _userId = "969001";

  String _tokenId = "npL5anyVwtGVjRBUBpLRRw==";

  //全局单例的网络访问
  static final UserManager _instance = UserManager._internal();
  UserManager._internal() {

  }
  static UserManager getInstance() => _instance;

  getUserId() {
    return _userId;
  }

  setUserId(String_userId) {
    this._userId = _userId;
  }

  getTokenId() {
    return _tokenId;
  }

  setTokenId(String _tokenId) {
    this._tokenId = _tokenId;
  }
}
