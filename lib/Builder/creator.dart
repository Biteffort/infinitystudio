import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:infinitystudio/Builder/CreatorBody.dart';
import 'dart:async';

import 'package:http/http.dart' as http;
import 'dart:js' as js;
import 'dart:html' as html;

import 'package:infinitystudio/Builder/CreatorNavigationbar.dart';
import 'package:infinitystudio/Builder/episodes_list.dart';
import 'package:toast/toast.dart';

class CreatorPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CreatorPage();
  }
}


List<IntSize> _createSizes(int count) {
  Random rnd = new Random();
  return new List.generate(count,
          (i) => new IntSize((rnd.nextInt(500) + 200), rnd.nextInt(800) + 200));
}

final Uint8List kTransparentImage = new Uint8List.fromList(<int>[
  0x89,
  0x50,
  0x4E,
  0x47,
  0x0D,
  0x0A,
  0x1A,
  0x0A,
  0x00,
  0x00,
  0x00,
  0x0D,
  0x49,
  0x48,
  0x44,
  0x52,
  0x00,
  0x00,
  0x00,
  0x01,
  0x00,
  0x00,
  0x00,
  0x01,
  0x08,
  0x06,
  0x00,
  0x00,
  0x00,
  0x1F,
  0x15,
  0xC4,
  0x89,
  0x00,
  0x00,
  0x00,
  0x0A,
  0x49,
  0x44,
  0x41,
  0x54,
  0x78,
  0x9C,
  0x63,
  0x00,
  0x01,
  0x00,
  0x00,
  0x05,
  0x00,
  0x01,
  0x0D,
  0x0A,
  0x2D,
  0xB4,
  0x00,
  0x00,
  0x00,
  0x00,
  0x49,
  0x45,
  0x4E,
  0x44,
  0xAE,
]);



class _CreatorPage extends State<CreatorPage> {
  Timer _timer;
  List<int> _selectedFile;
  Uint8List _bytesData;
  Color currentColor = Colors.white;

  ScrollController _scrollController = new ScrollController();

  bool isloading = false;

  List plugxrMarkers;

  final List<IntSize> _sizes;


  void changeColor(Color color) => setState(() => currentColor = color);

  List<PlugxrData> listMarkers = [];
  _CreatorPage() : _sizes = _createSizes(_kItemCount).toList();
  static const int _kItemCount = 1000;




  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _timer = new Timer(const Duration(milliseconds: 400), () {
      setState(() {
       // js.context.callMethod('alertMessage', [MediaQuery.of(context).size.width,MediaQuery.of(context).size.height]);

      });
    });


    this.fetchmarkersData();


    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchmarkersData();
      }
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
                child: ListView(
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

                        //getFilePath();
                      },
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              SizedBox(
                                height: 50,
                                child: Container(
                                  alignment: Alignment.center,
                                child: Text(
                                  '3D Assets',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 25,
                                  ),
                                  softWrap: true,
                                ),
                                ),
                              ),
                              EpisodesList(),
                            ],
                          )),
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
                    ? const Color(0xffffffff)
                    : const Color(0xff000000),
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
    uploadInput.accept = ".glb";
    uploadInput.draggable = true;
    uploadInput.click();



    uploadInput.onChange.listen((e) {
      final files = uploadInput.files;
      final file = files[0];
      final reader = new html.FileReader();


      print(file.relativePath);

      Toast.show("File"+file.name, context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);

      reader.readAsDataUrl(file);

      Uint8List _bytesData =
      Base64Decoder().convert(file.toString().split(",").last);
      List<int> _selectedFile = _bytesData;


      /*reader.onLoadEnd.listen((e) {
        _handleResult(reader.result);
      });
      reader.readAsDataUrl(file);*/


    });


  }


  void getFilePath() async {
    try {
      String filePath = await FilePicker.getFilePath(
          type: FileType.image);
      if (filePath == '') {
        return;
      }
      print("Path: " + filePath);
      setState(() {
        Toast.show("File"+filePath, context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);

      });
    } on PlatformException catch (e) {
      print("Error picking file: " + e.toString());
    }
  }

  void _handleResult(Object result) {
    setState(() {
      _bytesData = Base64Decoder().convert(result.toString().split(",").last);
      _selectedFile = _bytesData;



    });
  }

  Widget _buildList() {
    return StaggeredGridView.countBuilder(
      controller: _scrollController,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      primary: false,
      padding: const EdgeInsets.all(12),
      crossAxisCount: 4,
      mainAxisSpacing: 2,
      crossAxisSpacing: 2,
      itemCount: listMarkers.length,
      itemBuilder: (context, index) {
        if (index == listMarkers.length) {
          return _buildProgressIndicator();
        }else{
          return new _Tile(listMarkers[index], _sizes[index]);
        }

      },
      staggeredTileBuilder: (index) => new StaggeredTile.fit(2),
    );
  }

  Future<String> fetchmarkersData() async {


    if (!isloading) {
      setState(() {
        isloading = true;
      });
    }


    final response =
    await http.get(Uri.encodeFull("https://apiservice.plugxr.com/api/v2/GetAllTargets/0"),headers: {"Accept" : "application/json"});

    if(response.statusCode == 200){

      var result = json.decode(response.body);
      print("Plugxr Markers Data : "+result.toString());

      plugxrMarkers = result["data"];


      print("Markers : "+plugxrMarkers.toString());

      setState(() {
        isloading = false;
        for(Map i in plugxrMarkers){
          listMarkers.add(PlugxrData.fromJson(i));
        }
      });


    }
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isloading ? 1.0 : 00,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }






}

class IntSize {
  const IntSize(this.width, this.height);

  final int width;
  final int height;
}

class _Tile extends StatelessWidget {
  const _Tile(this.plugxrMarker, this.size);

  final IntSize size;
  final PlugxrData plugxrMarker;

  @override
  Widget build(BuildContext context) {
    return new Card(
      elevation: 3.0,

      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Align(
          child: Image.network(plugxrMarker.image,fit: BoxFit.cover),
        ),
      ),
    );
  }

}

class PlugxrData {
  int trackableId;
  String targetId;
  String projectName;
  int viewsCount;
  String image;
  String thumbnail;
  int width;
  int height;
  String createdDate;

  PlugxrData(
      {this.trackableId,
        this.targetId,
        this.projectName,
        this.viewsCount,
        this.image,
        this.thumbnail,
        this.width,
        this.height,
        this.createdDate});

  PlugxrData.fromJson(Map<String, dynamic> json) {
    trackableId = json['trackable_id'];
    targetId = json['target_id'];
    projectName = json['project_name'];
    viewsCount = json['views_count'];
    image = json['image'];
    thumbnail = json['thumbnail'];
    width = json['width'];
    height = json['height'];
    createdDate = json['created_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['trackable_id'] = this.trackableId;
    data['target_id'] = this.targetId;
    data['project_name'] = this.projectName;
    data['views_count'] = this.viewsCount;
    data['image'] = this.image;
    data['thumbnail'] = this.thumbnail;
    data['width'] = this.width;
    data['height'] = this.height;
    data['created_date'] = this.createdDate;
    return data;
  }
}

