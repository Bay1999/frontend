import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frontend/api/api_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';
import 'register.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email, password;
  bool _isLoading = false;
  final emailController = TextEditingController();
  final passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Center(
          child: Text('Belajar Mitigasi Bencana'),
        )),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Image.asset(
                    'assets/images/plant.png',
                    height: 80,
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
                              horizontal: 40, vertical: 60),
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                controller: emailController,
                                autofocus: false,
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(20, 17, 20, 0),
                                  hintText: 'Username',
                                  hintStyle: TextStyle(
                                      color: Colors.black38, fontSize: 16),
                                  prefixIcon: Icon(Icons.person),
                                  // suffixIcon: Icon(Icons.search),
                                ),
                              ),
                              TextFormField(
                                controller: passController,
                                autofocus: false,
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(20, 17, 20, 0),
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                      color: Colors.black38, fontSize: 16),
                                  prefixIcon: Icon(Icons.vpn_key),
                                  // suffixIcon: Icon(Icons.search),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                child: RaisedButton(
                                  color: Colors.blue,
                                  onPressed: () {
                                    // Navigator.pushReplacementNamed(
                                    //     context, "/home");
                                    _login();
                                  },
                                  textColor: Colors.white,
                                  padding: EdgeInsets.all(0.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(10.0),
                                    child: const Text('Login',
                                        style: TextStyle(fontSize: 20)),
                                  ),
                                ),
                              ),
                              Container(
                                child: FlatButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          //mengirim parameter id
                                          builder: (context) => Register()),
                                    );
                                  },
                                  child: Text(
                                    'Registrasi',
                                    style: TextStyle(color: Colors.blueAccent),
                                  ),
                                ),
                              )
                            ],
                          ))),
                )
              ],
            ),
          ),
        ));
  }

  void _login() async {
    showAlertDialog(context);
    setState(() {
      _isLoading = true;
    });
    var data = {
      'username': emailController.text,
      'password': passController.text
    };
    print(data);
    var res = await Network().authData(data, 'api/apps/login');
    var body = json.decode(res.body);
    print(body['message']);
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
