import 'package:flutter/material.dart';
import 'package:infinitystudio/LandingPage/LanadingPage.dart';
import 'package:infinitystudio/LandingPage/NavBarLogin.dart';
import 'package:infinitystudio/LoginPage/LoginPage.dart';
import 'package:infinitystudio/NavigationBar/NavBar.dart';
import 'package:infinitystudio/Projects/projectbody.dart';
import 'package:infinitystudio/Projects/projectsnav.dart';


void main() {
  runApp(ProjectMain());
}

class ProjectMain extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "InfinityStudio",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: "Sourcesans"
      ),
      home: new _ProjectMain(),
    );
  }

}


class _ProjectMain extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ProjectsNav(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: MyProjects(),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
