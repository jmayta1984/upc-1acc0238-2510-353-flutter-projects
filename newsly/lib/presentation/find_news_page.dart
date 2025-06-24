import 'package:flutter/material.dart';
import 'package:newsly/data/news_service.dart';
import 'package:newsly/domain/news.dart';
import 'package:newsly/presentation/news_list_view.dart';

class FindNewsPage extends StatefulWidget {
  const FindNewsPage({super.key});

  @override
  State<FindNewsPage> createState() => _FindNewsPageState();
}

class _FindNewsPageState extends State<FindNewsPage> {
  List<News> _newsList = [];

  void _findNews(String query) async {
    try {
      final newsService = NewsService();
      final news = await newsService.findNews(query);
      setState(() {
        _newsList = news;
      });
    } catch (e) {
      // Handle error (e.g., show a snackbar)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search news',
              border: OutlineInputBorder(),
            ),
            onSubmitted: _findNews,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: NewsListView(newsList: _newsList),
          ),
        ),
      ],
    );
  }
}
