import 'package:flutter/material.dart';
import 'package:frontend/home.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                  "Register",
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
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
                            EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              TextFormField(
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
                                decoration:
                                    InputDecoration(labelText: 'Nama Lengkap'),
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
