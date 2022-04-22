import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class PortInfo {
  String? portName;
  double? latitude;
  double? longitude;
  PortInfo({
    this.portName,
    this.latitude,
    this.longitude,
  });

PortInfo.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    portName = documentSnapshot["portName"];
    latitude= documentSnapshot["latitude"];
    longitude = documentSnapshot["longitude"];
  }


  PortInfo copyWith({
    String? portName,
    double? latitude,
    double? longitude,
  }) {
    return PortInfo(
      portName: portName ?? this.portName,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'portName': portName,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory PortInfo.fromMap(Map<String, dynamic> map) {
    return PortInfo(
      portName: map['portName'],
      latitude: map['latitude']?.toDouble(),
      longitude: map['longitude']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory PortInfo.fromJson(String source) => PortInfo.fromMap(json.decode(source));

  @override
  String toString() => 'PortInfo(portName: $portName, latitude: $latitude, longitude: $longitude)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is PortInfo &&
      other.portName == portName &&
      other.latitude == latitude &&
      other.longitude == longitude;
  }

  @override
  int get hashCode => portName.hashCode ^ latitude.hashCode ^ longitude.hashCode;
}
