import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foods_app/data/entity/colors.dart';
import 'package:foods_app/data/entity/sepetim_yemekler.dart';
import 'package:foods_app/data/entity/text.dart';
import 'package:foods_app/ui/cubit/sepetim_sayfa_cubit.dart';
import 'package:foods_app/ui/views/siparis_onay.dart';

class SepetSayfa extends StatefulWidget {
  const SepetSayfa({
    super.key,
  });

  @override
  State<SepetSayfa> createState() => _SepetSayfaState();
}

class _SepetSayfaState extends State<SepetSayfa> {
  @override
  var toplamSepet = 0;

  @override
  void initState() {
    super.initState();
    context.read<SepetSayfaCubit>().yukle(TextConstants.userName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: SizedBox(
        width: 200,
        height: 100,
        child: Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: BlocBuilder<SepetSayfaCubit, List<SepetimYemekler>>(
              builder: (context, sepetYemeklerListesi) {
                return FloatingActionButton(
                  backgroundColor: ColorConstants.amberColor,
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                          color: ColorConstants.cardBackground,
                          width: 4,
                          style: BorderStyle.solid)),
                  onPressed: null,
                  disabledElevation: 0.9,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        TextConstants.amountCart,
                        style: TextStyle(
                            fontSize: 16,
                            color: ColorConstants.blackColor,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        '$toplamSepet₺',
                        style: const TextStyle(
                            fontSize: 24,
                            color: ColorConstants.blackColor,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                );
              },
            )),
      ),
      backgroundColor: ColorConstants.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: const Text(
          TextConstants.myCart,
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        backgroundColor: ColorConstants.background,
        actions: [
          SizedBox(
            height: 50,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConstants.cardBackground,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: ColorConstants.amberColor,
                          title: Text(
                            "${TextConstants.totalCart} $toplamSepet ₺",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          content: const Text(TextConstants.confirmCart),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                    child: const Text(TextConstants.no),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    }),
                                TextButton(
                                    child: const Text(TextConstants.yes),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      if (toplamSepet > 0) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const SiparisOnay(),
                                            ));
                                      } else {
                                        const Center();
                                      }
                                    }),
                              ],
                            )
                          ],
                        );
                      });
                },
                child: const Text(
                  "${TextConstants.confirmedCart} ",
                  style: TextStyle(color: ColorConstants.textColor),
                )),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: BlocBuilder<SepetSayfaCubit, List<SepetimYemekler>>(
        builder: (context, sepetYemeklerListesi) {
          toplamSepet = 0;
          for (var i = 0; i < sepetYemeklerListesi.length; i++) {
            toplamSepet += int.parse(sepetYemeklerListesi[i].yemek_fiyat) * 1;
          }

          if (sepetYemeklerListesi.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ListView.builder(
                itemCount: sepetYemeklerListesi.length,
                itemBuilder: (context, index) {
                  var yemek = sepetYemeklerListesi[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Card(
                      color: ColorConstants.detailBackground,
                      elevation: 6,
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 28,
                          backgroundColor: ColorConstants.cardBackground,
                          backgroundImage: NetworkImage(
                            "http://kasimadalan.pe.hu/yemekresimler/${yemek.yemek_resim_adi}",
                          ),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                              "${yemek.yemek_siparis_adet} Adet ${yemek.yemek_adi}",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600)),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "${int.parse(yemek.yemek_fiyat) * 1} ₺",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        trailing:
                            BlocBuilder<SepetSayfaCubit, List<SepetimYemekler>>(
                          builder: (context, sepetYemeklerListesi) {
                            return IconButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          "${yemek.yemek_adi} silinsin mi?"),
                                      action: SnackBarAction(
                                        label: TextConstants.yes,
                                        onPressed: () {
                                          context
                                              .read<SepetSayfaCubit>()
                                              .delete(yemek.sepet_yemek_id,
                                                  yemek.kullanici_adi);
                                          if (sepetYemeklerListesi.length ==
                                              1) {
                                            setState(() {
                                              sepetYemeklerListesi.clear();
                                              toplamSepet = 0;
                                            });
                                          }
                                        },
                                      ),
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.delete_outline_rounded,
                                  color: ColorConstants.redColor,
                                ));
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return Center(
              child: Container(
                decoration: const BoxDecoration(
                    color: ColorConstants.background,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Center(
                  child: Text(
                    TextConstants.emptyCart,
                    style: TextStyle(
                        fontSize: 20,
                        color: ColorConstants.cardBackground,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
