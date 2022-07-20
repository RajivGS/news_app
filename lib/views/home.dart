import 'package:flutter/material.dart';
import 'package:news_app/components/custom_list_tile.dart';
import 'package:news_app/helper/api_services.dart';
import 'package:news_app/models/article_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService client = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("News App"),
      // ),
      body: FutureBuilder(
        future: client.getArticle(),
        builder: ((context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article> articles = snapshot.requireData;
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return customListTile(articles[index]);
              },
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        }),
      ),
    );
  }
}
