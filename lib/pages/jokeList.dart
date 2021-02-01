import 'dart:math';

import 'package:flutter/material.dart';

class JokeList extends StatefulWidget {
  List<dynamic> data;
  JokeList({this.data});
  @override
  _JokeListState createState() => _JokeListState(data: data);
}

class _JokeListState extends State<JokeList>
    with SingleTickerProviderStateMixin {
  List<dynamic> data;
  AnimationController _controller;
  Animation _animation;
  AnimationStatus _animationStatus = AnimationStatus.dismissed;

//constructor
  _JokeListState({this.data});
  int global_index = 100;
//initialize animation controller
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    _animation = Tween(begin: 0, end: 1).animate(_controller);
    _controller.addListener(() {
      setState(() {});
    });
    _controller.addStatusListener((status) {
      _animationStatus = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //build the list
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(10),
          child: ListTile(
              onTap: () {
                setState(() {
                  global_index = index;
                });
              },
              title: index == global_index
                  ? Text(
                      data[index]['punchline'],
                    )
                  : Text(
                      data[index]['setup'],
                    )),
        );
      },
    );
  }
}
