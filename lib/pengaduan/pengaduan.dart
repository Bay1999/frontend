import 'package:flutter/material.dart';
import 'package:frontend/home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:frontend/model.dart';

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

  Future<List<DataPengaduan>> getList() async {
    // final response = await http
    //     .get('http://192.168.30.102:8000/api/listbuku/' + widget.id.toString());
    final response =
        await http.get('http://dlibrary.manganoid.com/api/get-pengaduan');
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((job) => new DataPengaduan.fromJson(job))
          .toList();
    } else {
      throw Exception('Failed to load Kategori');
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
                    return InkWell(
                      onTap: () {},
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: ListTile(
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
