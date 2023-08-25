
import 'package:flutter/material.dart';
import 'package:music_app/models/playlistModel.dart';
import 'package:music_app/models/songModel.dart';
import 'package:music_app/widgets/playlistCard.dart';
import 'package:music_app/widgets/sectionheader.dart';
import 'package:music_app/widgets/songCard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    List<Song> songs = Song.songs;
    List<Playlist> playlists = Playlist.Playlists;
    
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.deepPurpleAccent.shade700.withOpacity(0.8),
            Colors.deepPurpleAccent.shade100.withOpacity(0.8),
          ]
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const CustomAppBar(),
        bottomNavigationBar: const CustomBottomNavBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const DiscoverMusic(),
              TrendingMusic(songs:songs),
              PlaylistMusic(playlists:playlists)
            ],
          ),
        )
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: const Icon(Icons.grid_view_rounded),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 20),
          child: const CircleAvatar(
            backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1576525865260-9f0e7cfb02b3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1364&q=80'
            ),
          ),
        )
      ],
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(56.0);

}


class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.deepPurple.shade800,
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.white,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: "Favorites"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.play_circle_outlined),
          label: "Play"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people_outline),
          label: "Profile"
        )
      ],
    );
  }
}

class DiscoverMusic extends StatelessWidget {
  const DiscoverMusic({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Welcome", style: Theme.of(context).textTheme.bodyLarge,),
          const SizedBox(height: 5,),
          Text("Enjoy your favorite music", style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.bold),),
          const SizedBox(height: 20,),
          TextFormField(
            decoration: InputDecoration(
              isDense: true,
              filled: true,
              fillColor: Colors.white,
              hintText: "Search",
              hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.grey.shade400
              ),
              prefixIcon: Icon(Icons.search, color: Colors.grey.shade400,),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide.none
              )
            ),
          )

        ],
      ),
    );
  }
}

class TrendingMusic extends StatelessWidget {
  const TrendingMusic({super.key, required this.songs});

  final List<Song> songs;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20.0,
        top: 20.0,
        bottom: 20.0
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: SectionHeader(title:"Trending Music"),
          ),
          const SizedBox(height: 20,),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.27,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: songs.length,
              itemBuilder: ((context, index) {
                return SongCard(song:songs[index]);
              }),
            ),
          )
        ],
      ),
    );
  }
}


class PlaylistMusic extends StatelessWidget {
  const PlaylistMusic({super.key, required this.playlists});

  final List<Playlist> playlists;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SectionHeader(title: "Playlists"),
          ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.only(top:20),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: playlists.length,
            itemBuilder: (context, index) {
              return PlaylistCard(playlist: playlists[index]);
            },
          )
        ],
      ),
    );
  }
}
