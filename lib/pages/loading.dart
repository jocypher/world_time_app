import 'package:flutter/material.dart';
import 'package:untitled_retry_world_time_app/services/time_apt.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: "Berlin", flag: "germany.png", url: "Europe/Berlin");
    await instance.getTime();
    Navigator.pushNamed(context, "/home", arguments: {
      "location": instance.location,
      "flag": instance.flag,
      "time": instance.time,
    });
  }





  @override
  void initState() {
  super.initState();
  setupWorldTime();

 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[600],
      body: Center(
        child: SpinKitFadingCircle (
          color: Colors.white,
          size: 70.0,
        ),
      )
    );
  }
}
