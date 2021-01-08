import 'package:flutter/material.dart';
import 'package:frontend/pencegahan/dataBencana.dart';

class MenuPencegahan extends StatefulWidget {
  @override
  _MenuPencegahanState createState() => _MenuPencegahanState();
}

class _MenuPencegahanState extends State<MenuPencegahan> {
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
                'Pencegahan Bencana',
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
                  children: <Widget>[Banjir(), Kekeringan()],
                )),
          ],
        ),
      ),
    );
  }
}
