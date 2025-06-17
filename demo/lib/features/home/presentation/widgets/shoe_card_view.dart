import 'package:demo/features/home/domain/entities/shoe.dart';
import 'package:demo/features/home/presentation/blocs/shoe_bloc.dart';
import 'package:demo/features/home/presentation/blocs/shoe_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoeCardView extends StatelessWidget {
  const ShoeCardView({super.key, required this.shoe});
  final Shoe shoe;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Hero(tag: shoe.id, child: Image.network(shoe.image)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(shoe.brand),
                    Text(
                      shoe.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 1,
                    ),
                    Text(
                      '\$ ${shoe.price}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  context.read<ShoeBloc>().add(
                    ToggleShoeEvent(shoe: shoe),
                  );
                },
                icon: shoe.isFavorite
                    ? Icon(Icons.favorite)
                    : Icon(Icons.favorite_border),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
