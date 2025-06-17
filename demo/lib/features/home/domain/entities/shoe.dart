class Shoe {
  final int id;
  final String name;
  final String brand;
  final String category;
  final int price;
  final String image;
  final String gender;
  final String description;
  final double rating;
  final List<ShoeSize> sizes;
  final bool isFavorite;

  Shoe({
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
    required this.isFavorite,
  });

  Shoe copy({required bool isFavorite}) {
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
      sizes: sizes,
      isFavorite: isFavorite,
    );
  }
}

class ShoeSize {
  final String size;
  final int quantity;

  ShoeSize({required this.size, required this.quantity});
}
