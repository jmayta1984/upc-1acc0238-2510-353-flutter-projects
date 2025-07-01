import 'package:mynasainsights/domain/favorite_photo.dart';
import 'package:mynasainsights/domain/photo.dart';

class FavoritePhotoDto {
  final int id;
  final String image;
  final String camera;
  final String rover;

  const FavoritePhotoDto({
    required this.id,
    required this.image,
    required this.camera,
    required this.rover,
  });

  factory FavoritePhotoDto.fromDomain(Photo photo) {
    return FavoritePhotoDto(
      id: photo.id,
      image: photo.image,
      camera: photo.camera,
      rover: photo.rover,
    );
  }

  FavoritePhoto toDomain() {
    return FavoritePhoto(
      id: id,
      image: image,
      camera: camera,
      rover: rover,
    );
  }

  factory FavoritePhotoDto.fromDatabase(Map<String, dynamic> json) {
    return FavoritePhotoDto(
      id: json['id'] as int,
      image: json['image'] as String,
      camera: json['camera'] as String,
      rover: json['rover'] as String,
    );
  } 

  Map<String, dynamic> toDatabase() {
    return {
      'id': id,
      'image': image,
      'camera': camera,
      'rover': rover,
    };
  }
}