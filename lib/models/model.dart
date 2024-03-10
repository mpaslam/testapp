class LoginModel {
  // Token token;
  // UserData userData;
  // String msg;

  // LoginModel({
  //     required this.token,
  //     required this.userData,
  //     required this.msg,
  // });

  String? token;
  LoginModel({this.token});

  LoginModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    return data;
  }
}

// class Token {
//     String refresh;
//     String access;

//     Token({
//         required this.refresh,
//         required this.access,
//     });

// }

// class UserData {
//     int id;
//     String username;
//     String email;
//     bool waiter;

//     UserData({
//         required this.id,
//         required this.username,
//         required this.email,
//         required this.waiter,
//     });

// }
