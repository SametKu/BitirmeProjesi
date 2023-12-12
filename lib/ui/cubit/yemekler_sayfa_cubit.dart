import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foods_app/data/entity/yemekler.dart';
import 'package:foods_app/repo/yemekler_dao_repository.dart';

class YemeklerSayfaCubit extends Cubit<List<Yemekler>> {
  YemeklerSayfaCubit() : super(<Yemekler>[]);

  var yrepo = YemeklerDaoRepository();

  Future<void> yemekleriGetir() async {
    var liste = await yrepo.tumYemekleriGetir();
    emit(liste);
  }

  Future<void> yemekAra(String aramaKelimesi) async {
    var liste = await yrepo.yemekAra(aramaKelimesi);
    emit(liste);
  }
}
