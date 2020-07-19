import 'package:flutter/material.dart';

void main() {
  runApp(MusicPlayer());
}

class MusicPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Music Player",
      home: ListPage(),
    );
  }
}

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final allSongs = [
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0"
  ];
  final favSongs = [];
  void _pushSaved() {}

  Widget customHomeScreen() {
    return Column(
      children: <Widget>[
        Container(
          height: 300,
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAlias,
            child: Image.network(
                "https://images.unsplash.com/photo-1494232410401-ad00d5433cfa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
                fit: BoxFit.cover),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            elevation: 10,
            margin: EdgeInsets.all(5),
          ),
        ),
        Expanded(child: customListView())
      ],
    );
  }

  Widget customListView() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();
          final index = i ~/ 2;
          if (index >= allSongs.length) {
            // allSongs.addAll(generateWordPairs().take(10));
            return null;
          }
          return _buildRow(allSongs[index]);
        });
  }

  Widget _buildRow(String entry) {
    final alreadyFav = favSongs.contains(entry);
    return ListTile(
      title: Text(
        entry,
      ),
      trailing: Icon(
        alreadyFav ? Icons.favorite : Icons.favorite_border,
        color: alreadyFav ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadyFav) {
            allSongs.remove(entry);
          } else {
            allSongs.add(entry);
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: Text("Music Player"),
        centerTitle: true,
        leading: Icon(Icons.music_note),
        actions: [IconButton(icon: Icon(Icons.list), onPressed: _pushSaved)],
      ),
      body: customHomeScreen(),
      floatingActionButton:
          FloatingActionButton(onPressed: null, child: Icon(Icons.play_arrow)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 80,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.filter_1),
                Icon(Icons.album),
                SizedBox.shrink(),
                Icon(Icons.playlist_play),
                Icon(Icons.settings)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
