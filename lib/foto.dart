import 'package:flutter/material.dart';
import 'package:frontend/pengaduan/pengaduan.dart';

class Foto extends StatefulWidget {
  @override
  _FotoState createState() => _FotoState();
}

class _FotoState extends State<Foto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Belajar Mitigasi Bencana"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        // color: Colors.black12,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                // width: MediaQuery.of(context).size.width * 0.5,
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.2),
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
                          onTap: () {},
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 40),
                                child: Image.asset(
                                  'assets/images/plant.png',
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                ),
                              ),
                              Container(
                                margin: EdgeInsetsDirectional.only(bottom: 20),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Banjir',
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
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.2),
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
                          onTap: () {},
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 40),
                                child: Image.asset(
                                  'assets/images/plant.png',
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                ),
                              ),
                              Container(
                                margin: EdgeInsetsDirectional.only(bottom: 20),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Kekeringan',
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
    );
  }
}
