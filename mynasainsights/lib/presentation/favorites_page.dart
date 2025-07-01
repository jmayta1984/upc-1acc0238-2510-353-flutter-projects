import 'package:flutter/material.dart';
import 'package:mynasainsights/data/favorito_photo_dao.dart';
import 'package:mynasainsights/domain/favorite_photo.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<FavoritePhoto> favoritePhotos = [];

  @override
  void initState() {
    _loadFavoritePhotos();
    super.initState();
  }

  Future<void> _loadFavoritePhotos() async {
    final photos = await FavoritoPhotoDao().getAllFavoritePhotos();
    setState(() {
      favoritePhotos = photos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: favoritePhotos.length,
      itemBuilder: (context, index) {
        final photo = favoritePhotos[index];
        return Card(
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(8),
                child: SizedBox(
                  width: 90,
                  height: 90,
                  child: Image.network(
                    photo.image,

                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        Icon(Icons.error),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        photo.rover,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(photo.camera),
                    ],
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  FavoritoPhotoDao().removeFavoritePhoto(photo.id);
                  _loadFavoritePhotos();
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
