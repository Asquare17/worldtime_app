import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data ={};
  @override
  Widget build(BuildContext context) {
    data = data.isEmpty?  ModalRoute.of(context).settings.arguments : data ;
    String bgImage = data['isDaytime']? 'day.png' : 'night.png';

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0,120,0,0),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                    onPressed: () async{
                     dynamic result = await Navigator.pushNamed(context, '/location');
                     setState(() {
                       data = {
                         'time' :result['time'],
                         'flag' : result['flag'],
                         'location' : result['location'],
                         'isDaytime' : result['isDaytime'],
                       };
                     });
                    },
                    icon: Icon(
                      Icons.edit_location,
                      color:Colors.grey[200],
                    ),
                    label: Text(
                        'Edit Location',
                      style: TextStyle(
                        color:Colors.grey[200] ,
                      ),
                    ),

                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height:20),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 70,

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
