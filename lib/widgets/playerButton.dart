import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class PlayerButtons extends StatelessWidget {
  const PlayerButtons({super.key, required this.audioPlayer});

  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StreamBuilder<SequenceState?>(
          stream: audioPlayer.sequenceStateStream,
          builder: (context, snapshot) {
            return IconButton(
              iconSize: 46,
              onPressed: audioPlayer.hasPrevious ? audioPlayer.seekToPrevious : null ,
              icon: Icon(Icons.skip_previous, color: Colors.white,)
            );
          },
        ),
        StreamBuilder<PlayerState>(
          stream: audioPlayer.playerStateStream,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              final playerState = snapshot.data;
              final processingState = playerState!.processingState;

              if(processingState == ProcessingState.loading || processingState == ProcessingState.buffering){
                return Container(
                  width: 60,
                  height: 60,
                  margin: const EdgeInsets.all(10.0),
                  child: const CircularProgressIndicator(),
                );
              }else if(!audioPlayer.playing){
                return IconButton(onPressed: audioPlayer.play, icon: Icon(Icons.play_circle, color: Colors.white), iconSize: 75);
              }else if(processingState != ProcessingState.completed){
                return IconButton(onPressed: audioPlayer.pause, icon: Icon(Icons.pause_circle, color: Colors.white), iconSize: 75);
              }else{
                  return IconButton(onPressed: () => audioPlayer.seek(
                    Duration.zero,
                    index: audioPlayer.effectiveIndices!.first
                  ), icon: Icon(Icons.replay_circle_filled_outlined, color: Colors.white), iconSize: 75);
              }

            }

            return  const CircularProgressIndicator();
          },
        ),
        StreamBuilder<SequenceState?>(
          stream: audioPlayer.sequenceStateStream,
          builder: (context, snapshot) {
            return IconButton(
              iconSize: 46,
              onPressed: audioPlayer.hasNext ? audioPlayer.seekToNext : null ,
              icon: Icon(Icons.skip_next, color: Colors.white,)
            );
          },
        ),
      ],
    );
  }
}