//Playlist Category

class PlaylistCategory {
  final String href;
  final List<Iconss> iconss;
  final String name;
  final String type;
  final String id;

  PlaylistCategory({
    required this.href,
    required this.iconss,
    required this.name,
    required this.type,
    required this.id,
  });

  factory PlaylistCategory.fromJson(Map<String, dynamic> json) {
    return PlaylistCategory(
      href: json['href'],
      iconss: List<Iconss>.from(
          json['icons'].map((iconJson) => Iconss.fromJson(iconJson))),
      name: json['name'],
      type: json['type'],
      id: json['id'],
    );
  }
}

class Iconss {
  final int? height;
  final String url;
  final int? width;

  Iconss({
    this.height,
    required this.url,
    this.width,
  });

  factory Iconss.fromJson(Map<String, dynamic> json) {
    return Iconss(
      height: json['height'],
      url: json['url'],
      width: json['width'],
    );
  }
}

//Playlists
class PlaylistModel {
  final String id;
  final String name;
  final String image;
  final String description;

  PlaylistModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.description});

  factory PlaylistModel.fromJson(Map<String, dynamic> json) {
    return PlaylistModel(
      id: json['id'],
      name: json['name'],
      image: json['images'][0]['url'],
      description: json['description'],
    );
  }
}


//Single playlist
class Playlist {
  String id;
  String featureImage;
  String name;
  String description;
  int followers;
  List<Track> tracks;
  List<Artist> uniqueArtists;

  Playlist({
    required this.id,
    required this.featureImage,
    required this.name,
    required this.description,
    required this.followers,
    required this.tracks,
    required this.uniqueArtists,
  });

  factory Playlist.fromJson(Map<String, dynamic> json) {
    // Extract playlist information
    String id = json['id'];
    String featureImage = json['images'][0]['url'];
    String name = json['name'];
    String description = json['description'];
    int followers = json['followers']['total'];

    // Extract track information
    List<Track> tracks = (json['tracks']['items'] as List<dynamic>)
        .map((item) => Track.fromJson(item['track']))
        .toList();

    // Extract unique artist information
    List<Artist> uniqueArtists =
        (json['tracks']['items'] as List<dynamic>).expand((item) {
      List<dynamic> artistsData = item['track']['artists'];
      return artistsData
          .map((artist) => Artist.fromJson(artist))
          .toSet()
          .toList();
    }).toList();

    return Playlist(
      id: id,
      featureImage: featureImage,
      name: name,
      description: description,
      followers: followers,
      tracks: tracks,
      uniqueArtists: uniqueArtists,
    );
  }
}

class Track {
  String albumImage;
  String trackName;
  String artists;
  int duration;

  Track({
    required this.albumImage,
    required this.trackName,
    required this.artists,
    required this.duration,
  });

  factory Track.fromJson(Map<String, dynamic> json) {
    List<dynamic> artistsData = json['artists'];
    String albumImage = json['album']['images'][0]['url'];
    String trackName = json['name'];
    String artists = artistsData.map((artist) => artist['name']).join(', ');
    int duration = json['duration_ms'];

    return Track(
      albumImage: albumImage,
      trackName: trackName,
      artists: artists,
      duration: duration,
    );
  }
}

class Artist {
  String id;
  String name;

  Artist({
    required this.name,required this.id,
  });

  factory Artist.fromJson(Map<String, dynamic> json) {
    return Artist(
      id: json['id'],
      name: json['name'],
    );
  }
}

class ArtistDetails {
  String name;
  String image;

  ArtistDetails({required this.name, required this.image});

  factory ArtistDetails.fromJson(Map<String, dynamic> json) {
    return ArtistDetails(
      name: json['name'] ?? '',
      image: json['image'] ?? '',
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
    };
  }
}

