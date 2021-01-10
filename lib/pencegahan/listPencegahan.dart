import 'package:flutter/material.dart';
import 'package:frontend/pencegahan/itemPencegahan.dart';

class ListPencegahan extends StatefulWidget {
  final String bencana;

  ListPencegahan({this.bencana});

  @override
  _ListPencegahanState createState() => _ListPencegahanState();
}

class _ListPencegahanState extends State<ListPencegahan> {
  var menu = 'pra';

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
                    Row(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.33333,
                          child: FlatButton(
                              height: 60,
                              color: menu == 'pra' ? Colors.blueAccent : null,
                              textColor:
                                  menu == 'pra' ? Colors.white : Colors.black87,
                              onPressed: () {
                                setState(() {
                                  menu = 'pra';
                                });
                              },
                              child: Text(
                                'Pra\nBencana',
                                textAlign: TextAlign.center,
                              )),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.33333,
                          child: FlatButton(
                              height: 60,
                              color: menu == 'saat' ? Colors.blueAccent : null,
                              textColor: menu == 'saat'
                                  ? Colors.white
                                  : Colors.black87,
                              onPressed: () {
                                setState(() {
                                  menu = 'saat';
                                });
                              },
                              child: Text(
                                'Saat\nBencana',
                                textAlign: TextAlign.center,
                              )),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.33333,
                          child: FlatButton(
                              height: 60,
                              color: menu == 'pasca' ? Colors.blueAccent : null,
                              textColor: menu == 'pasca'
                                  ? Colors.white
                                  : Colors.black87,
                              onPressed: () {
                                setState(() {
                                  menu = 'pasca';
                                });
                              },
                              child: Text(
                                'Pasca\nBencana',
                                textAlign: TextAlign.center,
                              )),
                        ),
                      ],
                    ),
                    ItemPencegahan(widget.bencana, menu)
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
