import 'package:flutter/material.dart';
import 'package:foods_app/data/entity/text.dart';

class ReklamSayfa2 extends StatelessWidget {
  const ReklamSayfa2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Image.asset('resimler/cesit.png'),
            const SizedBox(
              height: 30,
            ),
            const Text(
              TextConstants.sort,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              TextConstants.sortDesc,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
