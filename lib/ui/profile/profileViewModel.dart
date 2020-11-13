import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swdprojectbackup/models/account.dart';
import 'package:swdprojectbackup/models/profile.dart';
import 'package:swdprojectbackup/services/web_service.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class ProfileViewModel with ChangeNotifier {
  bool loadingStatus = true;
  Profile profile = new Profile();
  Account account = new Account();

  void getProfile() async {
    print('Profile is Running');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    account.setEmail(await prefs.getString('email'));
    account.setRole(await prefs.getString('role'));
    // print(account.getEmail());
    // print(account.getRole());

    Profile pro = await WebService().getProfile(account);
    print(pro.fullname);
    notifyListeners();
    this.profile = Profile(
      code: pro.code,
      email: pro.email,
      fullname: pro.fullname,
      phoneNo: pro.phoneNo,
      cv: pro.cv,
      gpa: pro.gpa,
      majorCode: pro.majorCode,
      uniCode: pro.uniCode,
      majorName: pro.majorName,
    );
    if (this.profile == null) {
      this.loadingStatus = true;
    } else {
      this.loadingStatus = false;
    }
    notifyListeners();
  }


}
