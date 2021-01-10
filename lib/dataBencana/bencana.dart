import 'package:flutter/material.dart';
import 'package:frontend/dataBencana/dataBencana.dart';

class DataBencana extends StatefulWidget {
  @override
  _DataBencanaState createState() => _DataBencanaState();
}

class _DataBencanaState extends State<DataBencana> {
  var menu = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Bencana"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20),
              alignment: Alignment.center,
              child: Text(
                'Data Bencana',
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
                                'Data',
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
                                'Visualisasi Potensi\nBencana',
                                textAlign: TextAlign.center,
                              )),
                        ),
                      ],
                    ),
                    // Bencana()
                    if (menu == 1) Banjir(),
                    if (menu == 1) Kekeringan(),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
