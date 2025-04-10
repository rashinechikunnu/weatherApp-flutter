import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather/location.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void getLocation()async{
    Location locations = Location();
    await locations.getCurrentLocation();
    print(locations.latitude);
    print(locations.longitude);
  }

  void getData()async{
    http.Response response = await http.get(
      Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=1b9420966cd82474a099341b6d49dae0'));
    print(response.body);
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
              getData();
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