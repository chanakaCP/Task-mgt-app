import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ContactController extends GetxController {
  LatLng markerLatLng = LatLng(0, 0);
  RxSet<Marker> markers = <Marker>{}.obs;

  @override
  void onInit() {
    markerLatLng = LatLng(6.9271, 79.8612);
    markers.add(Marker(
      markerId: MarkerId("destination"),
      position: markerLatLng,
    ));
    super.onInit();
  }
}
