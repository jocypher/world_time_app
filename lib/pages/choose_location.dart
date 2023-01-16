import 'package:flutter/material.dart';
import 'package:untitled_retry_world_time_app/services/time_apt.dart';
class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      "location": instance.location,
      "time" : instance.time,
    });

  }

  List<WorldTime> locations = [
    WorldTime(url: "Europe/London", location: "london", flag: "uk.png"),
    WorldTime(url: "Europe/Greece", location: "Athens", flag: "greece.png"),
    WorldTime(url: "Africa/Egypt", location: "Cairo", flag: "egypt.png"),
    WorldTime(url: "Africa/Nairobi", location: "Nairobi", flag: "kenya.png"),
    WorldTime(url: "America/Chicago", location: "Chicago", flag: "usa.png"),
    WorldTime(url: "America/New_York", location: "New_York", flag: "usa.png"),
    WorldTime(url: "Asia/Seoul",      location: "Seoul", flag: "south_korea.png"),
    WorldTime(url: "Asia/Jakarta", location: "Jakarta", flag: "indonesia.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose location",
        style: TextStyle(
          fontSize: 20.0
        ),),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                  onTap: (){
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("lib/assets/${locations[index].flag}"),
                  )

              ),

            );
          }
      ),
    );
  }
}
