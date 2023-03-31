import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:musicplayer2/functions/addTofavorite.dart';
import 'package:musicplayer2/models/dbfunctions.dart';
import 'package:musicplayer2/models/mostplayed.dart';
import 'package:musicplayer2/models/songmodel.dart';
import 'package:musicplayer2/screens/splash.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:flutter/material.dart';
import 'package:musicplayer2/screens/slider.dart';

class AllSongsWidget extends StatefulWidget {
  const AllSongsWidget({super.key});

  @override
  State<AllSongsWidget> createState() => _AllSongsWidgetState();
}

final AssetsAudioPlayer player = AssetsAudioPlayer(); //instance of audiplayer

class _AllSongsWidgetState extends State<AllSongsWidget> {
  final box = SongBox.getInstance(); //instance of SOngBox
  bool istaped = true;
  bool isalready = true;
  List<Audio> convertaudio = []; //list with audio type
  List<MostPlayed> mostplayed = mostbox.values.toList();

  @override
  void initState() {
    List<Songs> dbsongs = box.values.toList();
    for (var item in dbsongs) {
      convertaudio.add(Audio.file(item.songurl!,
          metas: Metas(title: item.songname, id: item.id.toString())));
    }
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ValueListenableBuilder<Box<Songs>>(
            valueListenable: box.listenable(),
            builder: ((context, Box<Songs> allsongbox, child) {
              List<Songs> alldbsongs = allsongbox.values.toList();
              if (alldbsongs.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: alldbsongs.length,
                  itemBuilder: ((context, index) {
                    Songs songs = alldbsongs[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8, left: 5),
                      child: ListTile(
                        onTap: () {
                          NowSlider.enteredvalue.value = index;
                          MostPlayed mostsong = mostplayed[index];
                          updatePlayedSongsCount(mostsong, index);
                          print(index);
                          print(alldbsongs[index].songname!);
                        },
                        leading: QueryArtworkWidget(
                          id: alldbsongs[index].id!,
                          type: ArtworkType.AUDIO,
                          keepOldArtwork: true,
                          artworkBorder: BorderRadius.circular(10),
                        ),
                        title: Text(
                          alldbsongs[index].songname!,
                          style: const TextStyle(color: Colors.white),
                        ),
                        trailing: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  showOptions(context, index);
                                },
                                icon: const Icon(
                                  Icons.more_vert,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      ),
                    );
                  }));
            }))
      ],
    );
  }
}

showOptions(BuildContext context, int index) {
  double vwidth = MediaQuery.of(context).size.width;
  showDialog(
      context: context,
      builder: (((context) =>
          StatefulBuilder(builder: (BuildContext context, setState) {
            return AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                insetPadding: EdgeInsets.zero,
                contentPadding: EdgeInsets.zero,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                backgroundColor: Colors.indigo.shade900,
                alignment: Alignment.bottomCenter,
                content: SizedBox(
                  height: 150,
                  width: vwidth,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        TextButton.icon(
                            onPressed: () {
                              if (checkFavoriteStatus(index, BuildContext)) {
                                addToFavourites(index);
                              } else if (!checkFavoriteStatus(
                                  index, BuildContext)) {
                                removefavourite(index);
                              }
                              setState(
                                () {},
                              );
                              Navigator.pop(context);
                            },
                            icon: (checkFavoriteStatus(index, context)
                                ? const Icon(
                                    Icons.favorite_border_outlined,
                                    color: Colors.white,
                                  )
                                : const Icon(
                                    Icons.favorite,
                                    color: Colors.white,
                                  )),
                            label: (checkFavoriteStatus(index, context)
                                ? const Text('Add to favourites',
                                    style: TextStyle(color: Colors.white))
                                : const Text('Remove from favourites',
                                    style: TextStyle(color: Colors.white)))),
                        TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.playlist_add,
                              color: Colors.white,
                            ),
                            label: const Text('Add to playlist',
                                style: TextStyle(color: Colors.white))),
                        TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.repeat,
                              color: Colors.white,
                            ),
                            label: const Text(
                              'Repeat',
                              style: TextStyle(color: Colors.white),
                            )),

                        // ignore: prefer_const_constructors
                      ],
                    ),
                  ),
                ));
          }))));
}
