
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infinitystudio/Builder/creator.dart';
import 'package:infinitystudio/Builder/episodes_list.dart';
import 'package:infinitystudio/Projects/projectmain.dart';
import 'package:infinitystudio/Projects/projects_list.dart';

class MyProjects extends StatelessWidget{

  bool ischecked = true;

  List<Widget> pageChildren(double width, BuildContext context){

    return <Widget>[
      Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  SizedBox(
                    width: 50.0,
                  ),

                  Text("PROJECTS ",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 60,
                      color: Colors.black
                  ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 50.0,top: 5.0),
                    child: Text("To keep connected with us please login with your personal \ninformation by email address and password",
                      style: TextStyle(fontSize: 20.0,color: Colors.black,fontStyle: FontStyle.normal),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width-120,
              child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                      ),
                      ProjectsList(),
                    ],
                  )),
            ),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return LayoutBuilder(
      builder: (context,constraints){
        if(constraints.maxWidth>800){
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: pageChildren(constraints.biggest.width/2,context),
          );
        }else{
          return Column(
            children: pageChildren(constraints.biggest.width,context),
          );
        }
      },
    );
  }



}