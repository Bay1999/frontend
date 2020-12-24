import 'package:flutter/material.dart';
import 'register.dart';

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        //mengirim parameter id
                                        builder: (context) => Register()),
                                  );
                                },
                                textColor: Colors.white,
                                padding: EdgeInsets.all(0.0),
                                child: Container(
                                  padding: const EdgeInsets.all(10.0),
                                  child: const Text('Login',
                                      style: TextStyle(fontSize: 20)),
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
