import 'package:flutter/material.dart';
import 'package:foods_app/data/entity/colors.dart';
import 'package:foods_app/data/entity/text.dart';

class ReklamSayfa1 extends StatelessWidget {
  const ReklamSayfa1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Image.asset('resimler/delivery.png'),
            Text(
              TextConstants.delivery,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: ColorConstants.textColor),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              TextConstants.deliveryDesc,
              textAlign: TextAlign.center,
              style: const TextStyle(color: ColorConstants.background),
            )
          ],
        ),
      ),
    );
  }
}
