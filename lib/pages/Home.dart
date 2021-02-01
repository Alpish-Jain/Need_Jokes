import 'package:flutter/material.dart';
import 'jokeList.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic> data;
  Map receive;
  List<dynamic> temp = [
    {
      "id": 246,
      "type": "general",
      "setup": "What does a clock do when it's hungry?",
      "punchline": "It goes back four seconds!"
    },
    {
      "id": 236,
      "type": "general",
      "setup": "What do you call someone with no nose?",
      "punchline": "Nobody knows."
    },
    {
      "id": 211,
      "type": "general",
      "setup": "What do you call a dictionary on drugs?",
      "punchline": "High definition."
    }
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    receive = ModalRoute.of(context).settings.arguments;
    data = receive['data'];
    return Scaffold(
      extendBodyBehindAppBar: true, //shows the body behind appbar
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/');
          },
          icon: Icon(Icons.refresh),
        ),
        backgroundColor: Colors.transparent,
        title: Text('Need some jokes?'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/funny.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Flexible(
                    child: JokeList(data: data),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
