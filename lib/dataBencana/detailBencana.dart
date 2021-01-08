import 'package:flutter/material.dart';

class DetailBencana extends StatefulWidget {
  final String lokasi;
  final String korban;
  final String kerugian;
  final String tanggal;
  final String durasi;
  final String kecamatan;
  final String mitigasi;
  final String bencana;

  DetailBencana(
      {this.lokasi,
      this.korban,
      this.kerugian,
      this.tanggal,
      this.durasi,
      this.kecamatan,
      this.mitigasi,
      this.bencana});

  @override
  _DetailBencanaState createState() => _DetailBencanaState();
}

class _DetailBencanaState extends State<DetailBencana> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Belajar Mitigasi Bencana"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
              alignment: Alignment.center,
              child: Text(
                'Data Bencana ' + widget.bencana,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(180, 0, 0, 0),
                    decoration: TextDecoration.none),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Colors.white,
              elevation: 5,
              shadowColor: Color.fromARGB(100, 0, 0, 0),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                      alignment: Alignment.center,
                      child: Text(
                        'Detail Bencana',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(180, 0, 0, 0),
                            decoration: TextDecoration.none),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text('Lokasi \t : ' + widget.lokasi,
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(180, 0, 0, 0),
                              decoration: TextDecoration.none)),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text('Korban \t : ' + widget.korban,
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(180, 0, 0, 0),
                              decoration: TextDecoration.none)),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text('Kerugian \t : ' + widget.kerugian,
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(180, 0, 0, 0),
                              decoration: TextDecoration.none)),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text('Tanggal \t : ' + widget.tanggal,
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(180, 0, 0, 0),
                              decoration: TextDecoration.none)),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text('Durasi \t : ' + widget.durasi,
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(180, 0, 0, 0),
                              decoration: TextDecoration.none)),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text('Kecamatan \t : ' + widget.kecamatan,
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(180, 0, 0, 0),
                              decoration: TextDecoration.none)),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      child: Text('Cara Mitigasi \t :',
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(180, 0, 0, 0),
                              decoration: TextDecoration.none)),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text(widget.mitigasi,
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(180, 0, 0, 0),
                              decoration: TextDecoration.none)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
