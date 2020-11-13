
import 'package:swdprojectbackup/models/news.dart';

class NewsViewModel {
  News _newsArticle;

  NewsViewModel({News article}) : _newsArticle = article;

  int get id {
    return _newsArticle.id;
  }

  String get compCode {
    return _newsArticle.compCode;
  }

  String get name {
    return _newsArticle.name;
  }

  String get position {
    return _newsArticle.position;
  }

  int get quantity {
    return _newsArticle.quantity;
  }

}