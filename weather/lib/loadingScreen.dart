import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void getLocation()async{

  await Geolocator.checkPermission();
  await Geolocator.requestPermission();

  final LocationSettings locationSettings = LocationSettings(
  accuracy: LocationAccuracy.low,
  distanceFilter: 100,);

  Position position = await Geolocator.getCurrentPosition(
    locationSettings: locationSettings,);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      backgroundColor: Colors.black,
      
      body: Column(
        
        crossAxisAlignment:CrossAxisAlignment.stretch,
        children: [
        
          Image.asset('image/weather1.jpg',
          
          ),
          Container(
            child: Text(
              'Discover The Weather in Your City',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            child: Text(
              'Get to know your weather maps and redar pracipitation forecast',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade400,
              ),
            ),
          ),
          SizedBox(height: 30,),

          GestureDetector(
            onTap: (){
              getLocation();
            },
            child: Container(
              padding: EdgeInsets.all(19),
              margin: EdgeInsets.all(20),
              height: 58,
              decoration: BoxDecoration(
              color: Colors.blue.shade600,
            
              borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Get Weather',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}