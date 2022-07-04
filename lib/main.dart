import 'package:flutter/material.dart';

import 'package:tpfinal/routes.dart';
import 'package:tpfinal/data/models/characters.dart';
import 'package:flutter/material.dart';
import 'package:tpfinal/data/models/characters.dart';
import 'package:http/http.dart' as http;

import 'package:getwidget/getwidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        onGenerateRoute: routes,
        home: MyHomePage(title: ''),
        theme: new ThemeData(
            primarySwatch: Colors.grey,
            primaryTextTheme:
                TextTheme(headline6: TextStyle(color: Colors.white))));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Houses> _houses = [
    Houses("House Targaryen"),
    Houses("House Tarly"),
    Houses("House Stark"),
    Houses("House Baratheon"),
  ];
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
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,

          bottom: TabBar(
            indicator: BoxDecoration(), //Change background color from here
            indicatorColor: Colors.blueAccent,
            indicatorSize: TabBarIndicatorSize.label,

            tabs: [
              Tab(text: 'Characters', icon: Icon(Icons.circle, size: 10.0)),
              // DotIndicator(const),
              Tab(text: 'Houses', icon: Icon(Icons.circle, size: 10.0)),
            ],
          ),
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),

        body: TabBarView(
          children: <Widget>[
            Center(
              child: Container(
                height: 600,
                //width: 600,
                child: PageView.builder(
                    itemCount: _characters.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 2),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        _characters[index].imageUrl))),
                            child: Text(_characters[index].firstName +
                                _characters[index].family),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Center(
              child: Container(
                height: 600,
                child: ListView.builder(
                    itemCount: _houses.length,
                    itemBuilder: (BuildContext context, int index) {
                      Houses house = _houses[index];

                      return ListTile(
                        title: Text(house.name),
                        trailing: Icon(Icons.favorite_border_sharp),
                        leading: GFAvatar(
                          //backgroundImage: NetworkImage(house.imageUrl),
                          shape: GFAvatarShape.standard,
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

class Houses {
  late String name;
  late String imageUrl;

  Houses(
    name,
  ) {
    this.name = name;
  }
}
