import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foods_app/data/entity/colors.dart';
import 'package:foods_app/data/entity/text.dart';
import 'package:foods_app/data/entity/yemekler.dart';
import 'package:foods_app/ui/cubit/yemekler_sayfa_cubit.dart';
import 'package:foods_app/ui/views/yemekler_detay_sayfa.dart';

class YemeklerSayfa extends StatefulWidget {
  const YemeklerSayfa({super.key});

  @override
  State<YemeklerSayfa> createState() => _YemeklerSayfaState();
}

class _YemeklerSayfaState extends State<YemeklerSayfa> {
  @override
  void initState() {
    super.initState();
    context.read<YemeklerSayfaCubit>().yemekleriGetir();
  }

  bool aramaYapiliyorMu = true;

  void aramaYap() {
    setState(() {
      aramaYapiliyorMu = !aramaYapiliyorMu;
    });
  }

  int myIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: SizedBox(
        width: 300,
        height: 100,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: FloatingActionButton(
            backgroundColor: ColorConstants.amberColor,
            shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                    color: ColorConstants.cardBackground,
                    width: 4,
                    style: BorderStyle.solid)),
            onPressed: null,
            disabledElevation: 0.9,
            child: aramaYapiliyorMu
                ? const Text(
                    TextConstants.titleFoods,
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
                  )
                : SizedBox(
                    height: 45,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextField(
                        onChanged: (aramaSonucu) {
                          context
                              .read<YemeklerSayfaCubit>()
                              .yemekAra(aramaSonucu);
                        },
                        decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: ColorConstants.redColor)),
                            prefixIcon: Icon(Icons.search),
                            suffixText: 'Ara'),
                      ),
                    ),
                  ),
          ),
        ),
      ),
      backgroundColor: ColorConstants.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: ColorConstants.background,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                aramaYap();
              },
              icon: aramaYapiliyorMu
                  ? const Icon(
                      Icons.search,
                      color: ColorConstants.blackColor,
                    )
                  : const Icon(
                      Icons.clear,
                      color: ColorConstants.blackColor,
                    )),
        ],
      ),
      body: BlocBuilder<YemeklerSayfaCubit, List<Yemekler>>(
          builder: (context, yemeklerListesi) {
        if (yemeklerListesi.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.only(top: 30),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 2 / 2.8),
                itemCount: yemeklerListesi.length,
                itemBuilder: (context, index) {
                  var yemek = yemeklerListesi[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                YemeklerDetaySayfa(yemek: yemek),
                          ));
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: Card(
                        color: ColorConstants.cardBackground,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Image.network(
                                "http://kasimadalan.pe.hu/yemekler/resimler/${yemek.yemek_resim_adi}",
                              ),
                            ),
                            Text(
                              yemek.yemek_adi,
                              style: const TextStyle(
                                  color: ColorConstants.textColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 18),
                                  child: Text(
                                    "${yemek.yemek_fiyat} ₺",
                                    style: const TextStyle(
                                        color: ColorConstants.textColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Icon(
                                    (Icons.add_circle),
                                    color: ColorConstants.textColor,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          );
        } else {
          return const Center();
        }
      }),
    );
  }
}
