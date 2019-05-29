import 'package:geolocator/geolocator.dart';

class Location {
  Future<Position> getLocation() async {
    print("hello");
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print(position);
    return position;
  }
}
