import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            cursorColor: Color.fromRGBO(255, 107, 53, 1),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: Color.fromRGBO(255, 107, 53, 1),
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              hintText: "Search",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Column(
                children: [
                  Text("Get Your Special Sale"),
                  Text("Up to 50%"),
                  OutlinedButton(
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
                    child: Text("Shop Now"),
                  ),
                ],
              ),
              Image.asset("assets/adidas_samba.png")
            ],
          ),
        ),
      ],
    );
  }
}
