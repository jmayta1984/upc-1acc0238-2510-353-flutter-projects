import 'package:demo/core/themes/color_palette.dart';
import 'package:demo/features/home/domain/entities/shoe.dart';
import 'package:demo/features/home/presentation/blocs/shoe_bloc.dart';
import 'package:demo/features/home/presentation/blocs/shoe_event.dart';
import 'package:demo/features/home/presentation/blocs/shoe_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoeDetailPage extends StatefulWidget {
  const ShoeDetailPage({super.key, required this.shoe});
  final Shoe shoe;

  @override
  State<ShoeDetailPage> createState() => _ShoeDetailPageState();
}

class _ShoeDetailPageState extends State<ShoeDetailPage> {
  int _selectedSizeIndex = -1;

  @override
  Widget build(BuildContext context) {
    Shoe shoe = widget.shoe;
    final List<ShoeSize> sizes = shoe.sizes;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 48,
          width: double.infinity,
          child: FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Color.fromRGBO(255, 107, 53, 1),
            ),
            onPressed: (_selectedSizeIndex >= 0) ? () => {} : null,
            child: Text("Add to cart"),
          ),
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 300,
              pinned: true,
              floating: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Center(
                      child: Hero(
                        tag: shoe.id,
                        child: SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: Image.network(shoe.image, fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 60,
                      right: 0,
                      child: IconButton(
                        onPressed: () {
                          context.read<ShoeBloc>().add(
                            ToggleShoeEvent(shoe: shoe),
                          );
                        },
                        icon: BlocBuilder<ShoeBloc, ShoeState>(
                          builder: (context, state) {
                            if (state is LoadedShoeState) {
                              final isFavorite = state.shoes
                                  .where((e) => e.id == shoe.id)
                                  .first
                                  .isFavorite;
                              return isFavorite
                                  ? Icon(Icons.favorite)
                                  : Icon(Icons.favorite_border);
                            }
                            return Icon(Icons.favorite_border);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                shoe.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Text(shoe.description),

              Text("Size", style: TextStyle(fontWeight: FontWeight.bold)),

              SizedBox(
                height: 40,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(width: 8),
                  scrollDirection: Axis.horizontal,
                  itemCount: sizes.length,
                  itemBuilder: (context, index) {
                    final size = sizes[index];
                    final isSelected = index == _selectedSizeIndex;
                    return Center(
                      child: GestureDetector(
                        onTap: () => setState(() {
                          _selectedSizeIndex = index;
                        }),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),

                            color: isSelected
                                ? ColorPalette.primaryColor
                                : ColorPalette.white,
                          ),
                          width: 40,
                          height: 40,
                          child: Center(
                            child: Text(
                              size.size,
                              style: TextStyle(
                                color: isSelected
                                    ? ColorPalette.white
                                    : ColorPalette.background,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              if (_selectedSizeIndex >= 0)
                Row(
                  children: [
                    SizedBox(
                      width: 48,
                      height: 24,
                      child: Center(
                        child: Text(
                          sizes[_selectedSizeIndex].quantity.toString(),
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
