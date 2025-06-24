/*
Collapsing toolbar in FindNewsPage
*/

import 'package:flutter/material.dart';
import 'package:newsly/data/favorite_news_dao.dart';
import 'package:newsly/domain/favorite_news.dart';
import 'package:newsly/domain/news.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({super.key, required this.news});
  final News news;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.4;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: 300,
        child: OutlinedButton(
          onPressed: () {
            FavoriteNewsDao().addFavoriteNews(
              FavoriteNews(
                title: news.title,
                description: news.description,
                image: news.image,
                author: news.author,
              ),
            );
          },
          child: ListTile(
            title: Text("Add to favorites"),
            trailing: Icon(Icons.favorite_border),
          ),
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: height,
              pinned: true,
              floating: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: news.title,
                  child: SizedBox(
                    height: height,
                    width: double.infinity,
                    child: Image.network(
                      news.image,
                      height: height,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Center(child: Icon(Icons.error)),
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                news.source,
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),

              Text(
                news.title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                news.author,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(news.content, style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
