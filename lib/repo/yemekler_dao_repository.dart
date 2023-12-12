import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:foods_app/data/entity/yemekler.dart';
import 'package:foods_app/data/entity/yemekler_cevap.dart';

class YemeklerDaoRepository {
  List<Yemekler> parseYemeklerCevap(String cevap) {
    return YemeklerCevap.fromJson(json.decode(cevap)).yemekler;
  }

  Future<List<Yemekler>> tumYemekleriGetir() async {
    //dio
    var url = "http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php";
    var cevap = await Dio().get(url);
    return parseYemeklerCevap(cevap.data.toString());
  }

  Future<List<Yemekler>> yemekAra(String aramaKelimesi) async {
    var url = "http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php";
    var veri = {"kisi_ad": aramaKelimesi};
    var cevap = await Dio().post(url);
    return parseYemeklerCevap(cevap.data)
        .where((element) => element.yemek_adi
            .toLowerCase()
            .contains(aramaKelimesi.toLowerCase()))
        .toList();
  }
}
