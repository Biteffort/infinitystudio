
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infinitystudio/Builder/creator.dart';
import 'dart:js' as js;
import 'dart:html' as html;
import 'package:infinitystudio/main.dart';

class CreatorBody extends StatelessWidget{

  bool ischecked = true;

  List<Widget> pageChildren(double width, BuildContext context){

    return <Widget>[
      Container(
        width: width/5,
        height: MediaQuery.of(context).size.height,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
              Container(
                width: 80.0,
                height: MediaQuery.of(context).size.height,
                child: Card(
                  elevation: 5,
                  child: Container(
                      width: 80.0,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color.fromRGBO(195, 20, 50, 1.0),Color.fromRGBO(36, 11, 54, 1.0)]
                          )
                      ),
                    child: ListView(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Image.asset('assets/images/3dmodels.png',width: 30.0,height: 30.0,alignment: Alignment.center,fit: BoxFit.fill,),
                            Text('3D Models'),
                          ],
                        )
                      ],
                    )
                  ),
                ),
              ),
            Container(
              width: (width/5)-80.0,
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              child: Card(
                color: Colors.white,
                elevation: 5,
              ),

            )

          ],
        ),
      ),
      Container(
        color: Colors.red,
        width: width/6,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(

            )
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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