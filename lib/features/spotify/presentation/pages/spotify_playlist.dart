import 'package:flutter/material.dart';
import 'package:flutter_spotify_africa_assessment/colors.dart';
import 'package:flutter_spotify_africa_assessment/features/spotify/data/models/spotify_models.dart';
import 'package:flutter_spotify_africa_assessment/features/spotify/presentation/controllers/spotify_controller.dart';
import 'package:flutter_spotify_africa_assessment/features/spotify/presentation/widgets/artists_widget.dart';
import 'package:flutter_spotify_africa_assessment/features/spotify/presentation/widgets/featured_widget.dart';
import 'package:flutter_spotify_africa_assessment/features/spotify/presentation/widgets/followers_widget.dart';
import 'package:flutter_spotify_africa_assessment/features/spotify/presentation/widgets/image_box_widget.dart';
import 'package:flutter_spotify_africa_assessment/features/spotify/presentation/widgets/track_widget.dart';
import 'package:get/get.dart';

import '../../data/datasources/api_service.dart';


class SpotifyPlaylist extends StatefulWidget {
  final String playlistId;

  SpotifyPlaylist({Key? key, required this.playlistId}) : super(key: key);

  @override
  State<SpotifyPlaylist> createState() => _SpotifyPlaylistState();
}

class _SpotifyPlaylistState extends State<SpotifyPlaylist> {
  final SpotifyController _controller =
      Get.find<SpotifyController>();
      final ApiServices _apiService =
      Get.find<ApiServices>();
  
      
  @override
  void initState() {
    super.initState();
    _controller.fetchPlaylist(widget.playlistId);
  }

  @override
  Widget build(BuildContext context) {
    var singleList = _controller.singlePlaylist.value;
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor:
            Colors.transparent, // Set the background color to transparent
        elevation: 0, // Remove the shadow
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color:
              AppColors.bckButton, // Set the color of the back button to white
          onPressed: () {
            Get.back(); // Handle the back button press
          },
        ),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<void>(
        future: _controller.fetchPlaylist(widget.playlistId),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } 
        else if (snapshot.connectionState == ConnectionState.done) {
          return _content(singleList);
        } else {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
      },
        
    ),)
  

      
    );
  }

  Column _content(Playlist singleList) {
    return Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          Center(
            child: ImageBoxWidget(
              imageUrl: singleList.featureImage, 
              playListdescription: singleList.description, 
              playlistName: singleList.name,),
          ),
          FollowersWidget(numberOfFollowers: singleList.followers,),
          const SizedBox(
            height: 16,
          ),
          Container(
            height: 4,
            width: 326,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  AppColors.blue,
                  AppColors.cyan,
                  AppColors.green,
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: singleList.tracks.length,
            itemBuilder: (context, index) {
            return TrackWidget(
              trackArtist: singleList.tracks[index].artists, 
              trackImageUrl: singleList.tracks[index].albumImage, 
              trackTitle: singleList.tracks[index].trackName, 
              trackDuration: singleList.tracks[index].duration,);
            }
          ),
          const SizedBox(
            height: 32,
          ),
          const FeaturedWidget(),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            height: 180,
            child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: singleList.uniqueArtists.length,
            itemBuilder: (context, index) {
            return FutureBuilder(
              future: _apiService.fetchSpecificArtist(singleList.uniqueArtists[0].id),
              builder: (BuildContext context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.connectionState == ConnectionState.done) {
                  
                  return ArtistWidget(artistId: singleList.uniqueArtists[index].id,);
                } else {
                  return const Text('No data available');
                }
              },
            );

            }),
          ),
          
          const SizedBox(
            height: 40,
          ),
        ],
      );
  }

}
