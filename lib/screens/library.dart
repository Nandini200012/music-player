import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicplayer2/screens/liked_songs.dart';
import 'package:musicplayer2/screens/mostplayed.dart';
import 'package:musicplayer2/widgets/appbar.dart';
import 'package:musicplayer2/widgets/bottomsheet.temp';
import 'downloads.dart';

class Library extends StatelessWidget {
  const Library({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              createAppBar('Library'),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      'Your PLaylists',
                      style: GoogleFonts.cuprum(
                          color: Colors.white54,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              libraryList(),
              ListTile(
                onTap: () {
                  createshowbottomsheet(context);
                },
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    height: 40,
                    width: 50,
                    color: Colors.indigoAccent,
                    child: const Icon(
                      Icons.playlist_add,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                title: Text(
                  'Create New Playlist',
                  style: GoogleFonts.cuprum(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w700),
                ),
              ),
              //createGrid(),
              //const Gridlist()
            ],
          ),
        ),
      ),
    );
  }
}

List<String> libraryTitle = [
  'Favorites',
  'Most Played',
  'Recently Added',
];
List<IconData> libraryIcon = const [
  (Icons.favorite),
  (Icons.sync),
  (Icons.create_new_folder),
];
List libtab = const [
  LikedSongsList(),
  MostPlayedScreen(),
  //RecentlyPlayed(),
  Downloads()
];

Widget libraryList() {
  return SizedBox(
    height: 190,
    child: ListView.separated(
      scrollDirection: Axis.vertical,
      itemCount: libraryTitle.length + 1,
      separatorBuilder: (BuildContext context, int index) {
        return ListTile(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => libtab[index]));
          },
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              height: 40,
              width: 50,
              color: Colors.indigoAccent,
              child: Icon(
                libraryIcon[index],
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          title: Text(
            libraryTitle[index],
            style: GoogleFonts.cuprum(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700),
          ),
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return Divider(
          height: 5,
          indent: 66.0,
          endIndent: 26.0,
          color: Colors.indigoAccent.shade700,
        );
      },
    ),
  );
}
