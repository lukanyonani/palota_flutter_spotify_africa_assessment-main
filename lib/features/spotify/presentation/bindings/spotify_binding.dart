import 'package:flutter_spotify_africa_assessment/features/spotify/data/datasources/api_service.dart';
import 'package:flutter_spotify_africa_assessment/features/spotify/presentation/controllers/spotify_controller.dart';
import 'package:get/get.dart';

class SpotifyBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<ApiServices>(ApiServices());
    Get.put<SpotifyController>(SpotifyController());
    
  }
}
