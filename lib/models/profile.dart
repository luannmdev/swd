import 'package:flutter/cupertino.dart';


class Profile {
  final String code;
  final String email;
  final String fullname;
  final String phoneNo;
  final String cv;
  final double gpa;
  final String majorCode;
  final String uniCode;
  final String majorName;

  Profile({
    @required this.code,
    @required this.email,
    @required this.fullname,
    @required this.phoneNo,
    @required this.cv,
    @required this.gpa,
    @required this.majorCode,
    @required this.uniCode,
    @required this.majorName,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      code: json['code'],
      email: json['email'],
      fullname: json['fullname'],
      phoneNo: json['phoneNo'],
      cv: json['cv'],
      gpa: json['gpa'],
      majorCode: json['majorCode'],
      uniCode: json['uniCode'],
      majorName: json['name'],
    );
  }
}
