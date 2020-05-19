import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infinitystudio/Builder/CreatorBody.dart';
import 'dart:convert';

import 'dart:js' as js;
import 'dart:html' as html;

import 'package:infinitystudio/Builder/CreatorNavigationbar.dart';


class CreatorPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CreatorPage();
  }
}

class _CreatorPage extends State<CreatorPage> {
  Timer _timer;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _timer = new Timer(const Duration(milliseconds: 400), () {
      setState(() {
        js.context.callMethod('alertMessage', [MediaQuery.of(context).size.width,MediaQuery.of(context).size.height]);

      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              NavigationBarCreator(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: CreatorBody(),
              ),
            ],
          ),
        ),
      ),
    );
  }


  /*MaterialButton(
              color: Colors.white,
              padding: const EdgeInsets.only(right: 30.0,left: 30.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              onPressed: (){

                //html.window.open('https://youtube.com', 'youtube');


                // js.context.callMethod('EventDispatcher');
                /*var state = js.JsObject.fromBrowserObject(js.context['state']);
                      print(state['hello']);*/
              },
              child:
              Text("Alert Now",
                style: TextStyle(color: Colors.red,fontSize: 16),
              ),
            ),*/

}
