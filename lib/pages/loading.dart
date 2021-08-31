import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getTime() async {
    Response response =
        await get(Uri.parse("http://worldtimeapi.org/api/timezone/Asia/Dhaka"));
    Map data = jsonDecode(response.body);
    // print(data);

    String dateTime = data['datetime'];
    String offset = data['utc_offset'];
    // print(dateTime);
    // print(offset);
    DateTime now = DateTime.parse(dateTime);
    print(now);
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('data bhgvhn'),
    );
  }
}
