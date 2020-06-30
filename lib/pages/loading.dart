import 'package:flutter/material.dart';
import 'package:worldtimeapp/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
void getTime() async{
  WorldTime instance = WorldTime(location: 'BERLIN', flag: 'Berlin.png', url: 'Europe/Berlin');
  await instance.getData();
  Navigator.pushReplacementNamed(context, '/home',arguments: {
    'location': instance.location,
    'flag': instance.flag,
    'time': instance.time,
    'isDaytime': instance.isDaytime,
  });
}
@override
void initState() {
  super.initState();
  getTime();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center (
          child: SpinKitCubeGrid(
            color: Colors.white,
            size: 50.0,
          ),
      ),
    );
  }
}
