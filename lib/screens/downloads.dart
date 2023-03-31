// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicplayer2/widgets/appbar.dart';
//import 'package:musicplayer2/widgets/list_songs.dart';

class Downloads extends StatelessWidget {
  const Downloads({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
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
              createAppBar('Downloads'),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, bottom: 8),
                    child: Text(
                      'Albums',
                      style: GoogleFonts.cuprum(
                          color: Colors.white54,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
              listbtn(),
              AlbumListSongs(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget listbtn() {
  return Row(
    mainAxisSize: MainAxisSize.min,
    // ignore: prefer_const_literals_to_create_immutables
    children: [
      CircleAvatar(
        radius: 30,
        backgroundColor: Colors.indigo.shade900,
        child: const Icon(
          Icons.play_arrow,
          color: Colors.white,
          size: 38,
        ),
      ),
      const SizedBox(
        width: 15,
      ),
      CircleAvatar(
        backgroundColor: Colors.indigo.shade900,
        child: const Icon(
          Icons.playlist_add,
          color: Colors.white,
        ),
      ),
      const SizedBox(
        width: 15,
      ),
      CircleAvatar(
        backgroundColor: Colors.indigo.shade900,
        child: const Icon(
          Icons.shuffle,
          color: Colors.white,
        ),
      ),
      const SizedBox(
        width: 15,
      ),
      CircleAvatar(
        backgroundColor: Colors.indigo.shade900,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
    ],
  );
}

class AlbumListSongs extends StatelessWidget {
  AlbumListSongs({super.key});

  List<String> songSubtitle = [
    'Justin Bieber',
    'Selena Gomez',
    'Taylor Swift',
    'Selena Gomez',
    'Taylor Swift',
    'Ed Sheeran',
    'Dua Lipa',
    'BlackPInk',
    'BTS',
    'Charlie Puth'
  ];

  List<String> songTitle = [
    'Baby',
    'Calm Dowm',
    'Never Ever',
    'Heart wants what it wants',
    'Love Story ',
    'Shape of you',
    'Levitating',
    'crushing on you',
    'BTS',
    'Cheating OnYou'
  ];
  List<String> songImg = [
    'assets/images/th (5).jpeg',
    'assets/images/th (4).jpeg',
    'assets/images/taylor.jpg',
    'assets/images/selena.jpg',
    'assets/images/taylor.jpg',
    'assets/images/ed.jpg',
    'assets/images/dua.jpg',
    'assets/images/blackpink.jpg',
    'assets/images/bts.jpg',
    'assets/images/th (3).jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: songSubtitle.length,
        separatorBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {},
            title: Text(
              songTitle[index],
              style: GoogleFonts.cutive(
                  color: Colors.white70,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              songSubtitle[index],
              style: GoogleFonts.cutive(
                  color: Colors.white54,
                  fontSize: 9,
                  fontWeight: FontWeight.w400),
            ),
            leading: SizedBox(
              height: 50,
              width: 50,
              child: Image.asset(
                songImg[index],
                fit: BoxFit.cover,
              ),
            ),
            trailing: FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {},
                    iconSize: 18,
                    icon: const Icon(Icons.share, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {},
                    iconSize: 18,
                    icon: const Icon(Icons.favorite, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {},
                    iconSize: 18,
                    icon: const Icon(Icons.more_vert, color: Colors.white),
                  ),
                ],
              ),
            ),
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return Divider(
            height: 5,
            indent: 66.0,
            endIndent: 26.0,
            color: Colors.indigoAccent.shade400,
          );
        },
      ),
    );
  }
}
