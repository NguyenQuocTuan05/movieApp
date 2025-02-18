class SortFilter {
  final Map<String, String> categories = {
    'movie': 'Movie',
  };
  final Map<String, String> time_periods = {
    '': 'All periods',
    '2024': '2024',
    '2023': '2023',
    '2022': '2022',
    '2021': '2021',
    '2020': '2020',
    '2019': '2019',
    '2018': '2018',
    '2017': '2017',
    '2016': '2016',
    '2015': '2015',
    '2014': '2014',
  };
  final Map<String, String> sort = {
    'release_date.desc': 'Laster Release',
    'popularity.desc': 'Popularity',
  };
  Map<String, String> languageMap = {
    '': 'All regions',
    'en': 'English',
    'es': 'Spanish',
    'fr': 'French',
    'de': 'German',
    'it': 'Italian',
    'ja': 'Japanese',
    'ko': 'Korean',
    'zh': 'Chinese',
    'nl': 'Netherlands',
    'hi': 'India',
    'lv': 'Latvian',
    'pt': 'Portuguese'
  };
  Map<String, String> genreMap = {
    "28": "Action",
    "12": "Adventure",
    "16": "Animation",
    "35": "Comedy",
    "80": "Crime",
    "99": "Documentary",
    "18": "Drama",
    "10751": "Family",
    "14": "Fantasy",
    "36": "History",
    "27": "Horror",
    "10402": "Music",
    "9648": "Mystery",
    "10749": "Romance",
    "878": "Science Fiction",
    "53": "Thriller",
    "10752": "War",
    "37": "Western",
    "10770": "TV Movie"
  };
}
