import 'package:demo/features/favorites/data/datasources/database_provider.dart';
import 'package:demo/features/favorites/data/models/favorite_shoe_dto.dart';

class FavoriteShoeDao {
  Future<void> insertFavorite(FavoriteShoeDto favorite) async {
    final db = await DatabaseProvider().openDb();
    await db.insert('favorites', favorite.toMap());
  }

  Future<void> deleteFavorite(int id) async {
    final db = await DatabaseProvider().openDb();
    await db.delete('favorites', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<FavoriteShoeDto>> fetchFavorites() async {
    final db = await DatabaseProvider().openDb();
    final maps = await db.query('favorites');
    return maps.map((e)=> FavoriteShoeDto.fromMap(e)).toList();
  }
}
