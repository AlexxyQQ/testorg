class ApiEndpoints {
  static const String baseURL = "http://192.168.0.107:3001/api";
  static const String baseImageUrl = 'http://192.168.0.107:3001/';
  static const String socketURL = "http://localhost:3002";
  static const Map<String, dynamic> defaultHeaders = {
    'apisecret': "Apple",
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };
  static const int connectionTimeout = 5000;
  static const int receiveTimeout = 60000;

  // Endpoints
  static const String baseRoute = "/";
  static const String loginWithTokenRoute = "/users/loginWithToken";
  static const String loginRoute = "/users/login";
  static const String signupRoute = "/users/signup";
  static const String uploadProfilePicRoute = "/users/uploadProfilePic";
  static const String deleteUserRoute = "/users/deleteUser";
  // Music Endpoints
  static const String uploadAlbumArtRoute = '/music/uploadAlbumArt';
  static const String addAllSongsRoute = '/music/addAllSongs';
  static const String getAllSongsRoute = '/music/getAllSongs';
  static const String getAllPublicSongsRoute = '/music/getAllPublicSongs';
  static const String getAllFolderWithSongsRoute =
      '/music/getAllFolderWithSongs';
  static const String getAllFoldersRoute = '/music/getAllFolders';
  static const String getFolderSongsRoute = '/music/getFolderSongs';
  static const String addFoldersRoute = '/music/addFolders';
  static const String getAllArtistWithSongsRoute =
      '/music/getAllArtistWithSongs';
  static const String addAlbumsRoute = '/music/addAlbums';
  static const String getAllAlbumsRoute = '/music/getAllAlbums';
  static const String getAllAlbumWithSongsRoute = '/music/getAllAlbumWithSongs';
  static const String addToPlaylistRoute = '/music/addToPlaylist';
  static const String createPlaylistRoute = '/music/createPlaylist';
  static const String getPlaylistsRoute = '/music/getPlaylists';
  static const String toogleSongPublicRoute = '/music/tooglePublic';
  static const String deleteSongRoute = '/music/deleteSong';
}
