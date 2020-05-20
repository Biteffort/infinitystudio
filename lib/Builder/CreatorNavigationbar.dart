import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infinitystudio/main.dart';

class NavigationBarCreator extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return LayoutBuilder(
      builder: (context,constraints){
        if(constraints.maxWidth>1200){
          return DesktopNavBar();
        }else if(constraints.maxWidth>800 && constraints.maxWidth<1200){
        return DesktopNavBar();
        }else{
          return MobileNavBar();
        }
      },
    );
  }

}


// Desktop Navigation Bar
class DesktopNavBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Padding(
        padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 0),
      child: Container(
        height: 70.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color.fromRGBO(195, 20, 50, 1.0),Color.fromRGBO(36, 11, 54, 1.0)]
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 130.0),
              child: Row(
                children: <Widget>[
                  Text("Infinity Studio",style: TextStyle(
                    fontWeight: FontWeight.bold,color: Colors.white,fontSize: 30,),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}


class MobileNavBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Text("Home",
              style: TextStyle(color: Colors.white,fontSize: 16),
            ),
            SizedBox(
              width: 30,
            ),
            Text("About US",
              style: TextStyle(color: Colors.white,fontSize: 16),
            ),
            SizedBox(
              width: 30,
            ),
            Text("Portfolio",
              style: TextStyle(color: Colors.white,fontSize: 16),
            ),
            SizedBox(
              width: 30,
            ),
            MaterialButton(
              color: Colors.pink,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              onPressed: (){},
              child:
              Text("Get Started",
                style: TextStyle(color: Colors.white,fontSize: 16),
              ),
            ),
          ],
        ),
        ),
      );
  }

}