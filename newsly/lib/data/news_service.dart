import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:newsly/data/news_dto.dart';
import 'package:newsly/domain/news.dart';

class NewsService {
  Future<List<News>> findNews(String query) async {
    final http.Response response = await http.get(
      Uri.parse(
        'https://dev.formandocodigo.com/articles.php?description=$query',
      ),
    );

    try {
      if (response.statusCode == HttpStatus.ok) {
        final List maps = jsonDecode(response.body);
        return maps.map((json) => NewsDto.fromJson(json).toDomain()).toList();
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      throw Exception('Failed to load news: $e');
    }
  }
}
