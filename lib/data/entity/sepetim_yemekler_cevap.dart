import 'package:foods_app/data/entity/sepetim_yemekler.dart';

class SepetimYemeklerCevap {
  List<SepetimYemekler> sepet_yemekler;
  int success;

  SepetimYemeklerCevap({required this.sepet_yemekler, required this.success});

  factory SepetimYemeklerCevap.fromJson(Map<String, dynamic> json) {
    var jsonArray = (json["sepet_yemekler"] ?? []) as List;
    List<SepetimYemekler> sepetimYemekler = jsonArray
        .map((jsonArrayNesnesi) => SepetimYemekler.fromJson(jsonArrayNesnesi))
        .toList();
    int success = json["success"] as int;
    return SepetimYemeklerCevap(
        sepet_yemekler: sepetimYemekler, success: success);
  }
}
