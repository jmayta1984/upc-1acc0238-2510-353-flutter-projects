import 'package:newsly/domain/news.dart';

class NewsDto {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;
  final SourceDto source;

  const NewsDto({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
    required this.source,
  });

  factory NewsDto.fromJson(Map<String, dynamic> json) {
    return NewsDto(
      author: json['author'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      urlToImage: json['urlToImage'] ?? '',
      publishedAt: json['publishedAt'] ?? '',
      content: json['content'] ?? '',
      source: SourceDto.fromJson(json['source'] ?? {}),
    );
  }

  News toDomain() {
    return News(
      title: title,
      author: author,
      image: urlToImage,
      year: publishedAt.split('-')[0],
      content: content,
      source: source.name,
      description: description
    );
  }
}

class SourceDto {
  final String id;
  final String name;

  const SourceDto({
    required this.id,
    required this.name,
  });

  factory SourceDto.fromJson(Map<String, dynamic> json) {
    return SourceDto(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
    );
  }
}
