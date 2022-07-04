import 'package:flutter/material.dart';

import 'package:tpfinal/routes.dart';

class MyHomePage extends StatefulWidget {
  static const String routeName = '/';

  const MyHomePage({Key? key}) : super(key: key);

  //final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,

          bottom: TabBar(
            indicator: BoxDecoration(

                //  borderRadius: BorderRadius.circular(10), // Creates border
                //color: Colors.greenAccent

                ), //Change background color from here
            indicatorColor: Colors.blueAccent,
            indicatorSize: TabBarIndicatorSize.label,

            tabs: [
              //Row(children: [
              //  Column(),
              //  Column(),
              //],
              //)
              //Tab(text: 'Characters', icon: Icon(Icons.circle, size: 10.0)),
              Tab(text: 'Characters', icon: Icon(Icons.circle, size: 10.0)),
              // DotIndicator(const),
              Tab(text: 'Houses', icon: Icon(Icons.circle, size: 10.0)),
            ],
          ),
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          // title: Text(widget.title),
        ),

        body: TabBarView(
          children: <Widget>[
            Center(
              child: Container(
                height: 600,
                width: 600,
                child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            width: 500,
                            height: 400,
                            padding: const EdgeInsets.fromLTRB(20, 50, 20, 10),
                            margin: const EdgeInsets.only(
                                left: 30.0, right: 30.0, top: 30.0),
                            decoration: BoxDecoration(
                              color: const Color(0xff7c94b6),
                              image: const DecorationImage(
                                image: NetworkImage(
                                    'https://thronesapi.com/assets/images/daenerys.jpg'),
                                fit: BoxFit.cover,
                              ),
                              //border: Border.all(
                              // color: Colors.black,
                              // width: 6,
                              //),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, Routes.characters);
                              },
                              child: Text("characters")),
                          Column(
                            children: <Widget>[
                              Container(
                                //padding:
                                //const EdgeInsets.fromLTRB(20, 50, 20, 10),
                                margin: const EdgeInsets.only(
                                    left: 30.0, right: 30.0, top: 30.0),
                                //color: Colors.red,
                                child: const Text("Item 1"),
                              ),
                              Container(
                                //padding:
                                //const EdgeInsets.fromLTRB(20, 50, 20, 10),
                                margin: const EdgeInsets.only(
                                    left: 30.0, right: 30.0, top: 30.0),
                                //color: Colors.red,
                                child: const Text(
                                  "Item 1",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w900,
                                      fontStyle: FontStyle.normal,
                                      fontFamily: 'Open Sans',
                                      fontSize: 24),
                                ),
                              )
                            ],
                          )
                        ],
                      );
                    }),
              ),
            ),
            Center(
              child: Text("It's rainy here"),
            ),
          ],
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
