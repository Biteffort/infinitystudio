
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                          padding: EdgeInsets.only(left: 50.0,top: 8.0),
                          child: Text("To keep connected with us please login with your personal \ninformation by email address and password",
                            style: TextStyle(fontSize: 16.0,color: Colors.black,fontStyle: FontStyle.normal),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    width: 630,
                  ),

                  SizedBox(
                    width: 140.0,
                    height: 35.0,
                    child: MaterialButton(
                      color: Colors.white,
                      child: Text('Create Project',style: TextStyle(color: Colors.pink),),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(35))
                      ),
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CreatorPage()),
                        );
                      },
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
            children: pageChildren(constraints.biggest.width,context),
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