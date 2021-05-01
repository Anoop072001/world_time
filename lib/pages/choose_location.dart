import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Chooselocation extends StatefulWidget {
  @override
  _ChooselocationState createState() => _ChooselocationState();
}

class _ChooselocationState extends State<Chooselocation> {

  List<WorldTime> locations =[
    WorldTime(url:'Europe/London',location:'London',flag:'uk.png'),
    WorldTime(url:'Europe/Berlin',location:'Athens',flag:'greece.png'),
    WorldTime(url:'Africa/Cairo',location:'Cairo',flag:'egypt.png'),
    WorldTime(url:'Africa/Nairobi',location:'Nairobi',flag:'kenya.png'),
    WorldTime(url:'America/New_York',location:'New_York',flag:'usa.png'),
    WorldTime(url:'Asia/Seoul',location:'Seoul',flag:'south_korea.png'),
    WorldTime(url:'Asia/Jakarta',location:'Jakarta',flag:'indonesia.png'),
    WorldTime(url:'Asia/Kolkata',location:'Kolkata',flag:'india.jpg'),

  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to homescreen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
        title: Text("Choose Location"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
            child: Card(
              color: Colors.redAccent[400],
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
