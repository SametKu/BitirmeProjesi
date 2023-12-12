import 'package:foods_app/ui/views/sepetim_sayfa.dart';
import 'package:foods_app/ui/views/yemekler_sayfa.dart';

mixin Tabs {
  static final tabs = [
    const YemeklerSayfa(),
    const SepetSayfa(),
  ];
}
