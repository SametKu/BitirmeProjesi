import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foods_app/data/entity/sepetim_yemekler.dart';
import 'package:foods_app/repo/sepetim_dao_repository.dart';

class SepetSayfaCubit extends Cubit<List<SepetimYemekler>> {
  SepetSayfaCubit() : super([]);
  var srepo = SepetimDaoRepository();

  Future<void> ekle(
      // ignore: non_constant_identifier_names
      String yemek_adi,
      // ignore: non_constant_identifier_names
      String kullanici_adi,
      // ignore: non_constant_identifier_names
      int yemek_siparis_adet,
      // ignore: non_constant_identifier_names
      String yemek_resim_adi,
      // ignore: non_constant_identifier_names
      int yemek_fiyat) async {
    var liste = await srepo.sepeteEkle(yemek_adi, yemek_resim_adi, yemek_fiyat,
        kullanici_adi, yemek_siparis_adet);
  }

  // ignore: non_constant_identifier_names
  Future<void> yukle(String kullanici_adi) async {
    var liste = await srepo.yemekYukle(kullanici_adi);
    emit(liste);
  }

  // ignore: non_constant_identifier_names
  Future<void> delete(String sepet_yemek_id, String kullanici_adi) async {
    var liste = await srepo.deleteFoods(sepet_yemek_id, kullanici_adi);
  }

  Future<void> deleteList(String sepetYemekId, String kullaniciAdi) async {
    var liste = await srepo.deleteAllFoods(sepetYemekId, kullaniciAdi);
  }
}
