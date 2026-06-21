import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/article_model.dart';

class ApiService {
  Future<List<Article>> getArticles() async {
    final response = await http.get(
      Uri.parse('https://api.spaceflightnewsapi.net/v4/articles/?limit=20'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      final List results = data['results'];

      return results.map((e) => Article.fromJson(e)).toList();
    }

    throw Exception('Gagal mengambil data');
  }
}
