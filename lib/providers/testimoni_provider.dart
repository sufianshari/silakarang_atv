import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:silakarang_atv/api/api_util.dart';
import 'package:silakarang_atv/models/testimoni_model.dart';

class TestimoniProvider {
  static Future<List<TestimoniModel>> getTestimoni(
      {required String idTestimoni}) async {
    final url =
        ApiUtil.BASE_URL_API + 'list-testimoni.php?aktifitas_id=' + idTestimoni;
    var headers = {
      'Content-Type': 'application/json',
    };
    final response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      final List testimonies = json.decode(response.body)['testimoni'];

      print(response);

      return testimonies.map((json) => TestimoniModel.fromJson(json)).toList();
    } else {
      // print(response);
      throw Exception();
    }
  }

  static Future<TestimoniModel> sendTestimoni(
      {required String id,
      required String nama,
      required String email,
      required String deskripsi}) async {
    String url = ApiUtil.BASE_URL_API + 'add-testimoni.php';

    final apiResult = await http.post(Uri.parse(url), body: {
      'aktifitas_id': id,
      'nama': nama,
      'email': email,
      'deskripsi': deskripsi,
    });

    /*  if (apiResult.statusCode != 200) {
      return null;
    } */
    //LAKUKAN PENGECEKAN, JIKA STATUSNYA 200 DAN BERHASIL
    if (apiResult.statusCode == 200) {
      var jsonObject = json.decode(apiResult.body);
      var resultData = (jsonObject as Map<String, dynamic>)['data'];
      return TestimoniModel.fromJson(resultData);
    } else {
      throw Exception();
    }
  }
}
