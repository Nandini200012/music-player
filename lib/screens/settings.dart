import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicplayer2/screens/account.dart';
import 'package:musicplayer2/widgets/appbar.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

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
            //mainAxisSize: MainAxisSize.min,
            children: [
              createAppBar('Settings'),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  avatarProfile(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'USER NAME',
                      style: GoogleFonts.cutive(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              settingsList()
            ],
          ),
        ),
      ),
    );
  }
}

List<String> settingsTitle = [
  'Share on Whatsapp',
  'Share App',
  'Terms and Conditions',
  'Privacy Policy',
  'About Us',
];
List<IconData> settingsIcon = const [
  (Icons.whatsapp),
  (Icons.share),
  (Icons.file_copy),
  (Icons.lock),
  (Icons.people),
];
Widget settingsList() {
  return SizedBox(
    height: 320,
    child: ListView.separated(
      scrollDirection: Axis.vertical,
      itemCount: settingsTitle.length + 1,
      separatorBuilder: (BuildContext context, int index) {
        return ListTile(
          onTap: () {},
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              height: 40,
              width: 50,
              color: Colors.indigoAccent,
              child: Icon(
                settingsIcon[index],
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          title: Text(
            settingsTitle[index],
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
          color: Colors.indigoAccent.shade400,
        );
      },
    ),
  );
}
