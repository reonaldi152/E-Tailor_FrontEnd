class KostumProduk {
  final int id;
  final double lingkarDada;
  final double panjangMuka;
  final double lebarMuka;
  final double lebarBahu;
  final double lingkarPinggang;
  final double lingkarPinggul;
  final double lingkarKetiak;
  final double lingkarTangan;

  KostumProduk({
    required this.id,
    required this.lingkarDada,
    required this.panjangMuka,
    required this.lebarMuka,
    required this.lebarBahu,
    required this.lingkarPinggang,
    required this.lingkarPinggul,
    required this.lingkarKetiak,
    required this.lingkarTangan,
  });

  factory KostumProduk.fromJson(Map<String, dynamic> json) {
    return KostumProduk(
      id: json['id'],
      lingkarDada: json['lingkar_dada'].toDouble(),
      panjangMuka: json['panjang_muka'].toDouble(),
      lebarMuka: json['lebar_muka'].toDouble(),
      lebarBahu: json['lebar_bahu'].toDouble(),
      lingkarPinggang: json['lingkar_pinggang'].toDouble(),
      lingkarPinggul: json['lingkar_pinggul'].toDouble(),
      lingkarKetiak: json['lingkar_ketiak'].toDouble(),
      lingkarTangan: json['lingkar_tangan'].toDouble(),
    );
  }
}
