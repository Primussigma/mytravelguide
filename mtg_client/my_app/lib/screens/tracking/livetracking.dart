import 'dart:async';
import 'package:my_app/screens/shared/dropdownmenu.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  State<GoogleMapScreen> createState() => GoogleMapState();
}

class GoogleMapState extends State<GoogleMapScreen> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition startupPosition = CameraPosition(
    target: LatLng(13.082004, -61.184862),
    zoom: 10.0,
  );

  Set<Marker> markers = {
    Marker(
      markerId: MarkerId('0'),
      position: LatLng(13.092004, -61.184662),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      onTap: () {
        print(0);
      },
    ),
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(12.879809, -61.145010),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
      onTap: () {
        print(1);
      },
    ),
    Marker(
      markerId: MarkerId('2'),
      position: LatLng(12.636674, -61.470526),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
      onTap: () {
        print(2);
      },
    ),
    Marker(
      markerId: MarkerId('3'),
      position: LatLng(12.718954, -61.346657),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
      onTap: () {
        print(3);
      },
    ),
  };

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: DropDownMenu(),
      appBar: AppBar(
        title: Text('Live Tracking'),
      ),
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: startupPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: markers,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
      ),
    );
  }
}
