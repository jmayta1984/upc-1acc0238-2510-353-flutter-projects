import 'package:demo/features/favorites/presentation/blocs/favorite_bloc.dart';
import 'package:demo/features/favorites/presentation/blocs/favorite_event.dart';
import 'package:demo/features/favorites/presentation/blocs/favorite_state.dart';
import 'package:demo/features/favorites/presentation/widgets/favorite_shoe_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  void initState() {
    context.read<FavoriteBloc>().add(GetAllFavoriteEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        if (state is LoadingFavoriteState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is LoadedFavoriteState) {
          return state.favorites.isNotEmpty
              ? FavoriteShoeListView(favoriteShoes: state.favorites)
              : Center(child: Text('No favorites'));
        }
        return Center();
      },
    );
  }
}
