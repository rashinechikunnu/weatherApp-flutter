import 'package:geolocator/geolocator.dart';


class Location {
  double latitude = 0.0;
  double longitude = 0.0;
  
  Future<void> getCurrentLocation()async{
  await Geolocator.checkPermission();
  await Geolocator.requestPermission();

  try {
    final LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.low,
    distanceFilter: 100,);

    Position position = await Geolocator.getCurrentPosition(
      locationSettings: locationSettings,);

      latitude = position.latitude;
      longitude = position.longitude;
    
  } catch (e) {
    print(e);
  }

  }
}