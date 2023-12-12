import 'package:flutter/material.dart';
import 'package:foods_app/data/entity/text.dart';
import 'package:lottie/lottie.dart';

class SiparisOnay extends StatelessWidget {
  const SiparisOnay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            const Text(
              TextConstants.tookOrder,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w500),
            ),
            Lottie.network(
                'https://lottie.host/a2dd4080-0114-4656-8744-4a93fbfec095/dhmhoY1Q22.json'),
          ],
        ),
      ),
    );
  }
}
