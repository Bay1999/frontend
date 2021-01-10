import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/api/api_login.dart';
import 'package:frontend/home.dart';
import 'package:frontend/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  var _formKey = GlobalKey<FormState>();
  var isLoading = false;
  var token, nama, nik, username;

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
    } else {
      _getData(token);
    }
  }

  void _getData(String _token) async {
    var data = {'id_user': _token};
    print(data);
    var res = await Network().authData(data, 'api/apps/user');
    var body = json.decode(res.body);
    print(body['name']);
    setState(() {
      nama = body['name'];
      username = body['username'];
      nik = body['NIK'];
    });
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
            children: <Widget>[
              Container(
                child: Text(
                  "User",
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Container(
                    child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(bottom: 15),
                                child: Text(
                                  'NIK :',
                                  style: TextStyle(fontSize: 18.0),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 15),
                                child: Text(
                                  nik ?? '',
                                  style: TextStyle(fontSize: 18.0),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 15),
                                child: Text(
                                  'Nama :',
                                  style: TextStyle(fontSize: 18.0),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 15),
                                child: Text(
                                  nama ?? '',
                                  style: TextStyle(fontSize: 18.0),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 15),
                                child: Text(
                                  'Username :',
                                  style: TextStyle(fontSize: 18.0),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Container(
                                child: Text(
                                  username ?? '',
                                  style: TextStyle(fontSize: 18.0),
                                  textAlign: TextAlign.left,
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
