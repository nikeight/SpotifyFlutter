
// Get single Album track data
String get_single_album_endpoint(String albumId) => "https://api.spotify.com/v1/albums/$albumId";

// Get single Album track data
String get_album_tracks_endpoint(String albumId) => "https://api.spotify.com/v1/albums/$albumId/tracks";

// Get Multiple album track data
// Todo : Make String parameter to List
String get_multiple_albums_tracks_endpoint(String albumId) => "https://api.spotify.com/v1/albums/$albumId/tracks";
