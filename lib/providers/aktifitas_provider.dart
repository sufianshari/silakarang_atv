import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:silakarang_atv/api/api_util.dart';
import 'package:silakarang_atv/models/aktifitas_model.dart';

class AktifitasProvider {
  static Future<List<AktifitasModel>> getAktifitas(String query) async {
    const url = ApiUtil.BASE_URL_API + 'list-activity.php';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List Aktifitass = json.decode(response.body)['aktifitas'];

      return Aktifitass.map((json) => AktifitasModel.fromJson(json))
          .where((Aktifitas) {
        final titleLower = Aktifitas.nama.toLowerCase();
        final searchLower = query.toLowerCase();

        return titleLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
