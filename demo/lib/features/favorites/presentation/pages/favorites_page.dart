import 'package:demo/features/favorites/domain/entities/favorite_shoe.dart';
import 'package:demo/features/favorites/presentation/widgets/favorite_shoe_list_view.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<FavoriteShoe> favoriteShoes = [
      FavoriteShoe(
        id: 1,
        name: 'Nike Air Max',
        image: 'https://images.footlocker.com/is/image/FLEU/314312124510_01?wid=500&hei=500&fmt=png',
        price: 120,
      ),
      FavoriteShoe(
        id: 2,
        name: 'Adidas Ultraboost',
        image: 'https://images.footlocker.com/is/image/FLEU/314312124510_01?wid=500&hei=500&fmt=png',
        price: 180,
      ),
      FavoriteShoe(
        id: 3,
        name: 'Puma RS-X',
        image: 'https://images.footlocker.com/is/image/FLEU/314312124510_01?wid=500&hei=500&fmt=png',
        price: 110,
      ),
      FavoriteShoe(
        id: 4,
        name: 'Reebok Classic',
        image: 'https://images.footlocker.com/is/image/FLEU/314312124510_01?wid=500&hei=500&fmt=png',
        price: 90,
      ),
      FavoriteShoe(
        id: 5,
        name: 'New Balance 574',
        image: 'https://images.footlocker.com/is/image/FLEU/314312124510_01?wid=500&hei=500&fmt=png',
        price: 100,
      ),
      FavoriteShoe(
        id: 6,
        name: 'Asics Gel-Lyte III',
        image: 'https://images.footlocker.com/is/image/FLEU/314312124510_01?wid=500&hei=500&fmt=png',
        price: 130,
      ),
      FavoriteShoe(
        id: 7,
        name: 'Vans Old Skool',
        image: 'https://images.footlocker.com/is/image/FLEU/314312124510_01?wid=500&hei=500&fmt=png',
        price: 70,
      ),
    ];
    return FavoriteShoeListView(favoriteShoes: favoriteShoes);
  }
}