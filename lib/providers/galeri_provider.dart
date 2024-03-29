import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:silakarang_atv/api/api_util.dart';
import 'package:silakarang_atv/models/galeri_model.dart';

class GaleriProvider {
  static Future<List<GaleriModel>> getGaleri({required String idGaleri}) async {
    final url =
        ApiUtil.BASE_URL_API + 'list-galeri.php?aktifitas_id=' + idGaleri;
    var headers = {
      'Content-Type': 'application/json',
    };
    final response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      final List testimonies = json.decode(response.body)['testimoni'];

      print(response);

      return testimonies.map((json) => GaleriModel.fromJson(json)).toList();
    } else {
      // print(response);
      throw Exception();
    }
  }
}
