class URL {
  static const String baseUrl = 'https://api.chucknorris.io';
  static const String fiveRandomJokesUrl = '$baseUrl/jokes/search?query=animal';
  static const String iTunesTopAlbumsUrl = 'https://itunes.apple.com/us/rss/topalbums/limit=100/json';
}

class ApiClientConstants{
  static const int apiTimeOut = 1000;
  static const int apiReceiveTimeOut = 1000;
}