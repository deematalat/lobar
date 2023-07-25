

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import '../../../helper/componet/geoloctor.dart';

class HomeController extends ChangeNotifier{
   String locationName="";
  void getLocationAndName() async {
    Position? position = await UserLocation().getCurrentLocation();
    if (position != null) {
       locationName = await UserLocation().getLocationName(position);
      print('Location: $locationName');
    } else {
      print('Failed to get location');
    }
    ChangeNotifier();
  }
}