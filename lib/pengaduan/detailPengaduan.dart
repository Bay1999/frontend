import 'package:flutter/material.dart';

class DetailPengaduan extends StatefulWidget {
  final String judul;
  final String pengaduan;
  final String tempat;
  final String foto;

  DetailPengaduan({this.tempat, this.judul, this.pengaduan, this.foto});

  @override
  _DetailPengaduanState createState() => _DetailPengaduanState();
}

class _DetailPengaduanState extends State<DetailPengaduan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Pengaduan"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
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
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(bottom: 20),
                      child: Image.network(
                        widget.foto,
                        // fit: BoxFit.cover,
                        // height: MediaQuery.of(context).size.height * 0.09,

                        width: MediaQuery.of(context).size.width * 0.8,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text(
                          widget.judul != null
                              ? 'Judul \t : ' + widget.judul
                              : 'kosong',
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(180, 0, 0, 0),
                              decoration: TextDecoration.none)),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text(
                          widget.pengaduan != null
                              ? 'Pengaduan :\n ' + widget.pengaduan
                              : 'kosong',
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(180, 0, 0, 0),
                              decoration: TextDecoration.none)),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text(
                          widget.tempat != null
                              ? 'Lokasi \t : ' + widget.tempat
                              : 'kosong',
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
