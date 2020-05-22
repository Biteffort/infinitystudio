class EpisodeItemModel {
  final String title;
  final double duration;
  final String imageUrl;
  final String url;

  EpisodeItemModel({
    this.title,
    this.duration,
    this.imageUrl,
    this.url,
  });

  EpisodeItemModel.fromJson(Map<String, dynamic> map)
      : title = map['title'],
        duration = map['duration'],
        imageUrl = map['imageUrl'],
        url = map['url'];
}
