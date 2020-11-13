import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:swdprojectbackup/models/account.dart';
import 'package:swdprojectbackup/models/news.dart';
import 'package:swdprojectbackup/models/profile.dart';
import 'package:swdprojectbackup/utils/constants.dart';

class WebService {
  var dio = new Dio();

  Future<List<News>> fetchTopHeadlines() async {
    String url = Constants.TOP_HEADLINES_URL;
    var response = await dio.get(url);
    if (response.statusCode == 200) {
      Iterable result = response.data;
      Iterable list = result;
      print(list.toString());
      List<News> temp = list.map((article) => News.fromJson(article)).toList();
      print(temp[0].quantity.toString());
      return list.map((article) => News.fromJson(article)).toList();
    } else {
      throw Exception("Failled to get news");
    }
  }

  Future<News> getNewsDetailById(int idNews) async {
    String url = Constants.GET_NEWS_DETAIL_BY_ID + idNews.toString();
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> result = response.data;
      News news = News.fromJson(result);
      return news;
    } else {
      throw Exception("Failled to get news");
    }
  }

  Future<Profile> getProfile(Account account) async {
    print('service profile running');
    Profile pro = new Profile(code: 'null', email: 'null', fullname: 'null', phoneNo: 'null', cv: 'null', gpa: 10.0, majorCode: 'null', uniCode: 'null', majorName: 'null');
    return pro;

  }



}