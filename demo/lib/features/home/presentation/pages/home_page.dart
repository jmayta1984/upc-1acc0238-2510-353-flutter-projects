import 'package:demo/core/themes/color_palette.dart';
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
  final List<Shoe> _shoes = [
    Shoe(
      id: 1,
      name: 'Adidas Samba',
      brand: 'Adidas',
      category: 'Casual',
      price: 200,
      image:
          'https://images.footlocker.com/is/image/EBFL2/IE1333_01?wid=500&hei=500&fmt=png',
      gender: 'Men',
      description: 'Nice',
      rating: 4.8,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
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
        Expanded(child: ShoeListView(shoes: _shoes)),
      ],
    );
  }
}
