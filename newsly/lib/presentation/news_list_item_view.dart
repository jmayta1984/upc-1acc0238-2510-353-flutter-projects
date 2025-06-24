import 'package:flutter/material.dart';
import 'package:newsly/domain/news.dart';

class NewsListItemView extends StatelessWidget {
  const NewsListItemView({super.key, required this.news});

  final News news;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: news.title,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: SizedBox(
                height: 200,
                width: double.infinity,
                child: Image.network(
                  height: 200,
                  width: double.infinity,
                  news.image,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Center(child: Icon(Icons.error)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(news.year),
                Text(
                  news.title,
                  maxLines: 1,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(news.author),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
