class VideoFilm {
  late String id;
  VideoFilm({required this.id});
  String getVideoUrl() {
    return 'https://www.youtube.com/watch?v=$id';
  }

  String getImageVideoUrl() {
    return 'https://img.youtube.com/vi/$id/0.jpg';
  }
}
