import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frontend/api/postPengaduan.dart';
import 'package:frontend/login.dart';
import 'package:frontend/pengaduan/pengaduan.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuPengaduan extends StatefulWidget {
  @override
  _MenuPengaduanState createState() => _MenuPengaduanState();
}

final _formKey = GlobalKey<FormState>();

class _MenuPengaduanState extends State<MenuPengaduan> {
  var menu = 1;
  Future<File> file;
  String status = '';
  var nama,
      email,
      no_hp,
      password,
      tgl_lahir,
      alamat,
      provinsi,
      kota,
      kecamatan;
  String _valProvince;
  String namaProvince;
  String nomorHp = '082264046359';
  var urlImage = 'images/add-image.png';
  String base64Image;
  File tmpFile;
  String errMessage = 'Error Uploading Image';
  final judulController = TextEditingController();
  final pengaduanController = TextEditingController();
  final lokasiController = TextEditingController();
  File selectedImage;
  Uri filename;
  String token;
  final _picker = ImagePicker();

  void _submit() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState.save();
  }

  @override
  void initState() {
    _checkIfLoggedIn();
    super.initState();
  }

  void _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('id');
    if (token == null) {
      Navigator.pushAndRemoveUntil(
          context,
          new MaterialPageRoute(builder: (context) => LoginPage()),
          (Route<dynamic> route) => false);
    }
  }

  Future<String> sendPengaduan(
      String judul, String pengaduan, String lokasi) async {
    final response = await http.post(
      'http://dlibrary.manganoid.com/api/buat-pengaduan',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'judul': judul,
        'pengaduan': pengaduan,
        'lokasi': lokasi,
      }),
    );

    if (response.statusCode == 201) {
      print('berhasil connect');
    } else {
      print('gagal connect' + response.statusCode.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Belajar Mitigasi Bencana"),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20),
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
                                  'Pengaduan Baru',
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
                                  'Daftar Pengaduan',
                                  textAlign: TextAlign.center,
                                )),
                          ),
                        ],
                      ),
                      // Bencana()
                      // if (menu == 1) Pengaduan(),
                      if (menu == 1)
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    color: Colors.white,
                                    elevation: 5,
                                    shadowColor: Color.fromARGB(100, 0, 0, 0),
                                    child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 20),
                                        child: Form(
                                          key: _formKey,
                                          child: Column(
                                            children: <Widget>[
                                              Center(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    _showPicker(context);
                                                  },
                                                  child: Container(
                                                    width: 100,
                                                    child: selectedImage != null
                                                        ? ClipRRect(
                                                            // borderRadius: BorderRadius.circular(50),
                                                            child: Image.file(
                                                              selectedImage,
                                                              fit: BoxFit
                                                                  .fitHeight,
                                                            ),
                                                          )
                                                        : Container(
                                                            height: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors
                                                                  .grey[200],
                                                              // borderRadius: BorderRadius.circular(50)
                                                            ),
                                                            child: Card(
                                                                child: Icon(Icons
                                                                    .add_a_photo)),
                                                          ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10.0,
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(bottom: 15),
                                                child: TextFormField(
                                                  controller: judulController,
                                                  decoration: InputDecoration(
                                                      labelText: 'Judul',
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              new BorderRadius
                                                                      .circular(
                                                                  5.0))),
                                                  keyboardType:
                                                      TextInputType.text,
                                                  onFieldSubmitted: (value) {
                                                    //Validator
                                                  },
                                                  validator: (value) {
                                                    if (value.isEmpty) {
                                                      return 'Masukan Judul!';
                                                    }
                                                    return null;
                                                  },
                                                ),
                                              ),

                                              //text input
                                              Container(
                                                margin:
                                                    EdgeInsets.only(bottom: 15),
                                                child: TextFormField(
                                                  controller:
                                                      pengaduanController,
                                                  maxLines: 4,
                                                  decoration: InputDecoration(
                                                      labelText: 'Pengaduan',
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              new BorderRadius
                                                                      .circular(
                                                                  5.0))),
                                                  keyboardType:
                                                      TextInputType.text,
                                                  onFieldSubmitted: (value) {},
                                                  validator: (value) {
                                                    if (value.isEmpty) {
                                                      return 'Masukan Pengaduan!';
                                                    }
                                                    return null;
                                                  },
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(bottom: 15),
                                                child: TextFormField(
                                                  controller: lokasiController,
                                                  maxLines: 4,
                                                  decoration: InputDecoration(
                                                      labelText: 'Lokasi',
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              new BorderRadius
                                                                      .circular(
                                                                  5.0))),
                                                  keyboardType:
                                                      TextInputType.text,
                                                  onFieldSubmitted: (value) {},
                                                  validator: (value) {
                                                    if (value.isEmpty) {
                                                      return 'Masukan Lokasi!';
                                                    }
                                                    return null;
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.1,
                                              ),
                                              RaisedButton(
                                                color: Colors.blue,
                                                onPressed: () {
                                                  if (_formKey.currentState
                                                      .validate()) {
                                                    // submitProfile();
                                                    ServiceProfile service =
                                                        ServiceProfile();
                                                    service
                                                        .submitSubscription(
                                                            file: selectedImage,
                                                            filename: filename,
                                                            id_user: token,
                                                            judul:
                                                                judulController
                                                                    .text,
                                                            pengaduan:
                                                                pengaduanController
                                                                    .text,
                                                            tempat:
                                                                lokasiController
                                                                    .text)
                                                        .then((value) {
                                                      print(value);
                                                      Navigator.pushReplacement(
                                                          context,
                                                          new MaterialPageRoute(
                                                              builder: (context) =>
                                                                  new Pengaduan()));
                                                      // setState(() {
                                                      //   // submitProfileResponse = value;
                                                      //   // checkResponse();
                                                      // });
                                                    });
                                                  }
                                                },
                                                textColor: Colors.white,
                                                padding: EdgeInsets.all(0.0),
                                                child: Container(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: const Text('Masukan'),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ))),
                              )
                            ],
                          ),
                        ),
                      if (menu == 2) Pengaduan()
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  chooseImage() {
    setState(() {
      file = ImagePicker.pickImage(source: ImageSource.gallery);
    });
  }

  Widget showImage() {
    return FutureBuilder<File>(
      future: file,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            null != snapshot.data) {
          tmpFile = snapshot.data;
          base64Image = base64Encode(snapshot.data.readAsBytesSync());
          return Flexible(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image.file(
                snapshot.data,
                fit: BoxFit.fill,
                height: 100.0,
              ),
            ),
          );
        } else if (null != snapshot.error) {
          return const Text(
            'Error Picking Image',
            textAlign: TextAlign.center,
          );
        } else {
          return Flexible(
            child: Card(
              child: Image.asset(
                'images/add-image.png',
                fit: BoxFit.fill,
                height: 100.0,
              ),
            ),
          );
        }
      },
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  // new ListTile(
                  //   leading: new Icon(Icons.photo_camera),
                  //   title: new Text('Camera'),
                  //   onTap: () {
                  //     _imgFromCamera();
                  //     Navigator.of(context).pop();
                  //   },
                  // ),
                ],
              ),
            ),
          );
        });
  }

  _imgFromGallery() async {
    PickedFile image =
        await _picker.getImage(source: ImageSource.gallery, imageQuality: 50);
    if (image.path != null) {
      setState(() {
        selectedImage = File(image.path != null ? image.path : '');
      });
    }
  }
}
