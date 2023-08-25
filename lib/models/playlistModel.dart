
import 'package:music_app/models/songModel.dart';

class Playlist{

  final String title;
  final List<Song> songs;
  final String imageurl;

  Playlist({required this.title,required this.songs,required this.imageurl});

  static List<Playlist> Playlists = [
    Playlist(title: "Hip-hop R&B Mix", songs: Song.songs, imageurl: 'https://images.unsplash.com/photo-1576525865260-9f0e7cfb02b3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1364&q=80'),

    Playlist(title: "Rock & Roll", songs: Song.songs, imageurl: 'https://images.unsplash.com/photo-1576525865260-9f0e7cfb02b3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1364&q=80'),

    Playlist(title: "Techno", songs: Song.songs, imageurl: 'https://images.unsplash.com/photo-1594623930572-300a3011d9ae?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2670&q=80')
  ];

}