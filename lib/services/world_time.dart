import 'package:http/http.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class WorldTime{
  String location; //location name for the ui
  String time; //the time in that location
  String flag; //url to an asset flag icon
  String url; //location url for api endpoint

  WorldTime({this.location,this.flag,this.url});

  Future<void> getTime() async {
    try{
        Uri myUri =Uri.parse('https://worldtimeapi.org/api/timezone/$url');
        Response response = await get(myUri);
        Map data = jsonDecode(response.body);
        //print(data);

        //get properties from data
        String datetime =data['datetime'];
        String offset =data['utc_offset'].substring(1,3);
        //print(datetime);
        //print(offset);

        //create datetime
        DateTime now =DateTime.parse(datetime);
        now=now.add(Duration(hours:int.parse(offset) ));

        //set time property
        time=now.toString();
  }
    catch (e){
      print('Caught error: $e');
      time='could not get timedata';
    }
  }

}