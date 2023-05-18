import 'package:flutter_spotify_africa_assessment/features/spotify/data/datasources/api_service.dart';
import 'package:flutter_spotify_africa_assessment/features/spotify/data/models/spotify_models.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class SpotifyController extends GetxController {
  var playlists = [].obs;
  var category = PlaylistCategory(href: '', iconss: [], name: '', type: '', id: '').obs;
  var singlePlaylist = Playlist(id: '', featureImage: '', name: '', description: '', followers: 0, tracks: [], uniqueArtists: []).obs;
 

  @override
  void onInit() {
    super.onInit();
    fetchPlaylistCategory();
    fetchListOfPlaylists();
    
  }

  Future<void> fetchListOfPlaylists() async {
    playlists.value = await ApiServices.fetchPlayLists();
  }

  Future<void> fetchPlaylistCategory() async {
    try {
      var playlistCategory = await ApiServices.fetchPlaylistCategory();
      category.value = playlistCategory;
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> fetchPlaylist(String playlistId) async {
    try {
      var playlistItems = await ApiServices.fetchSinglePlaylist(playlistId);
      singlePlaylist.value = playlistItems;
    } catch (e) {
      print('Error: $e');
    }
  }

}

