import 'package:flutter/material.dart';

import '../models/article_model.dart';

import '../pages/detail_page.dart';

class ArticleCard extends StatelessWidget {
  final Article article;

  const ArticleCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,

            MaterialPageRoute(
              builder: (context) => DetailPage(article: article),
            ),
          );
        },

        child: Column(
          children: [
            Image.network(
              article.imageUrl,

              height: 200,

              width: double.infinity,

              fit: BoxFit.cover,
            ),

            Padding(
              padding: const EdgeInsets.all(15),

              child: Text(article.title),
            ),
          ],
        ),
      ),
    );
  }
}
