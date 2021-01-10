import 'dart:io';

import 'package:dio/dio.dart';

class ServiceProfile {
  List data;
  Future<int> submitSubscription(
      {File file,
      Uri filename,
      String id_user,
      String judul,
      String pengaduan,
      String tempat}) async {
    final StringBuffer url = new StringBuffer(
        "https://mitigasi-bencana-api.herokuapp.com/api/apps/addPengaduan");

    Dio dio = new Dio();
    try {
      FormData formData = FormData.fromMap(
        {
          "foto": await MultipartFile.fromFile(file.path),
          "id_user": id_user,
          "judul": judul,
          "pengaduan": pengaduan,
          "tempat": tempat,
        },
      );
      print(formData.fields);
      print(formData.files);
      var response = await dio.post(
        url.toString(),
        data: formData,
      );
      print(response.statusMessage);
      return 1;
    } on DioError catch (e) {
      print(e);
    }
  }
}
