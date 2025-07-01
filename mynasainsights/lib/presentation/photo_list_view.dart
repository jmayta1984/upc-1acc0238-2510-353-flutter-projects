import 'package:flutter/material.dart';
import 'package:mynasainsights/data/favorito_photo_dao.dart';
import 'package:mynasainsights/domain/photo.dart';

class PhotoListView extends StatelessWidget {
  const PhotoListView({super.key, required this.photos});
  final List photos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: photos.length,
      itemBuilder: (context, index) {
        final Photo photo = photos[index];
        return PhotoListItemView(key: ValueKey(photo.id), photo: photo);
      },
    );
  }
}

class PhotoListItemView extends StatefulWidget {
  const PhotoListItemView({super.key, required this.photo});

  final Photo photo;

  @override
  State<PhotoListItemView> createState() => _PhotoListItemViewState();
}

class _PhotoListItemViewState extends State<PhotoListItemView> {
  bool _isFavorite = false;

@override
  void initState() {
    super.initState();
    _checkIfFavorite();
  }

  Future<void> _checkIfFavorite() async {
    final isFavorite = await FavoritoPhotoDao().checkFavorite(widget.photo.id);
    setState(() {
      _isFavorite = isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
      Photo photo = widget.photo;
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Image.network(
                    fit: BoxFit.cover,
                    widget.photo.image,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    onPressed: () {
                      if (_isFavorite) {
                        FavoritoPhotoDao().removeFavoritePhoto(photo.id);
                      } else {
                        FavoritoPhotoDao().addFavoritePhoto(photo);
                      }
                      setState(() {
                        _isFavorite = !_isFavorite;
                      });
                    },
                    icon: Icon(
                      _isFavorite ? Icons.favorite : Icons.favorite_border,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            
              children: [
                Text(
                  widget.photo.rover,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Camera: ${widget.photo.camera}',
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
