class ImageFilm {
  late String poster_path;
  ImageFilm({required this.poster_path});
  String getPosterUrl() {
    if (poster_path == "default_poster_path.jpg" || poster_path.isEmpty) {
      return 'https://dummyimage.com/500x750/000/fff.png&text=No+Image';
    }
    return 'https://image.tmdb.org/t/p/w154$poster_path';
  }

  String getProfileUrl() {
    return poster_path.isNotEmpty
        ? 'https://image.tmdb.org/t/p/w45$poster_path'
        : 'https://via.placeholder.com/500x750?text=No+Image';
  }
}
