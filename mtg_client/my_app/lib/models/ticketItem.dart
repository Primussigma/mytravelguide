// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class TicketItem {
  final String? boat_name;
  final double? ticketPrice;
  final String? destination;
  final String? source;
  final String? imageURL;
  final String? departureTime;
  final String? arrivalTime;
  final String? boatID;
  //final int? currentPassengers;
  //final int? totalCapacity;
  final String? date;
  TicketItem({
    this.boat_name,
    this.ticketPrice,
    this.destination,
    this.source,
    this.imageURL,
    this.departureTime,
    this.arrivalTime,
    this.boatID,
    this.date,
  });

  TicketItem copyWith({
    String? boat_name,
    double? ticketPrice,
    String? destination,
    String? source,
    String? imageURL,
    String? departureTime,
    String? arrivalTime,
    String? boatID,
    String? date,
  }) {
    return TicketItem(
      boat_name: boat_name ?? this.boat_name,
      ticketPrice: ticketPrice ?? this.ticketPrice,
      destination: destination ?? this.destination,
      source: source ?? this.source,
      imageURL: imageURL ?? this.imageURL,
      departureTime: departureTime ?? this.departureTime,
      arrivalTime: arrivalTime ?? this.arrivalTime,
      boatID: boatID ?? this.boatID,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(boat_name != null){
      result.addAll({'boat_name': boat_name});
    }
    if(ticketPrice != null){
      result.addAll({'ticketPrice': ticketPrice});
    }
    if(destination != null){
      result.addAll({'destination': destination});
    }
    if(source != null){
      result.addAll({'source': source});
    }
    if(imageURL != null){
      result.addAll({'imageURL': imageURL});
    }
    if(departureTime != null){
      result.addAll({'departureTime': departureTime});
    }
    if(arrivalTime != null){
      result.addAll({'arrivalTime': arrivalTime});
    }
    if(boatID != null){
      result.addAll({'boatID': boatID});
    }
    if(date != null){
      result.addAll({'date': date});
    }
  
    return result;
  }

  factory TicketItem.fromMap(Map<String, dynamic> map) {
    return TicketItem(
      boat_name: map['boat_name'],
      ticketPrice: map['ticketPrice']?.toDouble(),
      destination: map['destination'],
      source: map['source'],
      imageURL: map['imageURL'],
      departureTime: map['departureTime'],
      arrivalTime: map['arrivalTime'],
      boatID: map['boatID'],
      date: map['date'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TicketItem.fromJson(String source) => TicketItem.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TicketItem(boat_name: $boat_name, ticketPrice: $ticketPrice, destination: $destination, source: $source, imageURL: $imageURL, departureTime: $departureTime, arrivalTime: $arrivalTime, boatID: $boatID, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is TicketItem &&
      other.boat_name == boat_name &&
      other.ticketPrice == ticketPrice &&
      other.destination == destination &&
      other.source == source &&
      other.imageURL == imageURL &&
      other.departureTime == departureTime &&
      other.arrivalTime == arrivalTime &&
      other.boatID == boatID &&
      other.date == date;
  }

  @override
  int get hashCode {
    return boat_name.hashCode ^
      ticketPrice.hashCode ^
      destination.hashCode ^
      source.hashCode ^
      imageURL.hashCode ^
      departureTime.hashCode ^
      arrivalTime.hashCode ^
      boatID.hashCode ^
      date.hashCode;
  }
}
