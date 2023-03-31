import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicplayer2/widgets/appbar.dart';

import 'downloads.dart';

class GridPlaylist extends StatelessWidget {
  const GridPlaylist({super.key});

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
              createAppBar('Playlists'),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, bottom: 8),
                    child: Text(
                      'Songs',
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
