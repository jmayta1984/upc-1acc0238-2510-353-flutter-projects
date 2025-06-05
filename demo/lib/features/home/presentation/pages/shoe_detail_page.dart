import 'package:demo/core/themes/color_palette.dart';
import 'package:demo/features/home/domain/entities/shoe.dart';
import 'package:flutter/material.dart';

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
    final List<ShoeSize> sizes = widget.shoe.sizes;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          NestedScrollView(
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
                            tag: widget.shoe.id,
                            child: Image.network(widget.shoe.image),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          child: IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border)),
                        )
                      ],
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
                  widget.shoe.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Text(widget.shoe.description),
      
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
                              border: Border.all(
                                color: isSelected
                                    ? ColorPalette.primaryColor
                                    : ColorPalette.background,
                              ),
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
          Positioned(
            bottom: 48,
            child: SizedBox(
              height: 48,
              width: width,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    width: 1.0,
                    color: Color.fromRGBO(255, 107, 53, 1),
                  ),
                  foregroundColor: Colors.white,
                  backgroundColor: Color.fromRGBO(255, 107, 53, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(32),
                  ),
                ),
                onPressed: () => {},
                child: Text("Add to cart"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
