
// Todo : Create one domain Endpoint and append different endpoints to it.

// Get Access token Endpoint
const SPOTIFY_ACCESS_TOKEN_ENDPOINT = "https://accounts.spotify.com/api/token";

// Get single Album track data
String get_single_album_endpoint(String albumId) => "https://api.spotify.com/v1/albums?ids=$albumId";

// Get single Album track data
String get_album_tracks_endpoint(String albumId) => "https://api.spotify.com/v1/albums/$albumId/tracks";

// Get Multiple album track data
// Todo : Make String parameter to List
String get_multiple_albums_tracks_endpoint(String albumId) => "https://api.spotify.com/v1/albums/$albumId/tracks";

// Get Categories
String get_spotify_search_categories_endpoint = "https://api.spotify.com/v1/browse/categories";

const SPOTIFY_ACCESS_TOKEN_KEY = "spotify_access_token";
const LAST_SAVED_TIME_IN_MS_KEY = "last_saved_time_in_ms";