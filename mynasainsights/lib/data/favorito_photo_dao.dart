import 'package:mynasainsights/data/app_database.dart';
import 'package:mynasainsights/data/favorite_photo_dto.dart';
import 'package:mynasainsights/domain/favorite_photo.dart';
import 'package:mynasainsights/domain/photo.dart';

class FavoritoPhotoDao {

  Future<void> addFavoritePhoto(Photo photo) async {
    final db = await AppDatabase().database;
    await db.insert(
      AppDatabase.tableName,
      FavoritePhotoDto.fromDomain(photo).toDatabase(),
    );
  }

  Future<void> removeFavoritePhoto(int id) async {
    final db = await AppDatabase().database;
    await db.delete(
      AppDatabase.tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<FavoritePhoto>> getAllFavoritePhotos() async {
    final db = await AppDatabase().database;
    final List maps = await db.query(AppDatabase.tableName);
    
    return maps.map((map) => FavoritePhotoDto.fromDatabase(map).toDomain()).toList();
  }
  
  Future<bool> checkFavorite(int id) async {
    final db = await AppDatabase().database;
    final List maps = await db.query(
      AppDatabase.tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    return maps.isNotEmpty;
  }
}