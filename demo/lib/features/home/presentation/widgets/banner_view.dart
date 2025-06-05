import 'package:demo/core/themes/color_palette.dart';
import 'package:flutter/material.dart';

class BannerView extends StatelessWidget {
  const BannerView({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Container(
      decoration: BoxDecoration(
        color: ColorPalette.primaryColor,

        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  "Get Your Special Sale",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ColorPalette.white,
                    fontSize: 16,
                  ),
                ),
                Text("Up to 50%", style: TextStyle(color: ColorPalette.white)),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      width: 1.0,
                      color: ColorPalette.primaryColor,
                    ),
                    foregroundColor: ColorPalette.white,
                    backgroundColor: ColorPalette.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(32),
                    ),
                  ),
                  onPressed: () => {},
                  child: Text("Shop Now"),
                ),
              ],
            ),
          ),
          Spacer(),
          SizedBox(
            height: 130,
            width: width * 0.5,
            child: Image.asset("assets/adidas_samba.png", fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}
