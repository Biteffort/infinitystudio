import 'package:flutter/material.dart';
import 'package:infinitystudio/LandingPage/LanadingPage.dart';
import 'package:infinitystudio/LandingPage/NavBarLogin.dart';
import 'package:infinitystudio/LoginPage/LoginPage.dart';
import 'package:infinitystudio/NavigationBar/NavBar.dart';


void main() {
  runApp(LoginMain());
}

class LoginMain extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "InfinityStudio",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Sourcesans"
      ),
      home: new MyLoginMain(),
    );
  }

}


class MyLoginMain extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color.fromRGBO(195, 20, 50, 1.0),Color.fromRGBO(36, 11, 54, 1.0)]
          )
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              NavigationBarLogin(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: LoginPage(),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
