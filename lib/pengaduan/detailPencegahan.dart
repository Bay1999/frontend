import 'package:flutter/material.dart';

class DetailPencegahan extends StatefulWidget {
  final String bencana;
  final String gambar;
  final String keterangan;

  DetailPencegahan({this.bencana, this.gambar, this.keterangan});

  @override
  _DetailPencegahanState createState() => _DetailPencegahanState();
}

class _DetailPencegahanState extends State<DetailPencegahan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Belajar Mitigasi Bencana"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20),
              alignment: Alignment.center,
              child: Text(
                'Pencegahan Bencana ' + widget.bencana,
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
                    Image.network(
                      'http://dlibrary.manganoid.com/images/sop/' +
                          widget.gambar,
                      // fit: BoxFit.cover,
                      // height: MediaQuery.of(context).size.height * 0.09,

                      width: MediaQuery.of(context).size.width * 0.8,
                    ),
                    // Container(
                    //   margin: EdgeInsets.only(top: 20),
                    //   child: Text(
                    //     widget.keterangan,
                    //     textAlign: TextAlign.center,
                    //   ),
                    // )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
