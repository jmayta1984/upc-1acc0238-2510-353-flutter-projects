import 'package:demo/features/favorites/domain/entities/favorite_shoe.dart';
import 'package:flutter/material.dart';

class FavoriteShoeListView extends StatelessWidget {
  const FavoriteShoeListView({super.key, required this.favoriteShoes});

  final List<FavoriteShoe> favoriteShoes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: favoriteShoes.length,
      itemBuilder: (context, index) {
        final shoe = favoriteShoes[index];
        return Card(
          child: Row(
            children: [
              SizedBox(width: 8),
              SizedBox(
                height: 100,
                width: 140,
                child: Image.network(shoe.image, fit: BoxFit.cover),
              ),
              SizedBox(width: 8),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('\$${shoe.price}'),
                    Text(
                      shoe.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.black,
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.vertical(
                              top: Radius.circular(8),
                            ),
                          ),
                          builder: (BuildContext context) {
                            return SizedBox(
                              height: 200,
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Sizes',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Text('Add to cart'),
                    ),
                  ],
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.vertical(
                        top: Radius.circular(8),
                      ),
                    ),
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Options',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              ListTile(
                                leading: Icon(Icons.shopping_cart),
                                title: Text('Add to cart'),
                              ),
                              ListTile(
                                leading: Icon(Icons.delete),
                                title: Text('Remove from favorites'),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                icon: Icon(Icons.more_vert),
              ),
            ],
          ),
        );
      },
    );
  }
}
