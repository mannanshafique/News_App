import 'dart:convert';

import 'package:news_app/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> newsArticles = [];

  Future<void> getNews(String country) async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=$country&apiKey=82db3e64627e423eac40b56a1c77999a";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            author: element['author'],
            content: element['content'],
            description: element['description'],
            publishedAt: element['publishedAt'],
            title: element['title'],
            url: element['url'],
            urlToImage: element['urlToImage'],
          );
          newsArticles.add(articleModel);
        }
      });
    }
  }
}
