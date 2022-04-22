// ignore_for_file: non_constant_identifier_names
import 'dart:convert';

class BoatTrip {
  final String? boat_name;
  final double? adultFare;
  final double? childFare;
  final String? destination;
  final String? source;
  final String? imageURL;
  final String? departureTime;
  final String? arrivalTime;
  final String? boatID;
  final int? currentPassengers;
  final int? totalCapacity;
  final String? date;

  BoatTrip({
    this.boat_name,
    this.adultFare,
    this.childFare,
    this.destination,
    this.source,
    this.imageURL,
    this.departureTime,
    this.arrivalTime,
    this.boatID,
    this.currentPassengers,
    this.totalCapacity,
    this.date,
  });

  BoatTrip copyWith({
    String? boat_name,
    double? adultFare,
    double? childFare,
    String? destination,
    String? source,
    String? imageURL,
    String? departureTime,
    String? arrivalTime,
    String? boatID,
    int? currentPassengers,
    int? totalCapacity,
    String? date,
  }) {
    return BoatTrip(
      boat_name: boat_name ?? this.boat_name,
      adultFare: adultFare ?? this.adultFare,
      childFare: childFare ?? this.childFare,
      destination: destination ?? this.destination,
      source: source ?? this.source,
      imageURL: imageURL ?? this.imageURL,
      departureTime: departureTime ?? this.departureTime,
      arrivalTime: arrivalTime ?? this.arrivalTime,
      boatID: boatID ?? this.boatID,
      currentPassengers: currentPassengers ?? this.currentPassengers,
      totalCapacity: totalCapacity ?? this.totalCapacity,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (boat_name != null) {
      result.addAll({'boat_name': boat_name});
    }
    if (adultFare != null) {
      result.addAll({'adultFare': adultFare});
    }
    if (childFare != null) {
      result.addAll({'childFare': childFare});
    }
    if (destination != null) {
      result.addAll({'destination': destination});
    }
    if (source != null) {
      result.addAll({'source': source});
    }
    if (imageURL != null) {
      result.addAll({'imageURL': imageURL});
    }
    if (departureTime != null) {
      result.addAll({'departureTime': departureTime});
    }
    if (arrivalTime != null) {
      result.addAll({'arrivalTime': arrivalTime});
    }
    if (boatID != null) {
      result.addAll({'boatID': boatID});
    }
    if (currentPassengers != null) {
      result.addAll({'currentPassengers': currentPassengers});
    }
    if (totalCapacity != null) {
      result.addAll({'totalCapacity': totalCapacity});
    }
    if (date != null) {
      result.addAll({'date': date});
    }

    return result;
  }

  factory BoatTrip.fromMap(Map<String, dynamic> map) {
    return BoatTrip(
      boat_name: map['boat_name'],
      adultFare: map['adultFare']?.toDouble(),
      childFare: map['childFare']?.toDouble(),
      destination: map['destination'],
      source: map['source'],
      imageURL: map['imageURL'],
      departureTime: map['departureTime'],
      arrivalTime: map['arrivalTime'],
      boatID: map['boatID'],
      currentPassengers: map['currentPassengers']?.toInt(),
      totalCapacity: map['totalCapacity']?.toInt(),
      date: map['date'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BoatTrip.fromJson(String source) =>
      BoatTrip.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BoatTrip(boat_name: $boat_name, adultFare: $adultFare, childFare: $childFare, destination: $destination, source: $source, imageURL: $imageURL, departureTime: $departureTime, arrivalTime: $arrivalTime, boatID: $boatID, currentPassengers: $currentPassengers, totalCapacity: $totalCapacity, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BoatTrip &&
        other.boat_name == boat_name &&
        other.adultFare == adultFare &&
        other.childFare == childFare &&
        other.destination == destination &&
        other.source == source &&
        other.imageURL == imageURL &&
        other.departureTime == departureTime &&
        other.arrivalTime == arrivalTime &&
        other.boatID == boatID &&
        other.currentPassengers == currentPassengers &&
        other.totalCapacity == totalCapacity &&
        other.date == date;
  }

  @override
  int get hashCode {
    return boat_name.hashCode ^
        adultFare.hashCode ^
        childFare.hashCode ^
        destination.hashCode ^
        source.hashCode ^
        imageURL.hashCode ^
        departureTime.hashCode ^
        arrivalTime.hashCode ^
        boatID.hashCode ^
        currentPassengers.hashCode ^
        totalCapacity.hashCode ^
        date.hashCode;
  }
}
