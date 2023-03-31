import 'package:hive/hive.dart';
import 'package:musicplayer2/models/favourites.dart';
import 'package:musicplayer2/models/mostplayed.dart';

late Box<favourites> favouritesdb;
openFavouritesDB() async {
  favouritesdb = await Hive.openBox<favourites>('favourites');
}

late Box<MostPlayed> mostplayedsongs;
openmostplayeddb() async {
  mostplayedsongs = await Hive.openBox("Mostplayed");
}
updatePlayedSongsCount(MostPlayed value, int index) {
  final box = MostplayedBox.getInstance();
  List<MostPlayed> list1 = box.values.toList();
  bool isAlready =
      list1.where((element) => element.songname == value.songname).isEmpty;
  if (isAlready == true) {
    box.add(value);
  } else {
    int index =
        list1.indexWhere((element) => element.songname == value.songname);
    box.deleteAt(index);
    box.put(index, value);
  }
  int count = value.count;
  value.count = count + 1;
}