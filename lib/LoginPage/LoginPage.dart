import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget{

  bool ischecked = true;

  List<Widget> pageChildren(double width){

    return <Widget>[
      Image.asset("assets/images/two.png",width: width,),
      Container(
        padding: const EdgeInsets.only(left: 150.0),
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Welcome Back :)",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50,
                color: Colors.white
            ),
            ),
            new Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Text("To keep connected with us please login with your personal \ninformation by email address and password",
                style: TextStyle(fontSize: 20.0,color: Colors.white),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                width: 350,
                height: 50,
                child: Card(
                  color: Colors.white,
                  child: TextField(
                    textAlign: TextAlign.justify,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.only(left: 10.0,right: 10.0),
                        hintText: 'Enter Email Address'
                    ),
                  ),
                ),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Container(
                width: 350,
                height: 50,
                child: Card(
                  color: Colors.white,
                  child: TextField(
                    textAlign: TextAlign.justify,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.only(left: 10.0,right: 10.0),
                        hintText: 'Enter Password'
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 0.0),
                    child: Row(
                      children: <Widget>[
                        Checkbox(
                          checkColor: Colors.red,
                          activeColor: Colors.white,
                          value: ischecked,
                          onChanged: (value) {
                            if (value) {
                              value = !ischecked;
                            }
                          },
                        ),
                        Text("Remember me",
                          style: TextStyle(color: Colors.white,fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 75.0),
                    child: Text("Forgot Password",
                      style: TextStyle(color: Colors.white,fontSize: 16),
                    ),
                  ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                children: <Widget>[
                  MaterialButton(
                    color: Colors.white,
                    padding: const EdgeInsets.only(right: 30.0,left: 30.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    onPressed: (){

                    },
                    child:
                    Text("Login Now",
                      style: TextStyle(color: Colors.red,fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100.0),
                    child: Text("Create Account",
                      style: TextStyle(color: Colors.white,fontSize: 16),
                    ),
                  ),

                ],
              ),
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