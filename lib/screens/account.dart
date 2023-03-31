import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicplayer2/screens/settings.dart';
import 'package:musicplayer2/widgets/appbar.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //extendBody =false,
        //resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: true,
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
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                createAppBar('Settings'),
                // const SizedBox(
                //   height: 50,
                // ),
                avatarProfile(),
                //avatarProfileadd(),
                // const SizedBox(
                //   height: 20,
                // ),
                accountEdit(),
                const SizedBox(height: 120),
                //accoutPlaylist(),
                // const SizedBox(
                //   height: 20,
                // ),
                //accountSignout()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget avatarProfile() {
  return Padding(
    padding: const EdgeInsets.only(
      left: 0.0,
    ),
    
    child: CircleAvatar(
      backgroundColor: Colors.white54,
      radius: 30,
      child: Icon(
        Icons.person,
        color: Colors.indigoAccent.shade700,
        size: 50,
      ),
    ),
  );
}

Widget avatarProfileadd() {
  return const Padding(
    padding: EdgeInsets.only(top: 2.0, left: 2.0),
    child: CircleAvatar(
      backgroundColor: Colors.black,
      radius: 10,
      child: Icon(
        Icons.add,
        color: Colors.white,
        size: 20,
      ),
    ),
  );
}

Widget accountAppBar(String message) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    leading: const IconBtn(),
    // Padding(
    //     padding: EdgeInsets.only(right: 12.0), child: Icon(Icons.settings))

    title: Text(
      message,
      style: GoogleFonts.cuprum(),
    ),
    // ignore: prefer_const_literals_to_create_immutables
    actions: [
      const Padding(padding: EdgeInsets.all(8.0), child: IconSettings())
    ],
    // ignore: prefer_const_literals_to_create_immutables
  );
}

class IconSettings extends StatelessWidget {
  const IconSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => const Settings()));
        },
        icon: const Icon(Icons.settings));
  }
}

Widget accountEdit() {
  return Container(
    color: Colors.transparent,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          textAlign: TextAlign.left,
          style: const TextStyle(color: Colors.white70),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 50.0),
            label: Text(
              'Name',
              style: GoogleFonts.cuprum(color: Colors.indigoAccent.shade100),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.edit,
                color: Colors.indigoAccent.shade100,
              ),
              onPressed: () {},
            ),
          ),
        ),
        // Divider(
        //     height: 5,
        //     indent: 88.0,
        //     endIndent: 26.0,
        //     color: Colors.indigoAccent.shade400)
      ],
    ),
  );
}

Widget accountSignout() {
  return SizedBox(
    height: 55,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: 55,
        width: 220,
        color: Colors.indigo.shade900,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
                size: 30,
              ),
            ),
            Text(
              'Sign Out',
              style: GoogleFonts.cuprum(
                  color: Colors.indigoAccent.shade100, fontSize: 18),
            )
          ],
        ),
      ),
    ),
  );
}

Widget accoutPlaylist() {
  return SizedBox(
    height: 55,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: 55,
        width: 220,
        color: Colors.indigo.shade900,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.list,
                color: Colors.white,
                size: 30,
              ),
            ),
            Text(
              'Your Playlists',
              style: GoogleFonts.cuprum(
                  color: Colors.indigoAccent.shade100, fontSize: 18),
            )
          ],
        ),
      ),
    ),
  );
}
