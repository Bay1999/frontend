import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frontend/api/api_login.dart';
import 'package:frontend/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var _formKey = GlobalKey<FormState>();
  var isLoading = false;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController nik = TextEditingController();

  void _submit() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState.save();
  }

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Belajar Mitigasi Bencana"),
          // leading: Icons.,
        ),
        //body
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text(
                    "Register",
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Colors.white,
                      elevation: 5,
                      shadowColor: Color.fromARGB(100, 0, 0, 0),
                      child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 20),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  controller: nik,
                                  decoration: InputDecoration(labelText: 'NIK'),
                                  keyboardType: TextInputType.number,
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
                                // SizedBox(
                                //   height: MediaQuery.of(context).size.width * 0.1,
                                // ),
                                TextFormField(
                                  controller: name,
                                  decoration: InputDecoration(
                                      labelText: 'Nama Lengkap'),
                                  keyboardType: TextInputType.text,
                                  onFieldSubmitted: (value) {
                                    //Validator
                                  },
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Masukan nama lengkap';
                                    }
                                    return null;
                                  },
                                ),
                                //box styling
                                // SizedBox(
                                //   height: MediaQuery.of(context).size.width * 0.1,
                                // ),
                                //text input
                                TextFormField(
                                  controller: username,
                                  decoration:
                                      InputDecoration(labelText: 'Username'),
                                  keyboardType: TextInputType.text,
                                  onFieldSubmitted: (value) {},
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Masukan username!';
                                    }
                                    return null;
                                  },
                                ),
                                // SizedBox(
                                //   height: MediaQuery.of(context).size.width * 0.1,
                                // ),
                                //text input
                                TextFormField(
                                  decoration:
                                      InputDecoration(labelText: 'Password'),
                                  keyboardType: TextInputType.text,
                                  controller: password,
                                  onFieldSubmitted: (value) {},
                                  obscureText: true,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Masukan sandi!';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.width * 0.1,
                                ),
                                RaisedButton(
                                  color: Colors.blue,
                                  onPressed: () {
                                    _register();
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       //mengirim parameter id
                                    //       builder: (context) => Home()),
                                    // );
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
          ),
        ));
  }

  void _register() async {
    showAlertDialog(context);
    setState(() {
      _isLoading = true;
    });
    var data = {
      'username': username.text,
      'password': password.text,
      'name': name.text,
      'NIK': nik.text,
    };
    print(data);
    var res = await Network().authData(data, 'api/apps/register');
    var body = json.decode(res.body);
    print(body['status']);
    if (body['status'] == 200) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('id', json.encode(body['data']));
      Navigator.pop(context);
      Navigator.pushAndRemoveUntil(
          context,
          new MaterialPageRoute(builder: (context) => Home()),
          (Route<dynamic> route) => false);
    } else {
      Navigator.pop(context);
      // _showMsg(body['message']);
      // print();
      Fluttertoast.showToast(
          msg: body['message'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.greenAccent,
          textColor: Colors.white,
          fontSize: 16.0);
    }

    setState(() {
      _isLoading = false;
    });
  }

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 5), child: Text("Loading")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
