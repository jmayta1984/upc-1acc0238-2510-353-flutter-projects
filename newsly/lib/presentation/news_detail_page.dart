/*
Collapsing toolbar in FindNewsPage
*/

import 'package:flutter/material.dart';
import 'package:newsly/data/favorite_news_dao.dart';
import 'package:newsly/domain/favorite_news.dart';
import 'package:newsly/domain/news.dart';

class NewsDetailPage extends StatefulWidget {
  const NewsDetailPage({super.key, required this.news});
  final News news;

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _checkIfFavorite();
  }

  void _checkIfFavorite() async {
    final isFavorite = await FavoriteNewsDao().isFavorite(widget.news.title);
    setState(() {
      _isFavorite = isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    final news = widget.news;
    final height = MediaQuery.of(context).size.height * 0.4;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: 300,
        child: OutlinedButton(
   
          onPressed: () {
            setState(() {
              _isFavorite = !_isFavorite;
            });
            if (_isFavorite) {
              FavoriteNewsDao().addFavoriteNews(
                FavoriteNews(
                  title: news.title,
                  description: news.description,
                  image: news.image,
                  author: news.author,
                ),
              );
            } else {
              FavoriteNewsDao().removeFavoriteNews(news.title);
            }
          },
          child: ListTile(
            title: Text(_isFavorite ? "Remove from favorites" : "Add to favorites"),
            trailing: Icon(_isFavorite ? Icons.delete_outline : Icons.favorite_border),
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
                  tag: widget.news.title,
                  child: SizedBox(
                    height: height,
                    width: double.infinity,
                    child: Image.network(
                      widget.news.image,
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
                widget.news.source,
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),

              Text(
                widget.news.title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.news.author,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(widget.news.content, style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
