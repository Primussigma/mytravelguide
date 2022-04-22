import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_app/models/boat.dart';
import 'package:my_app/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TrackingController extends GetxController {
  Completer<GoogleMapController> mapController = Completer();

  static final Rx<CameraPosition> _startupPosition = CameraPosition(
    target: LatLng(13.082004, -61.184862),
    zoom: 10.0,
  ).obs;

  CameraPosition get startupPosition => _startupPosition.value;
  RxSet<Marker> markers = <Marker>{}.obs;
  RxSet<BoatModel> boat = <BoatModel>{}.obs;
  RxString time = ''.obs;
  RxString currentBoat = ''.obs;

  late double distanceInMeters;

  @override
  Future<void> onInit() async {
    super.onInit();

    markers.bindStream(
        Database().updateBoat().map((QuerySnapshot<Object?> event) => event.docs
            .map(
              (doc) => Marker(
                  markerId: MarkerId(doc["name"]),
                  position: LatLng(doc["latitude"], doc["longitude"]),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueCyan),
                  onTap: () async {
                    currentBoat.value = doc.id;
                    time.value = await getTime(doc.id);
                    Get.defaultDialog(
                        title: doc['name'],
                        content: Text(
                          'Estimated Arrival: ' + time.value,
                        ),
                        actions: [
                          TextButton(
                              onPressed: () => Get.back(), child: Text('Close'))
                        ]);
                  }),
            )
            .toSet()));
  }

  Future<BoatModel> getBoatInfo(String id) async {
    try {
      BoatModel boat = await Database().getBoat(id);
      return boat;
    } catch (e) {
      Get.snackbar(
        "Unable to update boat",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.black,
      );
      rethrow;
    }
  }

  Future<String> getTime(String id) async {
    try {
      double? portDistance = await Database().calculateBoatDistance(id);
      double? boatSpeed = await Database().getSpeed(id);
      double time;

      if (portDistance != null) {
        time = portDistance / boatSpeed;
      } else {
        return 'No boat Travelling';
      }

      final now = DateTime.now();
      final later = now.add(Duration(seconds: time.round()));
      print(later);
      return later.toString().substring(0, 16);
    } catch (e) {
      Get.snackbar(
        "Unable to update boat",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.black,
      );
      rethrow;
    }
  }
}
