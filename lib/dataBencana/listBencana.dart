import 'package:flutter/material.dart';
import '../model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'detailBencana.dart';

class ListBencana extends StatefulWidget {
  final String bencana;
  final String kecamatan;

  ListBencana({this.bencana, this.kecamatan});

  @override
  _ListBencanaState createState() => _ListBencanaState();
}

class _ListBencanaState extends State<ListBencana> {
  Future<List<Bencana>> getList() async {
    final http.Response response = await http.post(
      'http://dlibrary.manganoid.com/api/data-kecamatan',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'bencana': widget.bencana,
        'kec': widget.kecamatan,
      }),
    );
    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((job) => new Bencana.fromJson(job)).toList();
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.kecamatan),
        ),
        body: Container(
          // height: 1000,
          margin: EdgeInsets.fromLTRB(30, 15, 30, 0),
          child: FutureBuilder<List<Bencana>>(
              future: getList(),
              builder: (context, bencana) {
                if (bencana.hasData) {
                  return ListView.separated(
                      itemBuilder: (BuildContext context, int i) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailBencana(
                                        lokasi: bencana.data[i].lokasi,
                                        korban: bencana.data[i].korbanbencana,
                                        kerugian:
                                            bencana.data[i].kerugianbencana,
                                        tanggal: bencana.data[i].tanggal,
                                        durasi: bencana.data[i].durasibencana,
                                        kecamatan: bencana.data[i].kecamatan,
                                        mitigasi: bencana.data[i].caramitigasi,
                                        bencana: widget.bencana,
                                      )),
                            );
                          },
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: ListTile(
                              title: Text(
                                  bencana.data[i].namabencana != null
                                      ? bencana.data[i].namabencana
                                      : 'kosong',
                                  style: TextStyle(fontSize: 14)),
                              subtitle: Text(
                                  bencana.data[i].lokasi != null
                                      ? bencana.data[i].lokasi
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
                      itemCount: bencana.data.length);
                } else if (bencana.hasError) {
                  return Text("${bencana.error}");
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ));
  }
}
