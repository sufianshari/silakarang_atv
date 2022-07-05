class TestimoniModel {
  String id;
  String nama;
  String email;
  String deskripsi;
  String tanggal;
  String aktifitasid;

  //BUAT CONSTRUCTOR AGAR KETIKA CLASS INI DILOAD, MAKA DATA YANG DIMINTA HARUS DIPASSING SESUAI TIPE DATA YANG DITETAPKAN
  TestimoniModel({
    this.id = '',
    this.nama = '',
    this.email = '',
    this.deskripsi = '',
    this.tanggal = '',
    this.aktifitasid = '',
  });

  //FUNGSI INI UNTUK MENGUBAH FORMAT DATA DARI JSON KE FORMAT YANG SESUAI DENGAN MODEL
  factory TestimoniModel.fromJson(Map<String, dynamic> json) => TestimoniModel(
        id: json["testimoni_id"].toString(),
        nama: json["testimoni_nama"],
        email: json["testimoni_email"],
        deskripsi: json["testimoni_deskripsi"],
        tanggal: json["testimoni_tgl"],
        aktifitasid: json["aktifitas_id"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'nama': nama,
        'email': email,
        'deskripsi': deskripsi,
        'tanggal': tanggal,
        'aktifitas_id': aktifitasid,
      };
}
