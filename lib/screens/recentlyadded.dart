import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicplayer2/screens/downloads.dart';
import 'package:musicplayer2/widgets/appbar.dart';

class RecentlyPlayed extends StatelessWidget {
  const RecentlyPlayed(
      {super.key, int? duration, int? id, String? songname, required songurl});

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
              createAppBar('Recently Played'),
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

// showOptions(BuildContext context, int index) {
//   double vwidth = MediaQuery.of(context).size.width;
//   showDialog(context: context, builder: (((context) => StatefulBuilder(
//     builder: (BuildContext context, setState) {
//       return ;
//     },
//   ),)));
// }
