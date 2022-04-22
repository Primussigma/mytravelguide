import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_app/controllers/trackingController.dart';

class TrackingBody extends GetWidget<TrackingController> {
  TrackingBody({
    Key? key,
  }) : super(key: key);
  final TrackingController _controller =
      Get.put<TrackingController>(TrackingController());

  @override
  Widget build(BuildContext context) {
    return GetX<TrackingController>(builder: (controller) {
      return GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: controller.startupPosition,
        onMapCreated: (GoogleMapController _controller) {},
        markers: controller.markers.value,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
      );
    });
  }
}
