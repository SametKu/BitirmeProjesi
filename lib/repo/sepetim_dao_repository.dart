import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:foods_app/data/entity/sepetim_yemekler.dart';
import 'package:foods_app/data/entity/sepetim_yemekler_cevap.dart';

class SepetimDaoRepository {
  List<SepetimYemekler> parseSepetimYemeklerCevap(String cevap) {
    try {
      return SepetimYemeklerCevap.fromJson(json.decode(cevap)).sepet_yemekler;
    } catch (e) {
      print('HATA : $e');
      return [];
    }
  }

  Future<void> sepeteEkle(
      // ignore: non_constant_identifier_names
      String yemek_adi,
      // ignore: non_constant_identifier_names
      String yemek_resim_adi,
      // ignore: non_constant_identifier_names
      int yemek_fiyat,

      // ignore: non_constant_identifier_names
      String kullanici_adi,
      // ignore: non_constant_identifier_names
      int yemek_siparis_adet) async {
    var url = "http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php";
    var veri = {
      "yemek_adi": yemek_adi,
      "yemek_resim_adi": yemek_resim_adi,
      "yemek_fiyat": yemek_fiyat,
      "yemek_siparis_adet": yemek_siparis_adet,
      "kullanici_adi": kullanici_adi
    };
    print("$veri");
    var cevap = await Dio().post(url, data: FormData.fromMap(veri));
    print("Sepete yemek ekle: ${cevap.data.toString()}");
  }

  // ignore: non_constant_identifier_names
  Future<List<SepetimYemekler>> yemekYukle(String kullanici_adi) async {
    var url = "http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php";
    var veri = {"kullanici_adi": kullanici_adi};
    var cevap = await Dio().post(url, data: FormData.fromMap(veri));
    print('$veri');
    print('Cevap : ${cevap.data.toString()}');
    return parseSepetimYemeklerCevap(cevap.data.toString());
  }

  // ignore: non_constant_identifier_names
  Future<void> deleteFoods(String sepet_yemek_id, String kullanici_adi) async {
    var url = "http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php";
    var veri = {
      "sepet_yemek_id": sepet_yemek_id,
      "kullanici_adi": kullanici_adi
    };
    var cevap = await Dio().post(url, data: FormData.fromMap(veri));
    print("Yemek sil: ${cevap.data.toString()}");
  }

  Future<void> deleteAllFoods(String sepetYemekId, String kullaniciAdi) async {
    var url = "http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php";
    var veri = {"sepet_yemek_id": sepetYemekId, "kullanici_adi": kullaniciAdi};
    var cevap = await Dio().post(url, data: FormData.fromMap(veri));
    print("Yemek sil: ${cevap.data.toString()}");
  }
}
