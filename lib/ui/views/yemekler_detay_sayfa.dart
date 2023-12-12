import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foods_app/data/entity/colors.dart';
import 'package:foods_app/data/entity/text.dart';
import 'package:foods_app/data/entity/yemekler.dart';
import 'package:foods_app/ui/cubit/sepetim_sayfa_cubit.dart';

class YemeklerDetaySayfa extends StatefulWidget {
  Yemekler yemek;

  YemeklerDetaySayfa({
    super.key,
    required this.yemek,
  });

  @override
  State<YemeklerDetaySayfa> createState() => _YemeklerDetaySayfaState();
}

class _YemeklerDetaySayfaState extends State<YemeklerDetaySayfa> {
  int yemek_siparis_adet = 1;

  void adetAzalt() {
    setState(() {
      yemek_siparis_adet--;
    });
  }

  void adetArttir() {
    setState(() {
      yemek_siparis_adet++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var yemek = widget.yemek;
    int total = int.parse(yemek.yemek_fiyat) * yemek_siparis_adet;
    return Scaffold(
      backgroundColor: ColorConstants.background,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        centerTitle: true,
        backgroundColor: ColorConstants.background,
        title: const Text(
          TextConstants.productDetail,
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                color: ColorConstants.detailBackground,
                borderRadius: BorderRadius.circular(15)),
            child: Image.network(
                "http://kasimadalan.pe.hu/yemekler/resimler/${yemek.yemek_resim_adi}"),
          ),
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              color: ColorConstants.detailBackground,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    yemek.yemek_adi,
                    style: const TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: ColorConstants.cardBackground,
                                shape: BoxShape.circle),
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    yemek_siparis_adet != 1
                                        ? adetAzalt()
                                        : yemek_siparis_adet;
                                  });
                                },
                                icon: const Icon(
                                  Icons.remove,
                                  color: ColorConstants.textColor,
                                )),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            "$yemek_siparis_adet",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: ColorConstants.cardBackground,
                                shape: BoxShape.circle),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  adetArttir();
                                });
                              },
                              icon: const Icon(
                                Icons.add,
                                color: ColorConstants.textColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "$total ₺",
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorConstants.cardBackground),
                      onPressed: () {
                        context
                            .read<SepetSayfaCubit>()
                            .ekle(
                              widget.yemek.yemek_adi,
                              TextConstants.userName,
                              yemek_siparis_adet,
                              widget.yemek.yemek_resim_adi,
                              total,
                            )
                            .then((value) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  "${widget.yemek.yemek_adi} sepete eklendi")));
                        });
                      },
                      child: const Text(
                        TextConstants.addCart,
                        style: TextStyle(color: ColorConstants.textColor),
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
