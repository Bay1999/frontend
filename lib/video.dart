import 'package:flutter/material.dart';
import 'package:frontend/gallery/fotobanjir.dart';
import 'package:frontend/gallery/fotokekeringan.dart';
import 'package:frontend/gallery/videobanjir.dart';
import 'package:frontend/gallery/videokekeringan.dart';
import 'package:frontend/pengaduan/pengaduan.dart';

class Video extends StatefulWidget {
  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video"),
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
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  //mengirim parameter id
                                  builder: (context) => VideoBanjir()),
                            );
                          },
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 40),
                                child: Image.asset(
                                  'assets/images/banjir.png',
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
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  //mengirim parameter id
                                  builder: (context) => VideoKekeringan()),
                            );
                          },
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 40),
                                child: Image.asset(
                                  'assets/images/kekeringan.png',
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
