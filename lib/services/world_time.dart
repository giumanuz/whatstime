import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location;
  late String time;
  String flag;
  String url;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {

    try{

      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'];
      bool add=true;
      if (offset[0] == '-') add=false;
      offset=offset.substring(1,3);


      DateTime now = DateTime.parse(datetime);
      if (add==true) {
        now=now.add(Duration(hours: int.parse(offset)));
      } else{
        now=now.subtract(Duration(hours: int.parse(offset)));
      }


      time = DateFormat.jm().format(now);

    }
    catch (e) {
      print('caught error: $e');
      time= 'could not get time data';
    }

  }

}
