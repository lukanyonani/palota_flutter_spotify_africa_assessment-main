import 'package:flutter/material.dart';
import 'package:flutter_spotify_africa_assessment/colors.dart';
import 'package:flutter_spotify_africa_assessment/features/spotify/presentation/controllers/spotify_controller.dart';
import 'package:flutter_spotify_africa_assessment/routes.dart';
import 'package:get/get.dart';

class GridWidget extends StatelessWidget {
  final SpotifyController playlistController = Get.put(SpotifyController());
  GridWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (playlistController.playlists.isEmpty) {
          return const Center(child: CircularProgressIndicator()); // Show a loading indicator while playlists are being fetched
        } else {
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            //padding: const EdgeInsets.only(left: 24.0, right: 24.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: playlistController.playlists.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.spotifyPlaylist, arguments: playlistController.playlists[index]['id']);
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 18.0, right: 18.0, bottom: 14.0),
                  child: _gridItem(index),
                ),
              );
            },
          );
        }
      },
    );
  }

  Container _gridItem(int index) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  playlistController.playlists[index]['images'][0]['url'],
                  width: 155,
                  height: 155,
                ),
              ),
              Flexible(
                child: Text(
                  playlistController.playlists[index]['name'],
                  style: const TextStyle(color: AppColors.tileTitle),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
