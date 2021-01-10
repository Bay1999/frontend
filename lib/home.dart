import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/api/api_login.dart';
import 'package:frontend/galeri.dart';
import 'package:frontend/login.dart';
import 'package:frontend/user.dart';
import 'package:frontend/dataBencana/bencana.dart';
import 'package:frontend/pengaduan/menuPengaduan.dart';
import 'package:frontend/kuis/kuis.dart';
import 'package:frontend/pencegahan/menuPencegah.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isLoading = false;
  var token, nama, icon;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Belajar Mitigasi Bencana"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              _showMyDialog();
            },
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        // color: Colors.black12,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              child: Row(
                children: <Widget>[
                  //menu1
                  Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Center(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 20,
                          ),
                          child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              color: Colors.white,
                              elevation: 5,
                              shadowColor: Color.fromARGB(100, 0, 0, 0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        //mengirim parameter id
                                        builder: (context) => MenuPengaduan()),
                                  );
                                },
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 40),
                                      child: Image.asset(
                                        'assets/images/plant.png',
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.1,
                                      ),
                                    ),
                                    Container(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Pengaduan',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      )),
                  //menu2
                  Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Center(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 20,
                          ),
                          child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              color: Colors.white,
                              elevation: 5,
                              shadowColor: Color.fromARGB(100, 0, 0, 0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        //mengirim parameter id
                                        builder: (context) => DataBencana()),
                                  );
                                },
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 40),
                                      child: Image.asset(
                                        'assets/images/plant.png',
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.1,
                                      ),
                                    ),
                                    Container(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Data Bencana',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      )),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              child: Row(
                children: <Widget>[
                  //menu1
                  Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Center(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 20,
                          ),
                          child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              color: Colors.white,
                              elevation: 5,
                              shadowColor: Color.fromARGB(100, 0, 0, 0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        //mengirim parameter id
                                        builder: (context) => Galeri()),
                                  );
                                },
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 40),
                                      child: Image.asset(
                                        'assets/images/plant.png',
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.1,
                                      ),
                                    ),
                                    Container(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Galeri',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      )),
                  //menu2
                  Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Center(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 20,
                          ),
                          child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              color: Colors.white,
                              elevation: 5,
                              shadowColor: Color.fromARGB(100, 0, 0, 0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        //mengirim parameter id
                                        builder: (context) => User()),
                                  );
                                },
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 40),
                                      child: Image.asset(
                                        'assets/images/plant.png',
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.1,
                                      ),
                                    ),
                                    Container(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'User',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      )),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              child: Row(
                children: <Widget>[
                  //menu1
                  Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Center(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 20,
                          ),
                          child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              color: Colors.white,
                              elevation: 5,
                              shadowColor: Color.fromARGB(100, 0, 0, 0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        //mengirim parameter id
                                        builder: (context) => Kuis()),
                                  );
                                },
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 40),
                                      child: Image.asset(
                                        'assets/images/plant.png',
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.1,
                                      ),
                                    ),
                                    Container(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Kuis',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      )),
                  //menu2
                  Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Center(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 20,
                          ),
                          child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              color: Colors.white,
                              elevation: 5,
                              shadowColor: Color.fromARGB(100, 0, 0, 0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        //mengirim parameter id
                                        builder: (context) => MenuPencegahan()),
                                  );
                                },
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 40),
                                      child: Image.asset(
                                        'assets/images/plant.png',
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.1,
                                      ),
                                    ),
                                    Container(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Pencegahan',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Apakah Anda Yakin?"),
          content:
              new Text("Setelah Log Out Anda Akan diarahkan Ke Form Login"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("Log Out"),
              onPressed: () {
                Navigator.of(context).pop();
                logout();
              },
            ),
          ],
        );
      },
    );
  }

  void logout() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.remove('id');
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
