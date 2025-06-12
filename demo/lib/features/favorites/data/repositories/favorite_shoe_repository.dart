import 'package:demo/features/favorites/data/datasources/favorite_shoe_dao.dart';
import 'package:demo/features/favorites/data/models/favorite_shoe_dto.dart';
import 'package:demo/features/favorites/domain/entities/favorite_shoe.dart';

class FavoriteShoeRepository {
  final dao = FavoriteShoeDao();

  Future<void> insertFavorite(FavoriteShoe shoe) async {
    await dao.insertFavorite(FavoriteShoeDto.fromDomain(shoe));
  }

  Future<void> deleteFavorite(int id) async {
    await dao.deleteFavorite(id);
  }

  Future<List<FavoriteShoe>> fetchFavorites() async {
    final dtos = await dao.fetchFavorites();
    return dtos.map((e)=> e.toDomain()).toList();
  }

}
