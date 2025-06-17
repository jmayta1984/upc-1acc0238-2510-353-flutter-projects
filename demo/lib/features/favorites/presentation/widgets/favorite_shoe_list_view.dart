import 'package:demo/core/themes/color_palette.dart';
import 'package:demo/features/favorites/domain/entities/favorite_shoe.dart';
import 'package:demo/features/favorites/presentation/blocs/favorite_bloc.dart';
import 'package:demo/features/favorites/presentation/blocs/favorite_event.dart';
import 'package:demo/features/home/presentation/blocs/shoe_bloc.dart';
import 'package:demo/features/home/presentation/blocs/shoe_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                width: 110,
                child: Image.network(shoe.image, fit: BoxFit.cover),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('\$${shoe.price}'),
                    Text(
                      shoe.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
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
                                    BlocBuilder<ShoeBloc, ShoeState>(
                                      builder: (context, state) {
                                        if (state is LoadedShoeState) {
                                          final shoes = state.shoes;
                                          final sizes = shoes
                                              .where((e) => e.id == shoe.id)
                                              .first
                                              .sizes;
                                          return SizedBox(
                                            height: 40,
                                            child: ListView.separated(
                                              separatorBuilder:
                                                  (context, index) =>
                                                      SizedBox(width: 8),
                                              scrollDirection: Axis.horizontal,
                                              itemCount: sizes.length,
                                              itemBuilder: (context, index) {
                                                final size = sizes[index];
                                                final isSelected = false;
                                                /*index == _selectedSizeIndex;*/
                                                return Center(
                                                  child: GestureDetector(
                                                    /* onTap: () => setState(() {
                                                      _selectedSizeIndex =
                                                          index;
                                                    }),*/
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              8,
                                                            ),

                                                        color: isSelected
                                                            ? ColorPalette
                                                                  .primaryColor
                                                            : ColorPalette
                                                                  .white,
                                                      ),
                                                      width: 40,
                                                      height: 40,
                                                      child: Center(
                                                        child: Text(
                                                          size.size,
                                                          style: TextStyle(
                                                            color: isSelected
                                                                ? ColorPalette
                                                                      .white
                                                                : ColorPalette
                                                                      .background,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          );
                                        }
                                        return Center();
                                      },
                                    ),
                                    SizedBox(
                                      height: 48,
                                      width: double.infinity,
                                      child: FilledButton(
                                        style: FilledButton.styleFrom(
                                          backgroundColor: Color.fromRGBO(
                                            255,
                                            107,
                                            53,
                                            1,
                                          ),
                                        ),
                                        onPressed: /*(_selectedSizeIndex >= 0) ? () => {} :*/
                                            null,
                                        child: Text("Add to cart"),
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
                        height: 180,
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
                              GestureDetector(
                                onTap: () {
                                  context.read<FavoriteBloc>().add(
                                    RemoveFavoriteEvent(id: shoe.id),
                                  );
                                  Navigator.pop(context);
                                },
                                child: ListTile(
                                  leading: Icon(Icons.delete),
                                  title: Text('Remove from favorites'),
                                ),
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
