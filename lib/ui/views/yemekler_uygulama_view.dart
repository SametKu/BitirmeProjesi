import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:foods_app/data/entity/colors.dart';
import 'package:foods_app/data/entity/tabs.dart';

class YemeklerUygulamaView extends StatefulWidget {
  const YemeklerUygulamaView({super.key});

  @override
  State<YemeklerUygulamaView> createState() => _YemeklerUygulamaViewState();
}

class _YemeklerUygulamaViewState extends State<YemeklerUygulamaView> {
  int myIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Tabs.tabs[myIndex],
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: ColorConstants.cardBackground,
          color: ColorConstants.amberColor,
          items: const [
            Icon(
              Icons.fastfood,
              size: 30,
            ),
            Icon(
              Icons.shopping_cart,
              size: 30,
            ),
          ],
          height: 60,
          onTap: (index) {
            setState(() {
              myIndex = index;
            });
          },
        ));
  }
}
