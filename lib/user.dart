import 'package:flutter/material.dart';
import 'package:frontend/home.dart';

class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
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
                  "User",
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Icon(
                  Icons.account_circle,
                  size: 100,
                  color: Colors.black38,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                                      labelText: 'NIK',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              new BorderRadius.circular(5.0))),
                                  keyboardType: TextInputType.number,
                                  initialValue: '21023901********',
                                  onFieldSubmitted: (value) {
                                    //Validator
                                  },
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Masukan NIK!';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 15),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      labelText: 'Nama',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              new BorderRadius.circular(5.0))),
                                  keyboardType: TextInputType.number,
                                  initialValue: 'Tyas',
                                  onFieldSubmitted: (value) {
                                    //Validator
                                  },
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Masukan NIK!';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Container(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      labelText: 'Alamat',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              new BorderRadius.circular(5.0))),
                                  keyboardType: TextInputType.number,
                                  initialValue: 'Lamongan',
                                  onFieldSubmitted: (value) {
                                    //Validator
                                  },
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Masukan NIK!';
                                    }
                                    return null;
                                  },
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
