import 'package:flutter/material.dart';
import 'package:newsly/domain/news.dart';
import 'package:newsly/presentation/news_detail_page.dart';
import 'package:newsly/presentation/news_list_item_view.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({super.key, required this.newsList});

  final List<News> newsList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: newsList.length,
      itemBuilder: (context, index) {
        final news = newsList[index];

        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => NewsDetailPage(news: news),
            ));
          },
          child: NewsListItemView(news: news),
        );
      },
    );
  }
}

