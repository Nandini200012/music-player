import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musicplayer2/screens/nowplaying.dart';

class NewPlaying extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  NewPlaying({super.key});

  @override
  State<NewPlaying> createState() => _NewPlayingState();
}

class _NewPlayingState extends State<NewPlaying>
    with SingleTickerProviderStateMixin {
  late AnimationController iconController;
  bool isAnimated = false;
  bool showPlay = true;
  bool showPause = false;

  AssetsAudioPlayer player = AssetsAudioPlayer();
  // ignore: non_constant_identifier_names

// ignore: unused_element
// assetsAudioPlayer.current //ValueObservable<PlayingAudio>

// //Retrieve directly the current played asset
// final PlayingAudio playing = assetsAudioPlayer.current.value;

// //Listen to the current playing song
// assetsAudioPlayer.current.listen((playingAudio){
//     final asset = playingAudio.assetAudio;
//     final songDuration = playingAudio.duration;
// })

  // ignore: non_constant_identifier_names

  @override
  void initState() {
    super.initState();

    iconController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    iconController.forward().then((value) {
      iconController.reverse();
      player.open(
        Playlist(audios: [
          Audio('assets/audiio/Charlie-Puth-Cheating-on-You.mp3'),
          Audio('assets/audiio/sample1.wav'),
          Audio('assets/audiio/Jhoome Jo Pathaan(PagalWorld.com.se).mp3'),
          Audio('assets/audiio/Besharam Rang(PagalWorld.com.se).mp3'),
          Audio('assets/audiio/Srivalli(PagalWorld.com.se).mp3'),
          Audio('assets/audiio/Thank God(PagalWorld.com.se).mp3'),
          Audio('aassets/audiio/Manike(PagalWorld.com.se).mp3'),
          Audio('assets/audiio/sample1.wav'),
        ]),
        loopMode: LoopMode.playlist, //loop the full playlist

        autoStart: false,
        showNotification: true,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        height: 900,
        width: 500,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.indigoAccent.shade400,
            Colors.indigo.shade800,
            Colors.black,
            Colors.black,
            Colors.black
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //nowplayingAppBar('New Playing'),
            const SizedBox(
              height: 50,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: SizedBox(
                height: 400,
                width: 300,
                child: Image.asset(
                  'assets/images/bg.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (() {
                      player.seekBy(const Duration(seconds: -10));
                    }),
                    child: const Icon(
                      CupertinoIcons.gobackward_10,
                      color: Colors.white70,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (() {
                      player.previous();
                    }),
                    child: const Icon(
                      CupertinoIcons.backward_end_fill,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      AnimateIcon();
                    },
                    child: AnimatedIcon(
                      icon: AnimatedIcons.play_pause,
                      progress: iconController,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (() {
                      player.next();
                    }),
                    child: const Icon(
                      CupertinoIcons.forward_end_fill,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (() {
                      player.seekBy(const Duration(seconds: 10));
                    }),
                    child: const Icon(
                      CupertinoIcons.goforward_10,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }

  // ignore: non_constant_identifier_names
  void AnimateIcon() {
    setState(() {
      isAnimated = !isAnimated;
      isAnimated ? iconController.forward() : iconController.reverse();
      if (isAnimated) {
        iconController.forward();
        player.playlistPlayAtIndex(4);
      } else {
        iconController.reverse();
        player.pause();
      }
    });
  }
}
