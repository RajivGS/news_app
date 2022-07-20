import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_app/models/article_model.dart';

class ApiService {
  final endpoint =
      'https://newsapi.org/v2/everything?q=bitcoin&apiKey=9977d96b7bb144edba1b721b14ff086a';

  Future<List<Article>> getArticle() async {
    Response res = await get(Uri.parse(endpoint));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
