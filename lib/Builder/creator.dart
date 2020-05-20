import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:infinitystudio/Builder/CreatorBody.dart';
import 'dart:convert';

import 'dart:js' as js;
import 'dart:html' as html;

import 'package:infinitystudio/Builder/CreatorNavigationbar.dart';
import 'package:toast/toast.dart';

class CreatorPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CreatorPage();
  }
}

class _CreatorPage extends State<CreatorPage> {
  Timer _timer;

  Color currentColor = Colors.pink;
  void changeColor(Color color) => setState(() => currentColor = color);



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _timer = new Timer(const Duration(milliseconds: 400), () {
      setState(() {
       // js.context.callMethod('alertMessage', [MediaQuery.of(context).size.width,MediaQuery.of(context).size.height]);

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
                child: LayoutBuilder(
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



  List<Widget> pageChildren(double width, BuildContext context){

    ColorSwatch _tempMainColor;

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
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 30),
                      GestureDetector(
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Image.asset('assets/images/3dmodels.png',width: 30.0,height: 30.0,alignment: Alignment.center,fit: BoxFit.fill,),
                                Text('3D Models',style: TextStyle(color: Colors.white,fontSize: 12.0,fontStyle: FontStyle.normal),),
                              ],
                            ),
                          ),
                          onTap:(){
                            assetsFunction(context);
                          }
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        child: Column(
                          children: <Widget>[
                            Image.asset('assets/images/image.png',width: 30.0,height: 30.0,alignment: Alignment.center,fit: BoxFit.fill,),
                            Text('Image',style: TextStyle(color: Colors.white,fontSize: 12.0,fontStyle: FontStyle.normal),),
                          ],

                        ),
                        onTap: (){
                          assetsFunction(context);

                        },
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        child: Column(
                          children: <Widget>[
                            Image.asset('assets/images/videos.png',width: 30.0,height: 30.0,alignment: Alignment.center,fit: BoxFit.fill,),
                            Text('Video',style: TextStyle(color: Colors.white,fontSize: 12.0,fontStyle: FontStyle.normal),),
                          ],

                        ),
                        onTap: (){
                          assetsFunction(context);

                        },
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        child: Column(
                          children: <Widget>[
                            Image.asset('assets/images/audio.png',width: 30.0,height: 30.0,alignment: Alignment.center,fit: BoxFit.fill,),
                            Text('Audio',style: TextStyle(color: Colors.white,fontSize: 12.0,fontStyle: FontStyle.normal),),
                          ],

                        ),
                        onTap: (){
                          assetsFunction(context);

                        },
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        child: Column(
                          children: <Widget>[
                            Image.asset('assets/images/text.png',width: 30.0,height: 30.0,alignment: Alignment.center,fit: BoxFit.fill,),
                            Text('Text',style: TextStyle(color: Colors.white,fontSize: 12.0,fontStyle: FontStyle.normal),),
                          ],

                        ),
                        onTap: (){
                          assetsFunction(context);

                        },
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        child: Column(
                          children: <Widget>[
                            Image.asset('assets/images/buttons.png',width: 30.0,height: 30.0,alignment: Alignment.center,fit: BoxFit.fill,),
                            Text('Buttons',style: TextStyle(color: Colors.white,fontSize: 12.0,fontStyle: FontStyle.normal),),
                          ],

                        ),
                        onTap: (){
                          assetsFunction(context);

                        },
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        child: Column(
                          children: <Widget>[
                            Image.asset('assets/images/web.png',width: 30.0,height: 30.0,alignment: Alignment.center,fit: BoxFit.fill,),
                            Text('Web',style: TextStyle(color: Colors.white,fontSize: 12.0,fontStyle: FontStyle.normal),),
                          ],

                        ),
                        onTap: (){
                          assetsFunction(context);

                        },
                      ),

                    ],
                  ),
                ),
              ),
            ),

            // Left side panel
            Container(
              width: (width/5)-80.0,
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              child: Card(
                color: Colors.white,
                elevation: 5,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(5.0),
                      width: (width/5)-80.0,
                      height: (width/5)-80.0,
                      child: Card(
                        color: Color.fromRGBO(247, 215, 213, 0.9),
                        elevation: 2.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset('assets/images/upload.png',width: 50,height: 50,),
                            Text('Upload 3D file from your system \n ( Please upload .glb models only. And max file size is 50 mb. )',style: TextStyle(fontStyle: FontStyle.normal,fontSize: 12.0),textAlign: TextAlign.center,),
                          ],
                        ),
                      ),
                    ),
                    MaterialButton(
                      color: Colors.pink,
                      child: Text('Choose File',style: TextStyle(color: Colors.white),),
                      padding: const EdgeInsets.only(right: 40.0,left: 40.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))
                      ),
                      onPressed: (){
                        startWebFilePicker();
                      },
                    ),
                  ],
                ),
              ),

            )

          ],
        ),
      ),
      Container(
        width: width/6,
        height: MediaQuery.of(context).size.height,
        child: Card(
          elevation: 5.0,
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(width: 15,),
                    Image.asset('assets/images/3d_trans.png',width: 25,height: 25,),
                    SizedBox(width: 10,),
                    Text('Transformations',style: TextStyle(fontStyle: FontStyle.normal,fontSize: 18.0),textAlign: TextAlign.center,),
                  ],
                ),
              ),



              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 15,),
                  Text('Positions',style: TextStyle(fontStyle: FontStyle.normal,fontSize: 16.0),textAlign: TextAlign.center,),
                  SizedBox(width: 10,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                    child: Container(
                      width: 70,
                      height: 32,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white70)
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        textAlign: TextAlign.center,
                        style: new TextStyle(fontWeight: FontWeight.normal, color: Colors.black,fontSize: 14.0),
                        decoration: InputDecoration(
                          hintText: 'X',
                          contentPadding: new EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
                        ),
                      ),
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                    child: Container(
                      width: 70,
                      height: 32,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white70)
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        textAlign: TextAlign.center,
                        style: new TextStyle(fontWeight: FontWeight.normal, color: Colors.black,fontSize: 14.0),
                        decoration: InputDecoration(
                          hintText: 'Y',
                          contentPadding: new EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
                        ),
                      ),
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                    child: Container(
                      width: 70,
                      height: 32,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white70)
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        textAlign: TextAlign.center,
                        style: new TextStyle(fontWeight: FontWeight.normal, color: Colors.black,fontSize: 14.0),
                        decoration: InputDecoration(
                          hintText: 'Z',
                          contentPadding: new EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Rotations
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 15,),
                  Text('Rotation',style: TextStyle(fontStyle: FontStyle.normal,fontSize: 16.0),textAlign: TextAlign.center,),
                  SizedBox(width: 10,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                    child: Container(
                      width: 70,
                      height: 32,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white70)
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        textAlign: TextAlign.center,
                        style: new TextStyle(fontWeight: FontWeight.normal, color: Colors.black,fontSize: 14.0),
                        decoration: InputDecoration(
                          hintText: 'X',
                          contentPadding: new EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
                        ),
                      ),
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                    child: Container(
                      width: 70,
                      height: 32,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white70)
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        textAlign: TextAlign.center,
                        style: new TextStyle(fontWeight: FontWeight.normal, color: Colors.black,fontSize: 14.0),
                        decoration: InputDecoration(
                          hintText: 'Y',
                          contentPadding: new EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
                        ),
                      ),
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                    child: Container(
                      width: 70,
                      height: 32,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white70)
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        textAlign: TextAlign.center,
                        style: new TextStyle(fontWeight: FontWeight.normal, color: Colors.black,fontSize: 14.0),
                        decoration: InputDecoration(
                          hintText: 'Z',
                          contentPadding: new EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Scale

              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 15,),
                  Text('Scale',style: TextStyle(fontStyle: FontStyle.normal,fontSize: 16.0),textAlign: TextAlign.center,),
                  SizedBox(width: 10,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                    child: Container(
                      width: 70,
                      height: 32,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white70)
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        textAlign: TextAlign.center,
                        style: new TextStyle(fontWeight: FontWeight.normal, color: Colors.black,fontSize: 14.0),
                        decoration: InputDecoration(
                          hintText: 'X',
                          contentPadding: new EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
                        ),
                      ),
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                    child: Container(
                      width: 70,
                      height: 32,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white70)
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        textAlign: TextAlign.center,
                        style: new TextStyle(fontWeight: FontWeight.normal, color: Colors.black,fontSize: 14.0),
                        decoration: InputDecoration(
                          hintText: 'Y',
                          contentPadding: new EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
                        ),
                      ),
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                    child: Container(
                      width: 70,
                      height: 32,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white70)
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        textAlign: TextAlign.center,
                        style: new TextStyle(fontWeight: FontWeight.normal, color: Colors.black,fontSize: 14.0),
                        decoration: InputDecoration(
                          hintText: 'Z',
                          contentPadding: new EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),


              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(width: 15,),
                    Image.asset('assets/images/texture.png',width: 23,height: 23,),
                    SizedBox(width: 10,),
                    Text('Material',style: TextStyle(fontStyle: FontStyle.normal,fontSize: 18.0),textAlign: TextAlign.center,),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Texture',style: TextStyle(fontStyle: FontStyle.normal,fontSize: 18.0,color: Color.fromRGBO(89, 88, 88, 1.0)),textAlign: TextAlign.center,),
                    Image.asset('assets/images/plus.png',width: 30,height: 30,),
                  ],
                ),
              ),



              RaisedButton(
                elevation: 3.0,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        titlePadding: const EdgeInsets.all(0.0),
                        contentPadding: const EdgeInsets.all(0.0),
                        content: SingleChildScrollView(
                          child: ColorPicker(
                            pickerColor: currentColor,
                            onColorChanged: changeColor,
                            colorPickerWidth: 300.0,
                            pickerAreaHeightPercent: 0.7,
                            enableAlpha: true,
                            displayThumbColor: true,
                            showLabel: true,
                            paletteType: PaletteType.hsv,
                            pickerAreaBorderRadius: const BorderRadius.only(
                              topLeft: const Radius.circular(2.0),
                              topRight: const Radius.circular(2.0),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: const Text('Choose Texture Color'),
                color: currentColor,
                textColor: useWhiteForeground(currentColor)
                    ? const Color(0xff000000)
                    : const Color(0xffffffff),
              ),
              /*Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Material color picker",
                    style: Theme.of(context).textTheme.headline,
                  ),
                  const SizedBox(height: 62.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: _mainColor,
                        radius: 35.0,
                        child: const Text("MAIN"),
                      ),
                      const SizedBox(width: 16.0),
                      CircleAvatar(
                        backgroundColor: _shadeColor,
                        radius: 35.0,
                        child: const Text("SHADE"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32.0),
                  OutlineButton(
                    onPressed: _openColorPicker,
                    child: const Text('Show color picker'),
                  ),
                  const SizedBox(height: 16.0),
                  OutlineButton(
                    onPressed: _openMainColorPicker,
                    child: const Text('Show main color picker'),
                  ),
                  const Text('(only main color)'),
                  const SizedBox(height: 16.0),
                  OutlineButton(
                    onPressed: _openAccentColorPicker,
                    child: const Text('Show accent color picker'),
                  ),
                  const SizedBox(height: 16.0),
                  OutlineButton(
                    onPressed: _openFullMaterialColorPicker,
                    child: const Text('Show full material color picker'),
                  ),
                ],
              ),*/



            ],
          ),
        ),
      ),
    ];
  }

  assetsFunction(BuildContext context) {
    Toast.show("Toast plugin app", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);

  }

  startWebFilePicker() async {
    html.InputElement uploadInput = html.FileUploadInputElement();
    uploadInput.multiple = false;
    uploadInput.draggable = true;
    uploadInput.click();
  }

}


