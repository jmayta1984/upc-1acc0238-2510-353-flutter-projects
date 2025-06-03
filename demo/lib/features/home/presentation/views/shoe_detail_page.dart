import 'package:demo/core/themes/color_palette.dart';
import 'package:demo/features/home/domain/entities/shoe.dart';
import 'package:flutter/material.dart';

class ShoeDetailPage extends StatelessWidget {
  const ShoeDetailPage({super.key, required this.shoe});
  final Shoe shoe;

  @override
  Widget build(BuildContext context) {
    final List<String> sizes = ['8', '8.5', '9', '8', '8.5', '9','8', '8.5', '9','8', '8.5', '9','8', '8.5', '9'];
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 300,
              pinned: true,
              floating: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: shoe.id,
                  child: Image.network(shoe.image),
                ),
              ),
            ),
          ];
        },
        body: Column(
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
                separatorBuilder: (context, index) => SizedBox(width: 8,),
              scrollDirection: Axis.horizontal,
                itemCount: sizes.length,
                itemBuilder:(context, index) {
                  return Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorPalette.primaryColor
                      ),
                      width: 40,
                      height: 40,
                      child: Center(child: Text(sizes[index])),
                    ),
                  );
                },),
            )
          ],
        ),
      ),
    );
  }
}
