import 'package:flutter/material.dart';
import 'package:frontend/home.dart';

class ResultPage extends StatefulWidget {
  final String nilai;

  ResultPage({this.nilai});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Text(
                'Nilai Kamu\n' + widget.nilai,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
              ),
            ),
            FlatButton(
              color: Colors.blueAccent,
              onPressed: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        //mengirim parameter id
                        builder: (context) => Home()),
                  );
                });
              },
              child: Text(
                'Kembali Ke Halaman Utama',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
