import 'package:flutter/material.dart';
import 'package:frontend/kuis/soal.dart';
import 'package:frontend/home.dart';
import 'package:http/http.dart' as http;
import 'package:frontend/model.dart';
import 'dart:convert';
import 'package:frontend/kuis/resultpage.dart';

class Kuis extends StatefulWidget {
  @override
  _KuisState createState() => _KuisState();
}

class _KuisState extends State<Kuis> {
  // var soal = ['ini adalah soal', 'ini soal 2'];
  var nomer;
  var jmlSoal;
  var nilai = 0;

  _soalLanjut(jawaban, benar) {
    if (jawaban == benar) {
      nilai += 10;
    }

    if (nomer == null) {
      setState(() {
        nomer = 1;
      });
    } else {
      if (jmlSoal > nomer + 1) {
        nomer += 1;
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
              //mengirim parameter id
              builder: (context) => ResultPage(nilai: nilai.toString())),
        );
      }
    }
  }

  Future<List<SoalKuis>> getList() async {
    // final response = await http
    //     .get('http://192.168.30.102:8000/api/listbuku/' + widget.id.toString());
    final response = await http.get('http://192.168.43.2:8000/api/kuis');
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((job) => new SoalKuis.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load Kategori');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _soalLanjut();
    getList().then((value) => setState(() {
          jmlSoal = value.length;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: EdgeInsets.fromLTRB(20, 100, 20, 10),
          child: FutureBuilder<List<SoalKuis>>(
              future: getList(),
              builder: (context, soal) {
                if (soal.hasData) {
                  return Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 30),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.white,
                            elevation: 5,
                            shadowColor: Color.fromARGB(100, 0, 0, 0),
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 30, horizontal: 10),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text(soal.data[0].soal),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _soalLanjut(
                                  soal.data[0].pila, soal.data[0].jawaban);
                              print('Jumlah soal : ' + jmlSoal.toString());
                              print(nomer + 1);
                            });
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.white,
                            elevation: 5,
                            shadowColor: Color.fromARGB(100, 0, 0, 0),
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 10),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text('A. ' + soal.data[0].pila),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _soalLanjut(
                                  soal.data[0].pila, soal.data[0].jawaban);
                              print('Jumlah soal : ' + jmlSoal.toString());
                              print(nomer + 1);
                            });
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.white,
                            elevation: 5,
                            shadowColor: Color.fromARGB(100, 0, 0, 0),
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 10),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text('B. ' + soal.data[0].pilb),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _soalLanjut(
                                  soal.data[0].pilc, soal.data[0].jawaban);
                              print('Jumlah soal : ' + jmlSoal.toString());
                              print(nomer + 1);
                            });
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.white,
                            elevation: 5,
                            shadowColor: Color.fromARGB(100, 0, 0, 0),
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 10),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text('C. ' + soal.data[0].pilc),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _soalLanjut(
                                  soal.data[0].pild, soal.data[0].jawaban);
                              print('Jumlah soal : ' + jmlSoal.toString());
                              print(nomer + 1);
                            });
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.white,
                            elevation: 5,
                            shadowColor: Color.fromARGB(100, 0, 0, 0),
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 10),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text('D. ' + soal.data[0].pild),
                            ),
                          ),
                        ),

                        // if (soal.length > nomer + 1)
                        // FlatButton(
                        //   color: Colors.blueAccent,
                        //   onPressed: () {
                        //     setState(() {
                        //       _soalLanjut();
                        //       print('Jumlah soal : ' + jmlSoal.toString());
                        //       print(nomer + 1);
                        //     });
                        //   },
                        //   child: Text('lanjut'),
                        // )
                      ],
                    ),
                  );
                } else if (soal.hasError) {
                  return Center(child: Text(soal.hasError.toString()));
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              })),
    );
  }
}
