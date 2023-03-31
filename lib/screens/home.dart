// ignore_for_file: sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:musicplayer2/screens/library.dart';
//import 'package:musicplayer2/colors/colors.dart';
import 'package:musicplayer2/models/songmodel.dart';
import 'package:musicplayer2/widgets/FullSOngWidget.dart';
import 'package:musicplayer2/widgets/appbar.dart';

//import 'package:musicplayer2/widgets/grid.dart';
// ignore: must_be_immutable
class Home extends StatelessWidget {
  // Function miniPlayerHome;
  //Home(this.miniPlayerHome, {super.key});

  final box = SongBox.getInstance();
  Home({super.key});
  //const Home({super.key});
  @override
  Widget build(BuildContext context) {
    List<Songs> dbsongs = box.values.toList();
    double vwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Expanded(
        child: Container(
          height: 900,
          width: 500,
          // decoration: BoxDecoration(
          //   gradient: LinearGradient(colors: [
          //     Colors.indigoAccent.shade400,
          //     Colors.indigo.shade800,
          //     Colors.black,
          //     Colors.black,
          //     Colors.black
          //   ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          // ),
          child: Column(
            children: [
              createAppBar('Home'),
              //createGrid(),
              Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, bottom: 8),
                            child: Text(
                              'All Songs',
                              style: GoogleFonts.cuprum(
                                  color: Colors.white54,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(90.0),
                              child: Container(
                                color: Color.fromARGB(70, 7, 15, 76),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // IconButton(
                                    //   onPressed: () {},
                                    //   icon: Icon(
                                    //     Icons.shuffle_outlined,
                                    //     color: Colors.white54,
                                    //     size: 25,
                                    //   ),
                                    // ),
                                    TextButton(
                                        onPressed: () {},
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.play_arrow,
                                              color: Colors.white,
                                              size: 35,
                                            ),
                                            // SizedBox(
                                            //   width: 5,
                                            // ),
                                            // Text(
                                            //   'Play all',
                                            //   style: TextStyle(
                                            //       color: Colors.white,
                                            //       fontSize: 10),
                                            // )
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      //songsListView(),
                      //PlayList(),
                      AllSongsWidget(),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}

class MyClip extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, 100, 100);
  }

  @override
  bool shouldReclip(oldClipper) {
    return false;
  }
}

//final OnAudioQuery _audioQuery = OnAudioQuery();




























// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:on_audio_query/on_audio_query.dart';

// // import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:musicplayer2/screens/library.dart';

// // import 'package:musicplayer2/widgets/appbar.dart';
// // import 'package:musicplayer2/widgets/grid.dart';
// // import 'package:musicplayer2/widgets/list_songs.dart';
// // import 'package:musicplayer2/widgets/songListView.dart';
// // //import 'package:musicplayer2/widgets/list_songs.dart';
// // import 'package:on_audio_query/on_audio_query.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   //on audio query plugin
//   final OnAudioQuery _audioQuery = OnAudioQuery();

// //player
//   final AudioPlayer _player = AudioPlayer();


//   //initial state method to request storage permission
//   @override
//   void initState() {
//     super.initState();
//     requestStoragePermission();
//   }

//   @override
//   void dispose() {
//     _player.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//         length: 3,
//         child: Scaffold(
//           backgroundColor: Colors.black,
//           appBar: AppBar(
//             backgroundColor: Colors.transparent,
//             bottom: const TabBar(
//               tabs: [
//                 Tab(icon: Icon(Icons.music_note_outlined), text: "songs"),
//                 Tab(icon: Icon(Icons.playlist_play), text: "Playlists"),
//                 Tab(icon: Icon(Icons.folder_outlined), text: "Folders"),
//               ],
//             ),
//             title: const Text('Resfy player',
//                 style: TextStyle(fontStyle: FontStyle.italic)),
//           ),
//           body: TabBarView(children: [
//             songsListView(),
//             const Center(
//               child: Text(
//                 "Your Favorite list of  songs here...",
//                 style: TextStyle(color: Colors.white30, fontSize: 25),
//               ),
//             ),
//             const Center(
//               child: Text(
//                 "Songs in their bags goes here...",
//                 style: TextStyle(color: Colors.white30, fontSize: 25),
//               ),
//             ),
//           ]),
//         ));
//   }

//   //request permission
//   void requestStoragePermission() async {
//     //only if platform is not web
//     if (!kIsWeb) {
//       //check if not permission status
//       bool status = await _audioQuery.permissionsStatus();
//       //request it if not given
//       if (!status) {
//         await _audioQuery.permissionsRequest();
//       }
//       //make sure set state method is called
//       setState(() {});
//     }
//   }

//   Widget songsListView() {
//     //use future builder to create a list view with songs
//     return FutureBuilder<List<SongModel>>(
//       future: _audioQuery.querySongs(
//         sortType: SongSortType.DATE_ADDED,
//         orderType: OrderType.DESC_OR_GREATER,
//         uriType: UriType.EXTERNAL,
//         ignoreCase: true,
//       ),
//       builder: (context, item) {
//         //loading content indicator
//         if (item.data == null) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         } else if (item.data!.isEmpty) {
//           return const Center(
//             child: Text(
//               "No Songs Found!!, Add Some",
//               style: TextStyle(color: Colors.white30),
//             ),
//           );
//         }
//         //songs are available build list view
//         List<SongModel> songs = item.data!;  
//         return ListView.builder(
//           itemCount: songs.length,
//           itemBuilder: (context, index) {
//             //   return Text(songs.elementAt(index).displayName, style: const TextStyle(color: Colors.white60),);

//             return InkWell(
//                 onTap: () async {
//                   //showToast(context, songs[index].displayName);
//                   //play song
//                   await _player.setAudioSource(
//                       AudioSource.uri(Uri.parse(songs[index].uri!)));
//                   await _player.play();
//                 },
                  


                  







//                 child: Container(
//                   margin:
//                       const EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
//                   padding: const EdgeInsets.only(
//                       top: 20.0, bottom: 20.0, right: 10, left: 10),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(4.0),
//                     border: Border.all(
//                         color: Colors.white70,
//                         width: 1.0,
//                         style: BorderStyle.solid),
//                   ),
//                   child: Text(
//                     songs.elementAt(index).displayName,
//                     style: const TextStyle(color: Colors.white60),
//                   ),
//                 ));
//           },
//         );
//       },
//     );
//   }
// }
