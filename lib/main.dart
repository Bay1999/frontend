import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frontend/api/api_login.dart';
import 'package:frontend/login.dart';
import 'home.dart';
import 'register.dart';
import 'package:frontend/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:splashscreen/splashscreen.dart';

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
      home: Splash(),
      routes: {
        "/home": (_) => new Home(),
      },
    );
  }
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => new _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 8,
      navigateAfterSeconds: new MyHomePage(title: 'Flutter Demo Home Page'),
      title: new Text(
        'Mitigasi Bencana\ndi Kabupaten Lamongan',
        textAlign: TextAlign.center,
        style: new TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.black38),
      ),
      image: new Image.asset(
        'assets/images/BPBD.jpg',
        height: MediaQuery.of(context).size.height * 0.4,
      ),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      loaderColor: Colors.white,
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
  bool isAuth = false;
  @override
  void initState() {
    _checkIfLoggedIn();
    super.initState();
  }

  void _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('id');
    if (token != null) {
      setState(() {
        isAuth = true;
      });
    }
  }

  String email, password;
  bool _isLoading = false;
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
    Widget child;
    if (isAuth) {
      child = Home();
    } else {
      child = LoginPage();
    }
    return Scaffold(
      body: child,
    );
  }
}
