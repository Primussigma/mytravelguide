import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BoatModel {
  String? name;
  double? course;
  double? speed;
  double? latitude;
  double? longitude;
  Marker? boatMarker;

  BoatModel({
    this.name,
    this.course,
    this.speed,
    this.latitude,
    this.longitude,
    this.boatMarker,
  });

  BoatModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    name = documentSnapshot["name"];
    course = documentSnapshot["course"];
    speed = documentSnapshot["speed"];
    latitude = documentSnapshot["latitude"];
    longitude = documentSnapshot["longitude"];
  }

  BoatModel copyWith({
    String? name,
    double? course,
    double? speed,
    double? latitude,
    double? longitude,
    Marker? boatMarker,
  }) {
    return BoatModel(
      name: name ?? this.name,
      course: course ?? this.course,
      speed: speed ?? this.speed,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      boatMarker: boatMarker ?? this.boatMarker,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'course': course,
      'speed': speed,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory BoatModel.fromMap(Map<String, dynamic> map) {
    return BoatModel(
      name: map['name'],
      course: map['course']?.toDouble(),
      speed: map['speed']?.toDouble(),
      latitude: map['latitude']?.toDouble(),
      longitude: map['longitude']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory BoatModel.fromJson(String source) =>
      BoatModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BoatModel(name: $name, course: $course, speed: $speed, latitude: $latitude, longitude: $longitude, boatMarker: $boatMarker)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BoatModel &&
        other.name == name &&
        other.course == course &&
        other.speed == speed &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.boatMarker == boatMarker;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        course.hashCode ^
        speed.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        boatMarker.hashCode;
  }
}
