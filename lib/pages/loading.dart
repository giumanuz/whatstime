import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:whatstime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);


  @override
  State<Loading> createState() => _LoadingState();


}

class _LoadingState extends State<Loading> {

  Future<void> setupWorldTIme() async {
    WorldTime instance = WorldTime(location: 'Rome', flag: 'germany.png', url: 'Europe/Rome');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTIme();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitCircle(
          color: Colors.white,
          size: 70.0,
        ),
      )
    );
  }
}
