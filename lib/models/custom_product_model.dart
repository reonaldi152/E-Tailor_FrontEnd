class KostumProdukModel {
  final String lingkarDada;
  final String panjangMuka;
  final String lebarMuka;
  final String lebarBahu;
  final String lingkarPinggang;
  final String lingkarPinggul;
  final String lingkarKetiak;
  final String lingkarTangan;

  KostumProdukModel({
    required this.lingkarDada,
    required this.panjangMuka,
    required this.lebarMuka,
    required this.lebarBahu,
    required this.lingkarPinggang,
    required this.lingkarPinggul,
    required this.lingkarKetiak,
    required this.lingkarTangan,
  });

  Map<String, dynamic> toJson() {
    return {
      "lingkar_dada": lingkarDada,
      "panjang_muka": panjangMuka,
      "lebar_muka": lebarMuka,
      "lebar_bahu": lebarBahu,
      "lingkar_pinggang": lingkarPinggang,
      "lingkar_pinggul": lingkarPinggul,
      "lingkar_ketiak": lingkarKetiak,
      "lingkar_tangan": lingkarTangan,
    };
  }
}
