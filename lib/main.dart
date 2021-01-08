import 'package:flutter/material.dart';
import 'register.dart';
import 'package:frontend/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        "/home": (_) => new Home(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final emailController = TextEditingController();
  final passController = TextEditingController();

  Future<List<String>> getList(String email, String pass) async {
    final http.Response response = await http.post(
      'http://dlibrary.manganoid.com/api/pencegahan',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'pass': pass,
      }),
    );
    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      // List jsonResponse = json.decode(response.body);
      // return jsonResponse.map((job) => new Pencegahan.fromJson(job)).toList();
      return json.decode(response.body);
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Center(
          child: Text('Belajar Mitigasi Bencana'),
        )),
        body: Center(
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
                        margin:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 60),
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
                                  Navigator.pushReplacementNamed(
                                      context, "/home");
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
        ));
  }
}
