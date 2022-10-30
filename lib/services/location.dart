
import 'package:geolocator/geolocator.dart';
class Location{
  late double long;
  late double lati;
 Future<void>getCurrentLaocation()async {
    try {
      Position position = await Geolocator
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      long=position.longitude;
      lati=position.latitude;
    }
    catch(e){
      print(e);
    }
  }
}
