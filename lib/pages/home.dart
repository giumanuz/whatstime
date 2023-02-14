import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data= ModalRoute.of(context)?.settings.arguments as Map;


    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0, 0),
            child: Column(
        children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/location');
                  },
                  icon: Icon(Icons.edit_location),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/location');
                    },
                    child: Text(
                        'edit location',
                      style: TextStyle(
                        color: Colors.black
                      ),
                    )
                )
              ],
            ),
            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data['location'],
                  style: TextStyle(
                    fontSize: 28.0,
                    letterSpacing: 2
                  ),
                )
              ],
            ),
          SizedBox(height: 20.0),
          Text(
            data['time'],
            style: TextStyle(
              fontSize: 66.0
            ),
          )
        ],
      ),
          )),
    );
  }
}