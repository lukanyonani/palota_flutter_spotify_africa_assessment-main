import 'package:flutter/material.dart';
import 'package:flutter_spotify_africa_assessment/colors.dart';
import 'package:flutter_spotify_africa_assessment/features/spotify/presentation/controllers/spotify_controller.dart';
import 'package:get/get.dart';

class ImageBoxWidget extends StatelessWidget {
  final SpotifyController playlistController = Get.put(SpotifyController());
  final String imageUrl; 
  final String playlistName;
  final String playListdescription;

  ImageBoxWidget({
    super.key, required this.imageUrl, required this.playlistName, required this.playListdescription,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 335,
          width: 294,
          decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(24)),
          child: Column(
            children: [
              const SizedBox(
                height: 14.34,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  imageUrl,
                  width: 263,
                  height: 263,
                ),
              ),
              const SizedBox(
                height: 15.62,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 14.43,
                  ),
                  Text(
                    playlistName,
                    style: const TextStyle(
                      fontFamily: 'Roboto-Regular',
                      fontSize: 22.0,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 16.65,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            playListdescription,
            style: const TextStyle(fontFamily: 'Roboto-Medium', fontSize: 12.0),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
      ],
    );
  }
}
