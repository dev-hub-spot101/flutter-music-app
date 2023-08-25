import 'package:flutter/material.dart';
import 'package:music_app/models/playlistModel.dart';
import 'package:music_app/screens/songs.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Playlist playlist = Playlist.Playlists[0];
    
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.deepPurpleAccent.shade700.withOpacity(0.8),
            Colors.deepPurpleAccent.shade200.withOpacity(0.8),
          ]
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text("Playlist"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                PlayListInformation(playlist:playlist),
                const SizedBox(height: 30),
                const PlayOrSuffleSwitch(),
                PlaylistSongs(playlist:playlist)
              ],
            ),
          ),
        )
      ),
    );
  }
}


class PlayListInformation extends StatelessWidget {
  const PlayListInformation({super.key, required this.playlist});

  final Playlist playlist;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Image.network(
            playlist.imageurl,
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.height * 0.5,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 30,),
        Text(
          playlist.title, style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}



class PlayOrSuffleSwitch extends StatefulWidget {
  const PlayOrSuffleSwitch({super.key});

  @override
  State<PlayOrSuffleSwitch> createState() => _PlayOrSuffleSwitchState();
}

class _PlayOrSuffleSwitchState extends State<PlayOrSuffleSwitch> {
  bool isPlay = true;

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;


    return GestureDetector(
      onTap: (){
        setState(() {
          isPlay = !isPlay;
        });
      },
      child: Container(
        height: 50,
        width:  width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(microseconds: 200),
              left: isPlay ? 0 : width * 0.45,
              child: Container(
                height: 50,
                width: width * 0.45,
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade400,
                  borderRadius: BorderRadius.circular(15)
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                      Center(
                        child: Text("Play", style: TextStyle(
                          color: isPlay ? Colors.white : Colors.deepPurpleAccent,
                          fontSize: 16
                        ),),
                      ),
                      const SizedBox(width: 10),
                      Icon(Icons.play_circle, color: isPlay ? Colors.white : Colors.deepPurpleAccent,)
                     ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text("Shuffle", style: TextStyle(
                          color: isPlay ? Colors.deepPurpleAccent : Colors.white,
                          fontSize: 16
                        ),),
                      ),
                      const SizedBox(width: 10),
                      Icon(Icons.shuffle, color: isPlay ? Colors.deepPurpleAccent : Colors.white,)
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}


class PlaylistSongs extends StatelessWidget {
  const PlaylistSongs({super.key, required this.playlist});

  final Playlist playlist;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: playlist.songs.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
             Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const SongsScreen()));
          },
          leading: Text(
            '${index +1}', style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
          ),
          title: Text(
            playlist.songs[index].title, style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
          ),
          subtitle: Text('${playlist.songs[index].description} . 02:40'),
          trailing: const Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
        );
      },
    );
  }
}