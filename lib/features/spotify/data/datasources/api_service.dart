import 'package:flutter_spotify_africa_assessment/features/spotify/data/models/spotify_models.dart';
import 'package:flutter_spotify_africa_assessment/features/spotify/domain/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiServices {
  
  static var client = http.Client();

  static Future<PlaylistCategory> fetchPlaylistCategory() async {
    var response = await http.get(
        Uri.parse(Constants.baseUrl + Constants.categoryUrl),
        headers: Constants.headers);
    // Check if the API request was successful (HTTP status code 200)
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      return PlaylistCategory.fromJson(json);
    } else {
      throw Exception('Failed to fetch playlist category');
    }
  }

  static Future<Playlist> fetchSinglePlaylist(String playlistId) async {
    var response = await http.get(
        Uri.parse(Constants.baseUrl + Constants.singlePlaylistUrl + playlistId),
        headers: Constants.headers);
    // Check if the API request was successful (HTTP status code 200)
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Playlist.fromJson(json);

    } else {
      throw Exception('Failed to fetch playlist category');
    }
  }


  static Future<dynamic> fetchPlayLists() async {
  List playlists = [];
  var url = Uri.parse(
      'https://palota-jobs-africa-spotify-fa.azurewebsites.net/api/browse/categories/afro/playlists');

  var response = await http.get(url, headers: {
    'Content-Type': 'application/json',
    'x-functions-key':
        '_q6Qaip9V-PShHzF8q9l5yexp-z9IqwZB_o_6x882ts3AzFuo0DxuQ==',
     });

    if (response.statusCode == 200) {
      // Request successful
      var playlistData = jsonDecode(response.body);
      playlists = playlistData['playlists']['items'] as List;
      return playlists;
    } else {
      // Request failed
      return [];
    }
  }

  ///
  ///
  Future<dynamic> fetchSpecificArtist(String artistId) async {
  var url = Uri.parse(
      'https://palota-jobs-africa-spotify-fa.azurewebsites.net/api/artists/$artistId');

  var response = await http.get(url, headers: {
    'Content-Type': 'application/json',
    'x-functions-key':
        '_q6Qaip9V-PShHzF8q9l5yexp-z9IqwZB_o_6x882ts3AzFuo0DxuQ==',
  });

  if (response.statusCode == 200) {
    // Request successful
    var artistData = jsonDecode(response.body);

    return artistData;
  } else {
    // Request failed
    return [];
  }
  }

}
