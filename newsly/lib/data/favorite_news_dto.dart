import 'package:newsly/domain/favorite_news.dart';

class FavoriteNewsDto {
  final String title;
  final String description;
  final String image;
  final String author;

  FavoriteNewsDto({
    required this.title,
    required this.description,
    required this.image,
    required this.author,
  });

  Map<String, dynamic> toDatabase() {
    return {
      'title': title,
      'description': description,
      'image': image,
      'author': author,
    };
  }

  factory FavoriteNewsDto.fromDatabase(Map<String, dynamic> json) {
    return FavoriteNewsDto(
      title: json['title'],
      description: json['description'],
      image: json['image'],
      author: json['author'],
    );
  }

  FavoriteNews toDomain() {
    return FavoriteNews(
      title: title,
      description: description,
      image: image,
      author: author,
    );
  }

  factory FavoriteNewsDto.fromDomain(FavoriteNews favoriteNews) {
    return FavoriteNewsDto(
      title: favoriteNews.title,
      description: favoriteNews.description,
      image: favoriteNews.image,
      author: favoriteNews.author,
    );
  }
}
