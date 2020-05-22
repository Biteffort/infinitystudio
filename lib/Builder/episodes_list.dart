import 'package:flutter/material.dart';
import 'package:infinitystudio/Builder/episode_item_model.dart';

import 'episode_item.dart';

class EpisodesList extends StatelessWidget {
  final episodes = [

    EpisodeItemModel(
      title: 'Confortable Chair',
      duration: 14.07,
      url: "https://raw.githubusercontent.com/Biteffort/Assets/master/chair2.glb",
      imageUrl:
      'https://raw.githubusercontent.com/Biteffort/Assets/master/chair2.png',
    ),
    EpisodeItemModel(
      title: 'Washing Machine',
      duration: 14.07,
      url: "https://raw.githubusercontent.com/Biteffort/Assets/master/wash.glb",
      imageUrl:
      'https://raw.githubusercontent.com/Biteffort/Assets/master/wash.png',
    ),
    EpisodeItemModel(
      title: 'Wall Frame',
      duration: 14.07,
      url: "https://raw.githubusercontent.com/Biteffort/Assets/master/frame.glb",
      imageUrl:
          'https://raw.githubusercontent.com/Biteffort/Assets/master/Screenshot%20from%202020-05-22%2012-12-41.png',
    ),
    EpisodeItemModel(
      title: 'Hot Rockets - Chicken Broccli',
      duration: 14.07,
      url: "https://raw.githubusercontent.com/Biteffort/Assets/master/rockets.glb",
      imageUrl:
      'https://raw.githubusercontent.com/Biteffort/Assets/master/rockets.png',
    ),
    EpisodeItemModel(
        title: 'Chair',
        duration: 18.54,
        url: "https://raw.githubusercontent.com/Biteffort/Assets/master/chair.glb",
        imageUrl:
            'https://raw.githubusercontent.com/Biteffort/Assets/master/Screenshot%20from%202020-05-22%2012-20-27.png'),
    EpisodeItemModel(
        title: 'Samsung Television',
        duration: 14.55,
        url: "https://raw.githubusercontent.com/Biteffort/Assets/master/monitor.glb",
        imageUrl:
        'https://raw.githubusercontent.com/Biteffort/Assets/master/Screenshot%20from%202020-05-22%2012-23-40.png'),
    EpisodeItemModel(
        title: 'Home Lamp',
        duration: 14.55,
        url: "https://raw.githubusercontent.com/Biteffort/Assets/master/lamp.glb",
        imageUrl:
        'https://raw.githubusercontent.com/Biteffort/Assets/master/Screenshot%20from%202020-05-22%2012-29-25.png'),
  ];


   @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      children: <Widget>[
        ...episodes.map(
          (episode) => EpisodeItem(model: episode),
        )
      ],
    );
  }
}
