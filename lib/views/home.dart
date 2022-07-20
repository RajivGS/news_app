import 'package:flutter/material.dart';
import 'package:news_app/components/custom_list_tile.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/api_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService client = ApiService();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
        ),
      ),
    );
  }
}
