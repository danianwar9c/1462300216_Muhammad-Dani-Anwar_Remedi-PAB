import 'package:flutter/material.dart';

import '../models/article_model.dart';

class DetailPage extends StatelessWidget {
  final Article article;

  const DetailPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail News')),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(article.imageUrl),

            Padding(
              padding: const EdgeInsets.all(20),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    article.title,

                    style: const TextStyle(
                      fontSize: 24,

                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(article.newsSite),

                  const SizedBox(height: 20),

                  Text(article.summary),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
