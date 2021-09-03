import 'package:flutter/material.dart';
import 'package:world_time_viewer/services/world-time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime('Asia/Dhaka', 'Bangladesh', 'bd.png'),
    WorldTime('Europe/London', 'London', 'ad.png'),
    WorldTime('Europe/Berlin', 'Athens', 'ae.png'),
    WorldTime('Africa/Cairo', 'Cairo', 'af.png'),
    WorldTime('Africa/Nairobi', 'Nairobi', 'ag.png'),
    WorldTime('America/Chicago', 'Chicago', 'ai.png'),
    WorldTime('America/New_York', 'New York', 'al.png'),
    WorldTime('Asia/Seoul', 'Seoul', 'bd.png'),
    WorldTime('Asia/Jakarta', 'Jakarta', 'bd.png'),
  ];

  void UpdateTime(index) async {
    WorldTime worldTime = locations[index];
    await worldTime.getTime();
    // print(worldTime.time);
    Navigator.pop(context, {
      'location': worldTime.location,
      'flag': worldTime.flag,
      'time': worldTime.time,
      'isDayTime': worldTime.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
              child: Card(
                child: ListTile(
                  onTap: () {
                    UpdateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                        'assets/images/flags/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
