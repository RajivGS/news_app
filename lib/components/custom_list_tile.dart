import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';

Widget customListTile(Article article) {
  return InkWell(
    onTap: () {},
    child: Container(
      //   height: 400,
      margin: const EdgeInsets.all(12.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage("assets/background.png"), fit: BoxFit.fill),
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 3.0,
            )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
            padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
            height: 140.0,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(article.urlToImage), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          const SizedBox(height: 8.0),
          Container(
            margin: const EdgeInsets.only(left: 30),
            padding: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(2),
            ),
            child: Text(
              article.source.name!,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 8.0),
          Container(
            margin: const EdgeInsets.fromLTRB(30, 1, 30, 25),
            padding: const EdgeInsets.fromLTRB(15, 1, 15, 10),
            child: Text(
              article.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          )
        ],
      ),
    ),
  );
}
