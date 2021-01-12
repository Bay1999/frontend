import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' show Client;
import 'package:shared_preferences/shared_preferences.dart';

class Data {
  int id;
  String namagaleri;
  String keterangan;
  String gambar;

  Data({this.id, this.namagaleri, this.keterangan, this.gambar});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        id: json['id'],
        namagaleri: json['namagaleri'],
        keterangan: json['keterangan'],
        gambar: json['gambar']);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "namagaleri": namagaleri,
      "keterangan": keterangan,
      "gambar": gambar,
    };
  }

  @override
  String toString() {
    return 'Data';
  }
}

List<Data> profileFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Data>.from(data.map((item) => Data.fromJson(item)));
}

String profileToJson(Data data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}

class GetFoto {
  Client client = Client();
  setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  Future<List<Data>> getFoto(data) async {
    print(jsonEncode(data));
    final response = await client.post(
        "https://mitigasi-bencana-api.herokuapp.com/api/apps/galeri",
        body: jsonEncode(data),
        headers: setHeaders());
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return profileFromJson(response.body);
    } else {
      return null;
    }
  }
}
