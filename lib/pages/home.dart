import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map;
    print(data);

    String bgImage = data['isDayTime'] ? 'day.jpg' : 'night.jpg';
    Color titleBarColor = data['isDayTime'] ? Colors.blue : Colors.black;
    Color fontColor = data['isDayTime'] ? Colors.black : Colors.white;
    return Scaffold(
      backgroundColor: titleBarColor,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/$bgImage'),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: [
              FlatButton.icon(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, '/location');
                  if (result != null) {
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDayTime': result['isDayTime'],
                        'flag': result['flag'],
                      };
                    });
                  }
                },
                icon: Icon(
                  Icons.edit_location,
                  color: Colors.black,
                ),
                label: Text(
                  'Edit Location',
                  style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 2,
                    color: fontColor,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 28,
                      letterSpacing: 3,
                      color: fontColor,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 5,
                      color: fontColor,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
