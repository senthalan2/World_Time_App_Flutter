import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: "Europe/London",location: "London", flag:  "uk.png"),
    WorldTime(url: "Europe/Berlin",location: "Athens", flag:  "greece.png"),
    WorldTime(url: "Africa/Cairo",location: "Cairo", flag:  "egypt.png"),
    WorldTime(url: "Africa/Nairobi",location: "Nairobi", flag:  "kenya.png"),
    WorldTime(url: "America/Chicago",location: "Chicago", flag:  "usa.png"),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    // navigate to home screen
    Navigator.pop(context,{
      "location":instance.location,
      "flag":instance.flag,
      "time":instance.time,
      "isDaytime":instance.isDaytime
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title:const Text(
            "Choose a Location",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                  print(locations[index].location);
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
