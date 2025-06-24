import 'package:newsly/data/app_database.dart';
import 'package:newsly/data/favorite_news_dto.dart';
import 'package:newsly/domain/favorite_news.dart';
import 'package:sqflite/sqflite.dart';

class FavoriteNewsDao {
  Future<void> addFavoriteNews(FavoriteNews favoriteNews) async {
    Database db = await AppDatabase().database;
    await db.insert(
      'news',
      FavoriteNewsDto.fromDomain(favoriteNews).toDatabase(),
    );
  }

  Future<List<FavoriteNews>> getAllFavoriteNews() async {
    Database db = await AppDatabase().database;
    final List<Map<String, dynamic>> maps = await db.query('news');
    return maps.map((map) => FavoriteNewsDto.fromDatabase(map).toDomain()).toList();
  }
}
