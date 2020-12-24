import 'package:flutter/material.dart';
import 'package:frontend/home.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class Pengaduan extends StatefulWidget {
  @override
  _PengaduanState createState() => _PengaduanState();
}

class _PengaduanState extends State<Pengaduan> {
  var _formKey = GlobalKey<FormState>();
  var isLoading = false;

  void _submit() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Belajar Mitigasi Bencana"),
          // leading: Icons.,
        ),
        //body
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text(
                  "Pengaduan",
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Colors.white,
                    elevation: 5,
                    shadowColor: Color.fromARGB(100, 0, 0, 0),
                    child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(bottom: 15),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      labelText: 'Judul',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              new BorderRadius.circular(5.0))),
                                  keyboardType: TextInputType.number,
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
                              // SizedBox(
                              //   height: MediaQuery.of(context).size.width * 0.1,
                              // ),
                              // Container(
                              //     margin: EdgeInsets.only(bottom: 15),
                              //     child: InkWell(
                              //       onTap: () {
                              //         DatePicker.showDatePicker(context,
                              //             showTitleActions: true,
                              //             minTime: DateTime(2018, 3, 5),
                              //             maxTime: DateTime(2019, 6, 7),
                              //             onChanged: (date) {
                              //           print('change $date');
                              //         }, onConfirm: (date) {
                              //           print('confirm $date');
                              //         },
                              //             currentTime: DateTime.now(),
                              //             locale: LocaleType.zh);
                              //       },
                              //       child: TextFormField(
                              //         decoration: InputDecoration(
                              //             labelText: 'Tanggal',
                              //             border: OutlineInputBorder(
                              //                 borderRadius:
                              //                     new BorderRadius.circular(
                              //                         5.0))),
                              //         keyboardType: TextInputType.text,
                              //         onFieldSubmitted: (value) {
                              //           //Validator
                              //         },
                              //         validator: (value) {
                              //           if (value.isEmpty) {
                              //             return 'Masukan nama lengkap';
                              //           }
                              //           return null;
                              //         },
                              //       ),
                              //     )),
                              Container(
                                margin: EdgeInsets.only(bottom: 15),
                                child: InputDatePickerFormField(
                                  fieldLabelText: 'Tanggal',
                                  fieldHintText: '30/06/2020',
                                  firstDate: DateTime(2019, 1, 1),
                                  lastDate: DateTime(2030, 12, 31),
                                ),
                              ),

                              // FlatButton(
                              //     onPressed: () {
                              //       DatePicker.showDatePicker(context,
                              //           showTitleActions: true,
                              //           minTime: DateTime(1018, 3, 5),
                              //           maxTime: DateTime(2119, 6, 7),
                              //           onChanged: (date) {
                              //         print('change $date');
                              //       }, onConfirm: (date) {
                              //         print('confirm $date');
                              //       },
                              //           currentTime: DateTime.now(),
                              //           locale: LocaleType.id);
                              //     },
                              //     child: Text(
                              //       'Tanggal',
                              //       style: TextStyle(color: Colors.blue),
                              //     )),
                              //box styling
                              // SizedBox(
                              //   height: MediaQuery.of(context).size.width * 0.1,
                              // ),
                              //text input
                              Container(
                                margin: EdgeInsets.only(bottom: 15),
                                child: TextFormField(
                                  maxLines: 4,
                                  decoration: InputDecoration(
                                      labelText: 'Pengaduan',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              new BorderRadius.circular(5.0))),
                                  keyboardType: TextInputType.text,
                                  onFieldSubmitted: (value) {},
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Masukan username!';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 15),
                                child: TextFormField(
                                  maxLines: 4,
                                  decoration: InputDecoration(
                                      labelText: 'Lokasi',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              new BorderRadius.circular(5.0))),
                                  keyboardType: TextInputType.text,
                                  onFieldSubmitted: (value) {},
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Masukan username!';
                                    }
                                    return null;
                                  },
                                ),
                              ),

                              // SizedBox(
                              //   height: MediaQuery.of(context).size.width * 0.1,
                              // ),
                              //text input
                              Container(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      labelText: 'Password',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              new BorderRadius.circular(5.0))),
                                  keyboardType: TextInputType.text,
                                  onFieldSubmitted: (value) {},
                                  obscureText: true,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Masukan sandi!';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.width * 0.1,
                              ),
                              RaisedButton(
                                color: Colors.blue,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        //mengirim parameter id
                                        builder: (context) => Home()),
                                  );
                                },
                                textColor: Colors.white,
                                padding: EdgeInsets.all(0.0),
                                child: Container(
                                  padding: const EdgeInsets.all(10.0),
                                  child: const Text('Registrasi',
                                      style: TextStyle(fontSize: 20)),
                                ),
                              ),
                            ],
                          ),
                        ))),
              )
            ],
          ),
        ));
  }
}
