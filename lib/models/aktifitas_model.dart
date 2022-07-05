class AktifitasModel {
  String id;
  String nama;
  String harga_min;
  String harga_max;
  String desc;

  //BUAT CONSTRUCTOR AGAR KETIKA CLASS INI DILOAD, MAKA DATA YANG DIMINTA HARUS DIPASSING SESUAI TIPE DATA YANG DITETAPKAN
  AktifitasModel({
    this.id = '',
    this.nama = '',
    this.harga_min = '',
    this.harga_max = '',
    this.desc = '',
  });

  //FUNGSI INI UNTUK MENGUBAH FORMAT DATA DARI JSON KE FORMAT YANG SESUAI DENGAN MODEL
  factory AktifitasModel.fromJson(Map<String, dynamic> json) => AktifitasModel(
        id: json["aktifitas_id"].toString(),
        nama: json["aktifitas_nama"],
        harga_min: json["aktifitas_harga_min"],
        harga_max: json["aktifitas_harga_max"],
        desc: json["aktifitas_deskripsi"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'nama': nama,
        'harga_min': harga_min,
        'harga_max': harga_max,
        'desc': desc,
      };
}
