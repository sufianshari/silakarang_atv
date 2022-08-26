class UserModel {
  int id;
  String nama;
  String email;
  String phone;
  String aktif;

  UserModel({
    required this.id,
    required this.nama,
    required this.email,
    required this.phone,
    required this.aktif,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      nama: json['nama'].toString(),
      email: json['email'].toString(),
      phone: json['phone'].toString(),
      aktif: json['aktif'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'email': email,
      'phone': phone,
      'aktif': aktif,
    };
  }
}
