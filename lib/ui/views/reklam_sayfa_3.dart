import 'package:flutter/material.dart';
import 'package:foods_app/data/entity/colors.dart';
import 'package:foods_app/data/entity/text.dart';
import 'package:foods_app/ui/views/yemekler_uygulama_view.dart';

class ReklamSayfa3 extends StatelessWidget {
  const ReklamSayfa3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 32,
              ),
              Image.asset('resimler/lezzet.png'),
              const Text(
                TextConstants.topDelicious,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: ColorConstants.textColor),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                TextConstants.topDeliciousDesc,
                textAlign: TextAlign.center,
                style: TextStyle(color: ColorConstants.background),
              ),
              const Spacer(),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConstants.cardBackground),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const YemeklerUygulamaView(),
                          ));
                    },
                    child: const Text(
                      TextConstants.discover,
                      style: TextStyle(color: ColorConstants.textColor),
                    )),
              ),
              const SizedBox(
                height: 25,
              )
            ],
          ),
        ),
      ),
    );
  }
}
