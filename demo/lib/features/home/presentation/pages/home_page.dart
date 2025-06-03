import 'package:demo/core/themes/color_palette.dart';
import 'package:demo/features/home/data/datasources/shoe_service.dart';
import 'package:demo/features/home/domain/entities/shoe.dart';
import 'package:demo/features/home/presentation/views/banner_view.dart';
import 'package:demo/features/home/presentation/views/shoe_list_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Shoe> _shoes = [];
  List<Shoe> _filteredShoes = [];

  Future<void> loadData() async {
    List<Shoe> shoes = await ShoeService().getShoes();
    setState(() {
      _shoes = shoes;
      _filteredShoes = shoes;
    });
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: (value) {
            setState(() {
              _filteredShoes = _shoes
                  .where(
                    (e) => e.name.toLowerCase().contains(value.toLowerCase()),
                  )
                  .toList();
            });
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
        Expanded(child: ShoeListView(shoes: _filteredShoes)),
      ],
    );
  }
}
