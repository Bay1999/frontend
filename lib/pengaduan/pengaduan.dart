import 'package:flutter/material.dart';
import 'package:frontend/home.dart';
import 'package:frontend/pengaduan/detailPengaduan.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:frontend/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _formKey = GlobalKey<FormState>();
var isLoading = false;

class Pengaduan extends StatelessWidget {
  // void _submit() {
  //   final isValid = _formKey.currentState.validate();
  //   if (!isValid) {
  //     return;
  //   }
  //   _formKey.currentState.save();
  // }

  final judulController = TextEditingController();
  final pengaduanController = TextEditingController();
  final lokasiController = TextEditingController();
  String token;

  // Future<List<DataPengaduan>> getList() async {
  //   // final response = await http
  //   //     .get('http://192.168.30.102:8000/api/listbuku/' + widget.id.toString());
  //   final response =
  //       await http.get('http://dlibrary.manganoid.com/api/get-pengaduan');
  //   if (response.statusCode == 200) {
  //     List jsonResponse = json.decode(response.body);
  //     return jsonResponse
  //         .map((job) => new DataPengaduan.fromJson(job))
  //         .toList();
  //   } else {
  //     throw Exception('Failed to load Kategori');
  //   }
  // }

  Future<List<DataPengaduan>> getList() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('id');
    print(token);
    final http.Response response = await http.post(
      'https://mitigasi-bencana-api.herokuapp.com/api/apps/pengaduan',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'id_user': token,
      }),
    );
    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((job) => new DataPengaduan.fromJson(job))
          .toList();
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      margin: EdgeInsets.fromLTRB(30, 15, 30, 0),
      child: FutureBuilder<List<DataPengaduan>>(
          future: getList(),
          builder: (context, pengaduan) {
            if (pengaduan.hasData) {
              return ListView.separated(
                  itemBuilder: (BuildContext context, int i) {
                    return Align(
                      alignment: Alignment.topCenter,
                      child: ListTile(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       //mengirim parameter id
                          //       builder: (context) => DetailPengaduan(
                          //           // judul: pengaduan.data[i].judul,
                          //           // pengaduan: pengaduan.data[i].pengaduan,
                          //           // lokasi: pengaduan.data[i].lokasi,
                          //           // foto: pengaduan.data[i].foto,
                          //           )),
                          // );
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailPengaduan(
                                        foto: pengaduan.data[i].foto,
                                        judul: pengaduan.data[i].judul,
                                        pengaduan: pengaduan.data[i].pengaduan,
                                        tempat: pengaduan.data[i].tempat,
                                      )));
                        },
                        title: Text(
                            pengaduan.data[i].judul != null
                                ? pengaduan.data[i].judul
                                : 'kosong',
                            style: TextStyle(fontSize: 14)),
                        subtitle: Text(
                            pengaduan.data[i].pengaduan != null
                                ? pengaduan.data[i].pengaduan
                                : 'kosong',
                            style: TextStyle(fontSize: 12)),
                        contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int i) {
                    return Divider(
                      thickness: 0.5,
                      color: Colors.grey,
                    );
                  },
                  itemCount: pengaduan.data.length);
            } else if (pengaduan.hasError) {
              return Text("${pengaduan.error}");
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
