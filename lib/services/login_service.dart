import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:silakarang_atv/api/api_util.dart';
import 'package:silakarang_atv/models/user_model.dart';

class LoginService {
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    var url = ApiUtil.BASE_URL_API + 'login-admin.php';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data);
      print(data);

      //simpan di local DB
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('nama', data['nama']);
      localStorage.setString('email', data['email']);
      localStorage.setString('phone', data['phone']);
      localStorage.setString('aktif', data['aktif']);

      return user;
    } else {
      print('Gagal Disini');
      throw Exception('Gagal Login');
    }
  }
}
