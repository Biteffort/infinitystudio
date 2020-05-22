import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infinitystudio/Builder/creator.dart';
import 'package:infinitystudio/Builder/episode_item_model.dart';
import 'package:toast/toast.dart';
import 'dart:js' as js;
import 'dart:html' as html;

class ProjectsItem extends StatelessWidget {
  final EpisodeItemModel model;
  const ProjectsItem({
    Key key,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5,
      child: SizedBox(
        width: 300,
        child: Column(
          children: <Widget>[
            Image.network(model.imageUrl, fit: BoxFit.fill,height: 180,width: 300,),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                      width: 180.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          model.title,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),

                          softWrap: true,
                        ),
                        Text(
                          '${model.duration} minutes',
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 80.0,
                    height: 30.0,
                    child: MaterialButton(
                      color: Colors.white,
                      child: Text('Create',style: TextStyle(color: Colors.pink),),
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
              )
            ),
          ],
        ),
      ),
    );
  }

  void loadModel(String url, BuildContext context) {
    Toast.show(url, context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);

    js.context.callMethod('3dmodel', [url]);

  }
}
