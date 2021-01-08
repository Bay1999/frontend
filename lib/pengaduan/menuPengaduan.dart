import 'package:flutter/material.dart';
import 'package:frontend/pengaduan/pengaduan.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MenuPengaduan extends StatefulWidget {
  @override
  _MenuPengaduanState createState() => _MenuPengaduanState();
}

final _formKey = GlobalKey<FormState>();

class _MenuPengaduanState extends State<MenuPengaduan> {
  var menu = 1;

  final judulController = TextEditingController();
  final pengaduanController = TextEditingController();
  final lokasiController = TextEditingController();

  Future<String> sendPengaduan(
      String judul, String pengaduan, String lokasi) async {
    final response = await http.post(
      'http://dlibrary.manganoid.com/api/buat-pengaduan',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'judul': judul,
        'pengaduan': pengaduan,
        'lokasi': lokasi,
      }),
    );

    if (response.statusCode == 201) {
      print('berhasil connect');
    } else {
      print('gagal connect' + response.statusCode.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Belajar Mitigasi Bencana"),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20),
                alignment: Alignment.center,
                child: Text(
                  'Pengaduan',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(180, 0, 0, 0),
                      decoration: TextDecoration.none),
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 30),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: FlatButton(
                                height: 60,
                                color: menu == 1 ? Colors.blueAccent : null,
                                textColor:
                                    menu == 1 ? Colors.white : Colors.black87,
                                onPressed: () {
                                  setState(() {
                                    menu = 1;
                                  });
                                },
                                child: Text(
                                  'Pengaduan Baru',
                                  textAlign: TextAlign.center,
                                )),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: FlatButton(
                                height: 60,
                                color: menu == 2 ? Colors.blueAccent : null,
                                textColor:
                                    menu == 2 ? Colors.white : Colors.black87,
                                onPressed: () {
                                  setState(() {
                                    menu = 2;
                                  });
                                },
                                child: Text(
                                  'Daftar Pengaduan',
                                  textAlign: TextAlign.center,
                                )),
                          ),
                        ],
                      ),
                      // Bencana()
                      // if (menu == 1) Pengaduan(),
                      if (menu == 1)
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    color: Colors.white,
                                    elevation: 5,
                                    shadowColor: Color.fromARGB(100, 0, 0, 0),
                                    child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 20),
                                        child: Form(
                                          key: _formKey,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                margin:
                                                    EdgeInsets.only(bottom: 15),
                                                child: TextFormField(
                                                  controller: judulController,
                                                  decoration: InputDecoration(
                                                      labelText: 'Judul',
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              new BorderRadius
                                                                      .circular(
                                                                  5.0))),
                                                  keyboardType:
                                                      TextInputType.text,
                                                  onFieldSubmitted: (value) {
                                                    //Validator
                                                  },
                                                  validator: (value) {
                                                    if (value.isEmpty) {
                                                      return 'Masukan Judul!';
                                                    }
                                                    return null;
                                                  },
                                                ),
                                              ),

                                              //text input
                                              Container(
                                                margin:
                                                    EdgeInsets.only(bottom: 15),
                                                child: TextFormField(
                                                  controller:
                                                      pengaduanController,
                                                  maxLines: 4,
                                                  decoration: InputDecoration(
                                                      labelText: 'Pengaduan',
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              new BorderRadius
                                                                      .circular(
                                                                  5.0))),
                                                  keyboardType:
                                                      TextInputType.text,
                                                  onFieldSubmitted: (value) {},
                                                  validator: (value) {
                                                    if (value.isEmpty) {
                                                      return 'Masukan Pengaduan!';
                                                    }
                                                    return null;
                                                  },
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(bottom: 15),
                                                child: TextFormField(
                                                  controller: lokasiController,
                                                  maxLines: 4,
                                                  decoration: InputDecoration(
                                                      labelText: 'Lokasi',
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              new BorderRadius
                                                                      .circular(
                                                                  5.0))),
                                                  keyboardType:
                                                      TextInputType.text,
                                                  onFieldSubmitted: (value) {},
                                                  validator: (value) {
                                                    if (value.isEmpty) {
                                                      return 'Masukan Lokasi!';
                                                    }
                                                    return null;
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.1,
                                              ),
                                              RaisedButton(
                                                color: Colors.blue,
                                                onPressed: () {
                                                  if (_formKey.currentState
                                                      .validate()) {
                                                    sendPengaduan(
                                                        judulController.text,
                                                        pengaduanController
                                                            .text,
                                                        lokasiController.text);
                                                    print(judulController.text);
                                                    print(pengaduanController
                                                        .text);
                                                    print(
                                                        lokasiController.text);
                                                  }
                                                },
                                                textColor: Colors.white,
                                                padding: EdgeInsets.all(0.0),
                                                child: Container(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: const Text('Masukan'),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ))),
                              )
                            ],
                          ),
                        ),
                      if (menu == 2) Pengaduan()
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
