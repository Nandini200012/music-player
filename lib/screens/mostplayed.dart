import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:musicplayer2/colors/colors.dart';
import 'package:musicplayer2/models/mostplayed.dart';
import 'package:musicplayer2/screens/library.dart';
import 'package:musicplayer2/screens/slider.dart';
import 'package:on_audio_query/on_audio_query.dart';

class MostPlayedScreen extends StatefulWidget {
  const MostPlayedScreen({super.key});

  @override
  State<MostPlayedScreen> createState() => _MostPlayedScreenState();
}

class _MostPlayedScreenState extends State<MostPlayedScreen> {
  final box = MostplayedBox.getInstance();
  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer.withId('0');
  List<Audio> songs = [];
  @override
  void initState() {
    List<MostPlayed> songlist = box.values.toList();

    int i = 0;
    for (var item in songlist) {
      if (item.count > 5) {
        mostfinalsong.insert(i, item);
        i++;
      }
    }
    for (var items in mostfinalsong) {
      songs.add(Audio.file(items.songurl,
          metas: Metas(
              title: items.songname,
              artist: items.artist,
              id: items.id.toString())));
    }
    super.initState();
  }

  List<MostPlayed> mostfinalsong = [];
  @override
  Widget build(BuildContext context) {
    double vheight = MediaQuery.of(context).size.height;
    return Container(
      color: bgcolor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: colordark,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.circular(30)),
                          width: 40,
                          height: 40,
                          child: IconButton(
                            icon: const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Icon(
                                Icons.arrow_back_ios,
                              ),
                            ),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  title: Text(
                    'Most Played',
                    style: GoogleFonts.kanit(fontSize: 20, color: fontcolor),
                  ),
                  subtitle: Text(
                    '${songs.length} Songs',
                    style: GoogleFonts.kanit(
                        fontSize: 14, color: fontcolor.withOpacity(0.7)),
                  ),
                  trailing: Wrap(
                    spacing: 10,
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: colorindigo),
                        child: IconButton(
                          icon: const Icon(
                            Icons.play_arrow,
                            size: 30,
                          ),
                          color: Colors.white,
                          onPressed: () {
                            audioPlayer.open(
                              // Audio.file(allDbsongs[songindex].songurl!),
                              Playlist(audios: songs, startIndex: 0),
                              headPhoneStrategy:
                                  HeadPhoneStrategy.pauseOnUnplugPlayOnPlug,
                              showNotification: true,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                // Icon(Icons.play_arrow)
                ValueListenableBuilder<Box<MostPlayed>>(
                  valueListenable: box.listenable(),
                  builder: (context, Box<MostPlayed> mostplayedDB, child) {
                    return mostfinalsong.isNotEmpty
                        ? (ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: mostfinalsong.length,
                            itemBuilder: ((context, index) => Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 8.0, left: 5),
                                  child: ListTile(
                                    onTap: () {
                                      audioPlayer.open(
                                        // Audio.file(allDbsongs[songindex].songurl!),
                                        Playlist(
                                            audios: songs, startIndex: index),
                                        headPhoneStrategy: HeadPhoneStrategy
                                            .pauseOnUnplugPlayOnPlug,
                                        showNotification: true,
                                      );
                                    },
                                    leading: QueryArtworkWidget(
                                      artworkHeight: vheight * 0.06,
                                      artworkWidth: vheight * 0.06,
                                      keepOldArtwork: true,
                                      artworkBorder: BorderRadius.circular(10),
                                      id: mostfinalsong[index].id,
                                      type: ArtworkType.AUDIO,
                                      nullArtworkWidget: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          'assets/images/music.jpeg',
                                          height: vheight * 0.06,
                                          width: vheight * 0.06,
                                        ),
                                      ),
                                    ),
                                    title: Text(
                                      mostfinalsong[index].songname,
                                      style:
                                          GoogleFonts.kanit(color: fontcolor),
                                    ),
                                    subtitle: Text(mostfinalsong[index].artist,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.kanit(
                                            color: fontcolor.withOpacity(0.7),
                                            fontSize: 12)),
                                  ),
                                )),
                          ))
                        : Center(
                            child: Text(
                              "Your most played songs will appear here!",
                              style: GoogleFonts.kanit(color: fontcolor),
                            ),
                          );
                  },
                ),
              ],
            ),
          ),
          bottomSheet: const NowSlider(),
        ),
      ),
    );
  }
}
