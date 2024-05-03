
// import 'dart:convert';

// LoginModel loginModelFromJson(String str) =>
//     LoginModel.fromJson(json.decode(str));

// String loginModelToJson(LoginModel data) => json.encode(data.toJson());

// class LoginModel {
//   final Token token;
//   final UserData userData;
//   final String msg;

//   LoginModel({
//     required this.token,
//     required this.userData,
//     required this.msg,
//   });

//   factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
//         token: Token.fromJson(json["token"]),
//         userData: UserData.fromJson(json["user_data"]),
//         msg: json["msg"],
//       );

//   Map<String, dynamic> toJson() => {
//         "token": token.toJson(),
//         "user_data": userData.toJson(),
//         "msg": msg,
//       };
// }

// class Token {
//   final String refresh;
//   final String access;

//   Token({
//     required this.refresh,
//     required this.access,
//   });

//   factory Token.fromJson(Map<String, dynamic> json) => Token(
//         refresh: json["refresh"],
//         access: json["access"],
//       );

//   Map<String, dynamic> toJson() => {
//         "refresh": refresh,
//         "access": access,
//       };
// }

// class UserData {
//   final int id;
//   final String username;
//   final String email;
//   final bool waiter;

//   UserData({
//     required this.id,
//     required this.username,
//     required this.email,
//     required this.waiter,
//   });

//   factory UserData.fromJson(Map<String, dynamic> json) => UserData(
//         id: json["id"],
//         username: json["username"],
//         email: json["email"],
//         waiter: json["waiter"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "username": username,
//         "email": email,
//         "waiter": waiter,
//       };
// }

import 'package:meta/meta.dart';
import 'dart:convert';

class LoginModel {
    Token token;
    UserData userData;
    String msg;

    LoginModel({
        required this.token,
        required this.userData,
        required this.msg,
    });

    factory LoginModel.fromRawJson(String str) => LoginModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        token: Token.fromJson(json["token"]),
        userData: UserData.fromJson(json["user_data"]),
        msg: json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "token": token.toJson(),
        "user_data": userData.toJson(),
        "msg": msg,
    };
}

class Token {
    String refresh;
    String access;

    Token({
        required this.refresh,
        required this.access,
    });

    factory Token.fromRawJson(String str) => Token.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Token.fromJson(Map<String, dynamic> json) => Token(
        refresh: json["refresh"],
        access: json["access"],
    );

    Map<String, dynamic> toJson() => {
        "refresh": refresh,
        "access": access,
    };
}

class UserData {
    int id;
    DateTime lastLogin;
    String name;
    String email;
    DateTime dateJoined;
    bool isActive;
    bool isStaff;
    bool isAdmin;
    bool isSuperuser;
    bool billingStaff;
    bool waiter;
    bool unit;
    bool tax;
    bool category;
    bool product;
    bool purchase;
    bool productions;
    bool stock;
    bool couponse;
    bool customer;
    bool kitchen;
    bool sales;
    bool attribute;
    bool table;
    bool expense;

    UserData({
        required this.id,
        required this.lastLogin,
        required this.name,
        required this.email,
        required this.dateJoined,
        required this.isActive,
        required this.isStaff,
        required this.isAdmin,
        required this.isSuperuser,
        required this.billingStaff,
        required this.waiter,
        required this.unit,
        required this.tax,
        required this.category,
        required this.product,
        required this.purchase,
        required this.productions,
        required this.stock,
        required this.couponse,
        required this.customer,
        required this.kitchen,
        required this.sales,
        required this.attribute,
        required this.table,
        required this.expense,
    });

    factory UserData.fromRawJson(String str) => UserData.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        lastLogin: DateTime.parse(json["last_login"]),
        name: json["name"],
        email: json["email"],
        dateJoined: DateTime.parse(json["date_joined"]),
        isActive: json["is_active"],
        isStaff: json["is_staff"],
        isAdmin: json["is_admin"],
        isSuperuser: json["is_superuser"],
        billingStaff: json["billing_staff"],
        waiter: json["waiter"],
        unit: json["unit"],
        tax: json["tax"],
        category: json["category"],
        product: json["product"],
        purchase: json["purchase"],
        productions: json["productions"],
        stock: json["stock"],
        couponse: json["couponse"],
        customer: json["customer"],
        kitchen: json["kitchen"],
        sales: json["sales"],
        attribute: json["attribute"],
        table: json["table"],
        expense: json["expense"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "last_login": lastLogin.toIso8601String(),
        "name": name,
        "email": email,
        "date_joined": dateJoined.toIso8601String(),
        "is_active": isActive,
        "is_staff": isStaff,
        "is_admin": isAdmin,
        "is_superuser": isSuperuser,
        "billing_staff": billingStaff,
        "waiter": waiter,
        "unit": unit,
        "tax": tax,
        "category": category,
        "product": product,
        "purchase": purchase,
        "productions": productions,
        "stock": stock,
        "couponse": couponse,
        "customer": customer,
        "kitchen": kitchen,
        "sales": sales,
        "attribute": attribute,
        "table": table,
        "expense": expense,
    };
}

