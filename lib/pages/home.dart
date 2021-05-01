import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data =data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);

    String bgImage = data['isDaytime'] ? 'Day.jpg' : 'Night.jpg';
    Color bgColor = data['isDaytime'] ? Colors.blue[100] : Colors.blue[900];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: () async{
                    dynamic result=await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time':result['time'],
                        'location':result['location'],
                        'isDaytime':result['isDaytime'],
                        'flag':result['flag'],
                      };
                    });
                  },
                  icon: Icon(Icons.edit_location,
                  color: Colors.grey[800],
                  ),
                  label: Text("Edit Location",
                  style:TextStyle(
                    color:Colors.grey[800],
                  ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  data['time'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 66.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
