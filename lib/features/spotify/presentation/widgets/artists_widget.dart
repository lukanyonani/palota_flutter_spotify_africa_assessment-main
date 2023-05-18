import 'package:flutter/material.dart';
import 'package:flutter_spotify_africa_assessment/features/spotify/data/datasources/api_service.dart';
import 'package:get/get.dart';

class ArtistWidget extends StatefulWidget {
  final String artistId;  

  ArtistWidget({
    super.key, required this.artistId,
  });

  

  @override
  State<ArtistWidget> createState() => _ArtistWidgetState();
}

class _ArtistWidgetState extends State<ArtistWidget> {
  final ApiServices _controller =
      Get.find<ApiServices>();
  late Future<dynamic> artists;


  @override
  void initState() {
    super.initState();
    artists = _controller.fetchSpecificArtist(widget.artistId);
    
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder(
        future: artists,
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            String image = snapshot.data['images'][0]['url'];
            String name = snapshot.data['name'];
            return Padding(
            padding: const EdgeInsets.only(
              left: 32.0,
            ),
            child: SizedBox(
              width: 120,
              child: Column(
                children: [
                  ClipRRect(
                  borderRadius: BorderRadius.circular(32.0),
                  child: Image.network(
                    image,
                    width: 120,
                    height: 120,
                    ),
                  ),
                  const SizedBox(height: 9.35),
                  Text(name)
                ],
              ),
            ),
          );
          } else {
            return const Text('No data available');
          }
        },
      ),
    );
    
  }
}
