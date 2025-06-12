import 'package:demo/features/favorites/data/repositories/favorite_shoe_repository.dart';
import 'package:demo/features/favorites/presentation/blocs/favorite_event.dart';
import 'package:demo/features/favorites/presentation/blocs/favorite_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final repository = FavoriteShoeRepository();

  FavoriteBloc() : super(InitialFavoriteState()) {
    on<AddFavoriteEvent>((event, emit) async {
      emit(LoadingFavoriteState());
      await repository.insertFavorite(event.favorite);
      final favorites = await repository.fetchFavorites();
      emit(LoadedFavoriteState(favorites: favorites));
    });

    on<RemoveFavoriteEvent>((event, emit) async {
      emit(LoadingFavoriteState());
      await repository.deleteFavorite(event.id);
      final favorites = await repository.fetchFavorites();
      emit(LoadedFavoriteState(favorites: favorites));
    });

    on<GetAllFavoriteEvent>((event, emit) async {
      emit(LoadingFavoriteState());
      final favorites = await repository.fetchFavorites();
      emit(LoadedFavoriteState(favorites: favorites));
    });
  }
}
