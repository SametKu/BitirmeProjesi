class Yemekler {
  String yemek_id;
  String yemek_adi;
  String yemek_resim_adi;
  String yemek_fiyat;

  Yemekler(
      {required this.yemek_id,
      required this.yemek_adi,
      required this.yemek_resim_adi,
      required this.yemek_fiyat});
  /*
  Yemekler.fromJson(Map<String, dynamic> json)
      : yemek_id = json['yemek_id'],
        yemek_adi = json['yemek_adi'],
        yemek_resim_adi = json['yemek_resim_adi'],
        yemek_fiyat = json['yemek_fiyat'];

  Map<String, dynamic> toJson() => {
        'yemek_id': yemek_id,
        'yemek_adi': yemek_adi,
        'yemek_resim_adi': yemek_resim_adi,
        'yemek_fiyat': yemek_fiyat
      };

    */
  factory Yemekler.fromJson(Map<String, dynamic> json) {
    return Yemekler(
        yemek_id: json["yemek_id"] as String,
        yemek_adi: json["yemek_adi"] as String,
        yemek_resim_adi: json["yemek_resim_adi"] as String,
        yemek_fiyat: json["yemek_fiyat"] as String);
  }
}
