import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:silakarang_atv/api/api_util.dart';
import 'package:silakarang_atv/models/aktifitas_model.dart';

class AktifitasProvider extends ChangeNotifier {
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

  static Future<AktifitasModel> sendAktivityAdd(
      {required String nama,
      required String hargamin,
      required String hargamax,
      required String deskripsi}) async {
    String url = ApiUtil.BASE_URL_API + 'activity-add.php';

    final apiResult = await http.post(Uri.parse(url), body: {
      'nama': nama,
      'harga_min': hargamin,
      'harga_max': hargamax,
      'deskripsi': deskripsi,
    });

    /*  if (apiResult.statusCode != 200) {
      return null;
    } */
    //LAKUKAN PENGECEKAN, JIKA STATUSNYA 200 DAN BERHASIL
    if (apiResult.statusCode == 200) {
      var jsonObject = json.decode(apiResult.body);
      var resultData = (jsonObject as Map<String, dynamic>)['data'];
      return AktifitasModel.fromJson(resultData);
    } else {
      throw Exception();
    }
  }

  static Future<AktifitasModel> sendAktivityEdit(
      {required String id,
      required String nama,
      required String hargamin,
      required String hargamax,
      required String deskripsi}) async {
    String url = ApiUtil.BASE_URL_API + 'activity-edit.php';

    final apiResult = await http.post(Uri.parse(url), body: {
      'id': id,
      'nama': nama,
      'harga_min': hargamin,
      'harga_max': hargamax,
      'deskripsi': deskripsi,
    });

    /*  if (apiResult.statusCode != 200) {
      return null;
    } */
    //LAKUKAN PENGECEKAN, JIKA STATUSNYA 200 DAN BERHASIL
    if (apiResult.statusCode == 200) {
      var jsonObject = json.decode(apiResult.body);
      var resultData = (jsonObject as Map<String, dynamic>)['data'];
      return AktifitasModel.fromJson(resultData);
    } else {
      throw Exception();
    }
  }
}
