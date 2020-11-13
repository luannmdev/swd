import 'package:flutter/cupertino.dart';

class CompanyChoose {
  final String comName;
  final String comMain;

  CompanyChoose({
    @required this.comName,
    @required this.comMain,
  });

  static List<CompanyChoose> getCompanies() {
    return <CompanyChoose>[
      CompanyChoose(comName: 'FPT', comMain: 'C#'),
      CompanyChoose(comName: 'FPT', comMain: 'JAVA'),
      CompanyChoose(comName: 'FPT3', comMain: 'JAVA'),
      CompanyChoose(comName: 'FPT4', comMain: 'C#'),
      CompanyChoose(comName: 'FPT5', comMain: 'JAVA'),
    ];
  }

  factory CompanyChoose.fromJson(Map<String,dynamic> json) {
    return CompanyChoose(
      comName: json['comName'],
      comMain: json['comMain'],
    );
  }

}
