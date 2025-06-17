import 'package:demo/features/favorites/data/datasources/favorite_shoe_dao.dart';
import 'package:demo/features/home/data/datasources/shoe_service.dart';
import 'package:demo/features/home/domain/entities/shoe.dart';

class ShoeRepository {
  const ShoeRepository({required this.shoeService, required this.favoriteShoeDao});
  final ShoeService shoeService;
  final FavoriteShoeDao favoriteShoeDao;

  Future<List<Shoe>> getShoes() async {
    final shoeDtos = await shoeService.getShoes();
    final favoriteDtos = await favoriteShoeDao.fetchFavorites();
    
    final favoriteIds = favoriteDtos.map((e) => e.id).toList();

    return shoeDtos.map((dto)=> dto.toDomain(isFavorite: favoriteIds.contains(dto.id))).toList();
  }
}
