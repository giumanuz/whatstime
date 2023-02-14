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

    String bgImage = data['isDaytime'] ? 'day.jpg' : 'night.png';
    Color? bgColor = data['isDaytime'] ? Colors.blue[800] : Colors.black;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              )
            ),
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
                          icon: Icon(
                              Icons.edit_location,
                            color: Colors.grey[300],
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/location');
                            },
                            child: Text(
                                'edit location',
                              style: TextStyle(
                                color: Colors.grey[300]
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
                            letterSpacing: 2,
                            color: Colors.white
                          ),
                        )
                      ],
              ),
            SizedBox(height: 20.0),
            Text(
              data['time'],
              style: TextStyle(
                fontSize: 66.0,
                color: Colors.white
              ),
            )
        ],
      ),
            ),
          )),
    );
  }
}
