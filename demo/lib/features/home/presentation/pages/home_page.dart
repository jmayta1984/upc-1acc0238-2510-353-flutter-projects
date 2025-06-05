import 'package:demo/core/themes/color_palette.dart';
import 'package:demo/features/home/presentation/blocs/shoe_bloc.dart';
import 'package:demo/features/home/presentation/blocs/shoe_event.dart';
import 'package:demo/features/home/presentation/blocs/shoe_state.dart';
import 'package:demo/features/home/presentation/widgets/banner_view.dart';
import 'package:demo/features/home/presentation/widgets/shoe_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /*
  List<Shoe> _shoes = [];
  List<Shoe> _filteredShoes = [];

  Future<void> loadData() async {
    List<Shoe> shoes = await ShoeRepository(
      shoeService: ShoeService(),
    ).getShoes();
    if (mounted) {
      setState(() {
        _shoes = shoes;
        _filteredShoes = shoes;
      });
    }
  }
*/
  @override
  void initState() {
    //loadData();
    super.initState();
    context.read<ShoeBloc>().add(GetShoes());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: (value) {
            /*
            if (mounted) {
              setState(() {
                _filteredShoes = _shoes
                    .where(
                      (e) => e.name.toLowerCase().contains(value.toLowerCase()),
                    )
                    .toList();
              });
            }
            */
          },
          cursorColor: ColorPalette.primaryColor,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: ColorPalette.primaryColor,
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
            hintText: "Search",
          ),
        ),
        BannerView(),
        BlocBuilder<ShoeBloc, ShoeState>(
          builder: (context, state) {
            if (state is LoadingShoeState) {
              return Expanded(
                child: Center(
                  child: CircularProgressIndicator(
                    color: ColorPalette.primaryColor,
                  ),
                ),
              );
            } else if (state is LoadedShoeState) {
              return Expanded(child: ShoeListView(shoes: state.shoes));
            }
            return Center();
          },
        ),
      ],
    );
  }
}
