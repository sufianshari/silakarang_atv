class GaleriModel {
  String id;
  String nama;
  String foto;
  String aktifitasid;

  //BUAT CONSTRUCTOR AGAR KETIKA CLASS INI DILOAD, MAKA DATA YANG DIMINTA HARUS DIPASSING SESUAI TIPE DATA YANG DITETAPKAN
  GaleriModel({
    this.id = '',
    this.nama = '',
    this.foto = '',
    this.aktifitasid = '',
  });

  //FUNGSI INI UNTUK MENGUBAH FORMAT DATA DARI JSON KE FORMAT YANG SESUAI DENGAN MODEL
  factory GaleriModel.fromJson(Map<String, dynamic> json) => GaleriModel(
        id: json["galeri_id"].toString(),
        nama: json["galeri_nama"],
        foto: json["galeri_foto"],
        aktifitasid: json["aktifitas_id"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'nama': nama,
        'foto': foto,
        'aktifitas_id': aktifitasid,
      };
}
