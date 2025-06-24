import 'package:flutter/material.dart';
import 'package:newsly/data/favorite_news_dao.dart';
import 'package:newsly/domain/favorite_news.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<FavoriteNews> _favoriteNewsList = [];

  Future<void> _loadFavoriteNews() async {
    try {
      final favoriteNewsDao = FavoriteNewsDao();
      final favoriteNews = await favoriteNewsDao.getAllFavoriteNews();
      setState(() {
        _favoriteNewsList = favoriteNews;
      });
    } catch (e) {
      // Handle error (e.g., show a snackbar)
    }
  }

  @override
  void initState() {
    _loadFavoriteNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_favoriteNewsList.isEmpty) {
      return const Center(child: Text('No favorite news found.'));
    }
    return ListView.builder(
      itemCount: _favoriteNewsList.length,
      itemBuilder: (context, index) {
        final news = _favoriteNewsList[index];
        return Card(
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: SizedBox(
                  width: 90.0,
                  height: 90.0,
                  child: Image.network(
                    news.image,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Center(child: const Icon(Icons.error));
                    },
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        news.title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        news.description,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Author: ${news.author}'),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  final favoriteNewsDao = FavoriteNewsDao();
                  favoriteNewsDao.removeFavoriteNews(news.title);
                  setState(() {
                    _favoriteNewsList.removeAt(index);
                  });
                },
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
        );
      },
    );
  }
}
