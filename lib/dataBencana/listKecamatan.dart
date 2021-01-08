import 'package:flutter/material.dart';
import 'package:frontend/model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'listBencana.dart';

class ListKecamatan extends StatefulWidget {
  final String bencana;

  ListKecamatan({@required this.bencana});

  @override
  List_KecamatanState createState() => List_KecamatanState();
}

class List_KecamatanState extends State<ListKecamatan> {
  Future<List<Kecamatan>> getList() async {
    // final response = await http
    //     .get('http://192.168.30.102:8000/api/listbuku/' + widget.id.toString());
    final response = await http
        .get('http://dlibrary.manganoid.com/api/data-' + widget.bencana);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((job) => new Kecamatan.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load Kategori');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.bencana),
        ),
        body: Container(
          // height: 1000,
          margin: EdgeInsets.fromLTRB(30, 15, 30, 0),
          child: FutureBuilder<List<Kecamatan>>(
              future: getList(),
              builder: (context, kecamatan) {
                if (kecamatan.hasData) {
                  return ListView.separated(
                      itemBuilder: (BuildContext context, int i) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ListBencana(
                                        bencana: widget.bencana,
                                        kecamatan: kecamatan.data[i].kecamatan,
                                      )),
                            );
                          },
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: ListTile(
                              title: Text(
                                  kecamatan.data[i].kecamatan != null
                                      ? kecamatan.data[i].kecamatan
                                      : 'kosong',
                                  style: TextStyle(fontSize: 14)),
                              contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 10),
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
                      itemCount: kecamatan.data.length);
                } else if (kecamatan.hasError) {
                  return Text("${kecamatan.error}");
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ));
  }
}
