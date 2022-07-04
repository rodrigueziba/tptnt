import 'package:tpfinal/data/models/characters.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:getwidget/getwidget.dart';

class CharactersPage extends StatefulWidget {
  static const String routeName = '/characters';

  String title;
  String? message;

  CharactersPage({Key? key, required this.title, this.message})
      : super(key: key);

  @override
  State<CharactersPage> createState() => _CharactersState();
}

class _CharactersState extends State<CharactersPage> {
  List<Character> _characters = [];

  void _getData() async {
    http
        .get(Uri.parse("https://thronesapi.com/api/v2/Characters"))
        .then((response) {
      setState(() {
        _characters = charactersFromJson(response.body);
      });
    });
  }

  Future<List<Character>> _getDataFuture() async {
    return http
        .get(Uri.parse("https://thronesapi.com/api/v2/Characters"))
        .then((response) {
      return charactersFromJson(response.body);
    });
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    String msg = widget.message ?? 'No message';
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              widget.title,
              style: TextStyle(fontSize: 32),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Container(
              height: 600,
              child: ListView.builder(
                  itemCount: _characters.length,
                  itemBuilder: (BuildContext context, int index) {
                    Character character = _characters[index];

                    return ListTile(
                      title: Text(character.fullName),
                      subtitle: Text(character.family),
                      trailing: Icon(Icons.favorite_border_sharp),
                      leading: GFAvatar(
                        backgroundImage: NetworkImage(character.imageUrl),
                        shape: GFAvatarShape.standard,
                      ),
                    );
                  }),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Volver")),
          ],
        ),
      ),
    );
  }
}
