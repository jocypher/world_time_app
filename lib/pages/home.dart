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
   data = data.isNotEmpty? data: ModalRoute.of(context)?.settings.arguments as Map;
   print(data);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 160.0, 0, 0),
        child: Column(
          children: [
          TextButton.icon(
            onPressed: () async{
   dynamic result = await Navigator.pushNamed(context, "/location");
   setState(() {
     data = {
       "time" : result["time"],
       "location": result['location']
     };
   });
    },
            icon: Icon(Icons.edit_location),
            label: Text("Edit location"),



        ),
            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    data["location"],
                style:TextStyle(
                  fontSize: 40.0
                ) ,)
              ],
            ),
            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(data["time"],
                style: TextStyle(fontSize:60.0),)
              ],
            )
          ]
      )

      )

    );
  }
}
