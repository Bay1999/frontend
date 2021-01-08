import 'package:flutter/material.dart';
import 'package:frontend/model.dart';
import 'package:frontend/pengaduan/detailPencegahan.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ItemPencegahan extends StatelessWidget {
  final String bencana;
  final String time;

  ItemPencegahan(this.bencana, this.time);

  Future<List<Pencegahan>> getList() async {
    final http.Response response = await http.post(
      'http://dlibrary.manganoid.com/api/pencegahan',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'bencana': bencana,
        'time': time,
      }),
    );
    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((job) => new Pencegahan.fromJson(job)).toList();
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
      child: FutureBuilder<List<Pencegahan>>(
          future: getList(),
          builder: (context, pencegahan) {
            if (pencegahan.hasData) {
              return ListView.separated(
                  itemBuilder: (BuildContext context, int i) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              //mengirim parameter id
                              builder: (context) => DetailPencegahan(
                                  bencana: bencana,
                                  gambar: pencegahan.data[i].gambar,
                                  keterangan: pencegahan.data[i].keterangan)),
                        );
                      },
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: ListTile(
                          title: Text(
                              pencegahan.data[i].namasopbencana != null
                                  ? pencegahan.data[i].namasopbencana
                                  : 'kosong',
                              style: TextStyle(fontSize: 14)),
                          // subtitle: Text(
                          //     pencegahan.data[i].pengaduan != null
                          //         ? pengaduan.data[i].pengaduan
                          //         : 'kosong',
                          //     style: TextStyle(fontSize: 12)),
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
                  itemCount: pencegahan.data.length);
            } else if (pencegahan.hasError) {
              return Text("${pencegahan.error}");
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
