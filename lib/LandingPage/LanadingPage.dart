import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget{

  List<Widget> pageChildren(double width){

    return <Widget>[
      Container(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Augument Reality \nDevelopers",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 50,
              color: Colors.white
            ),
            ),
            new Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Text("Build your own augmented reality for App and WebAR with Blippbuilder. This powerful drag and drop platform gets you up and running with augmented reality campaigns in no time",
                style: TextStyle(fontSize: 20.0,color: Colors.white),
              ),
            ),
            MaterialButton(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(40.0))
              ),
              onPressed: (){},
              child: new Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 40.0),
              child: Text("FIND OUT MORE",
                style: TextStyle(color: Colors.red),),)
            ),
          ],
        ),
      ),
      Image.asset("assets/images/one.png",width: width,),
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
            children: pageChildren(constraints.biggest.width/2),
          );
        }else{
          return Column(
            children: pageChildren(constraints.biggest.width),
          );
        }
      },
    );
  }

}