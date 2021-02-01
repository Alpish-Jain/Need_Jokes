import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:practice/pages/home.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  List<dynamic> data;
  //get data from server
  Future<void> getData() async {
    Response response =
        await get('https://official-joke-api.appspot.com/random_ten');
    try {
      data = jsonDecode(response.body);
      //print(data);
    } catch (e) {
      print(e);
      print('error here!');
    }

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'data': data,
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    //meanwhile the data comes we can safely show this build loading screen.
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
