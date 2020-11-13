import 'package:flutter/material.dart';
import 'package:swdprojectbackup/models/news.dart';
import 'package:swdprojectbackup/services/web_service.dart';
import 'package:swdprojectbackup/ui/news/newsViewModel.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class NewsListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.searching;
  List<NewsViewModel> articlesList = List<NewsViewModel>();

  void topHeadlines() async {
    print('topHeadlines');
    List<News> newsArticles = await WebService().fetchTopHeadlines();
    print('newsArticles.length');
    notifyListeners();

    this.articlesList =
        newsArticles
        .map((article) => NewsViewModel(article: article))
        .toList();

    if (this.articlesList.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }

    notifyListeners();
  }
}
