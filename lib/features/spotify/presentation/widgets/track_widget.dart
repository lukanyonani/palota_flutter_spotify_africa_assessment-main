import 'package:flutter/material.dart';

String formatDuration(int durationInSeconds) {
  int minutes = (durationInSeconds ~/ 60) % 60;
  int seconds = durationInSeconds % 60;
  
  String formattedMinutes = minutes.toString().padLeft(2, '0');
  String formattedSeconds = seconds.toString().padLeft(2, '0');
  
  return "$formattedMinutes:$formattedSeconds";
}

class TrackWidget extends StatelessWidget {
  final String trackArtist;
  final String trackTitle;
  final String trackImageUrl;
  final int trackDuration;

  TrackWidget({
    super.key, required this.trackArtist, required this.trackTitle, required this.trackImageUrl, required this.trackDuration,
  });

  @override
  Widget build(BuildContext context) {
    String duration = formatDuration(trackDuration); 
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0, left: 8.0, right: 8.0),
      child: SizedBox(
        width: 358,
        height: 48,
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  trackImageUrl,
                  width: 48,
                  height: 48,
                ),
              ),
            
            const SizedBox(
              width: 16,
            ),
            Container(
              width: 260,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(trackTitle), 
                  Expanded(
                    child: Text(trackArtist, 
                    overflow: TextOverflow.ellipsis, 
                    maxLines: 2,),
                  )] 
              ),
            ),
            const Expanded(child: SizedBox()),

            Text(duration)
          ],
        ),
      ),
    );
  }

  
}
