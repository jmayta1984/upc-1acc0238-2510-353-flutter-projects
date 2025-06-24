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
    return ListView.builder(
      itemCount: _favoriteNewsList.length,
      itemBuilder: (context, index) {
        final news = _favoriteNewsList[index];
        return ListTile(
          title: Text(news.title),
          subtitle: Text(news.description),
        );
      },
    );
  }
}