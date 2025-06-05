import 'package:demo/features/home/domain/entities/shoe.dart';

class ShoeDto {
  final int id;
  final String name;
  final String brand;
  final String category;
  final int price;
  final String image;
  final String gender;
  final String description;
  final double rating;
  final List<ShoeSizeDto> sizes;

  ShoeDto({
    required this.id,
    required this.name,
    required this.brand,
    required this.category,
    required this.price,
    required this.image,
    required this.gender,
    required this.description,
    required this.rating,
    required this.sizes,
  });

  factory ShoeDto.fromJson(Map<String, dynamic> json) {
    return ShoeDto(
      id: json['id'],
      name: json['name'],
      brand: json['brand'],
      category: json['category'],
      price: json['price'],
      image: json['image'],
      gender: json['gender'],
      description: json['description'],
      rating: (json['rating'] as num).toDouble(),
      sizes: (json['sizes_available'] as List)
          .map((size) => ShoeSizeDto.fromJson(size as Map<String, dynamic>))
          .toList(),
    );
  }

  Shoe toDomain() {
    return Shoe(
      id: id,
      name: name,
      brand: brand,
      category: category,
      price: price,
      image: image,
      gender: gender,
      description: description,
      rating: rating,
      sizes: sizes.map((size) => size.toDomain()).toList(),
    );
  }
}

class ShoeSizeDto {
  final double size;
  final int quantity;

  ShoeSizeDto({
    required this.size,
    required this.quantity,
  });

  factory ShoeSizeDto.fromJson(Map<String, dynamic> json) {
    return ShoeSizeDto(
      size: (json['size'] as num).toDouble(),
      quantity: json['quantity'],
    );
  }
  ShoeSize toDomain() {
    return ShoeSize(
      size: size.toString(),
      quantity: quantity,
    );
  }
  
}
