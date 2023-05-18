import 'package:flutter/material.dart';
import 'package:flutter_spotify_africa_assessment/features/spotify/presentation/controllers/spotify_controller.dart';
import 'package:get/get.dart';
import '../../../../colors.dart';

class HeaderWidget extends StatelessWidget {
  final SpotifyController _controller =
      Get.put(SpotifyController());

  HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, top: 32.0, bottom: 36.0),
      child: Container(
        height: 72,
        width: double.infinity,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
            color: AppColors.secondary,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12.0),
                bottomLeft: Radius.circular(12))),
        child: _builder()
       ),
    );
  }

  FutureBuilder<void> _builder() {
    return FutureBuilder(
    future: _controller.fetchPlaylistCategory(),
    builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      } else if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      } else {
        return Obx(() {
          var category = _controller.category.value;
          // Render your UI using the category object
          return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 4.0,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                category.iconss[0].url,
                width: 64,
                height: 64,
              ),
            ),
            const SizedBox(
              width: 16.0,
            ),
            //Text
            RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: category.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 28),
                  ),
                  const TextSpan(
                      text: ' playlists', style: TextStyle(fontSize: 28)),
                ],
              ),
            )
          ],
        );
        });
      }
    },
  );
  }
}
