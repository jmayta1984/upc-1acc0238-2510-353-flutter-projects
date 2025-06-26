import 'package:flutter/material.dart';
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
        return PhotoListItemView(photo: photo);
      },
    );
  }
}

class PhotoListItemView extends StatelessWidget {
  const PhotoListItemView({super.key, required this.photo});

  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: 200,
                child: Image.network(
                  fit: BoxFit.cover,
                  photo.image,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.error),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
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
                  photo.rover,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Camera: ${photo.camera}',
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
