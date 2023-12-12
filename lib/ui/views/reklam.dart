import 'package:flutter/material.dart';
import 'package:foods_app/ui/views/reklam_sayfa_1.dart';
import 'package:foods_app/ui/views/reklam_sayfa_2.dart';
import 'package:foods_app/ui/views/reklam_sayfa_3.dart';

class ReklamView extends StatelessWidget {
  const ReklamView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: const [
          ReklamSayfa1(),
          ReklamSayfa2(),
          ReklamSayfa3(),
        ],
      ),
    );
  }
}
