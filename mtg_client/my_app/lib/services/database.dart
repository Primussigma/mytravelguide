import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:my_app/models/boat.dart';
import 'package:my_app/models/boatTrip.dart';
import 'package:my_app/models/user.dart';
import 'package:intl/intl.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> createNewUser(UserModel user) async {
    try {
      await _firestore.collection("users").doc(user.id).set({
        "name": user.name,
        "email": user.email,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot _doc =
          await _firestore.collection("users").doc(uid).get();
      print(_doc.data());
      return UserModel.fromDocumentSnapshot(documentSnapshot: _doc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Stream<QuerySnapshot> updateUser() {
    try {
      Stream<QuerySnapshot> userStream =
          _firestore.collection("users").snapshots();
      return userStream;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Stream<QuerySnapshot> updateBoat() {
    try {
      Stream<QuerySnapshot> boatStream =
          _firestore.collection("boats").snapshots();
      return boatStream;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<BoatModel> getBoat(String uid) async {
    try {
      DocumentSnapshot _doc =
          await _firestore.collection("boats").doc(uid).get();
      // print(_doc.data());
      return BoatModel.fromDocumentSnapshot(documentSnapshot: _doc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<double> getSpeed(String uid) async {
    try {
      DocumentSnapshot boat =
          await _firestore.collection("boats").doc(uid).get();
      // print(_doc.data());
      double boatSpeed = boat['speed'] * 0.51444444444444;
      print(boatSpeed);
      return boatSpeed;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<dynamic> calculateBoatDistance(String uid) async {
    try {
      BoatTrip? schedule;
      QuerySnapshot<Map<String, dynamic>> schedules = await _firestore
          .collection("schedule")
          .where('boatID', isEqualTo: uid)
          .get();
      schedules.docs.forEach(
        (element) {
          if (element.data()['date'] ==
                  DateFormat('EEEE').format(DateTime.now()) &&
              DateFormat('HH:mm')
                  .parse(element.data()['departureTime'])
                  .isBefore(DateFormat('HH:mm')
                      .parse(DateFormat('HH:mm').format(DateTime.now()))) &&
              DateFormat('HH:mm').parse(element.data()['arrivalTime']).isAfter(
                  DateFormat('HH:mm')
                      .parse(DateFormat('HH:mm').format(DateTime.now())))) {
            print(element.data());
            schedule = BoatTrip.fromMap(element.data());
          }
        },
      );
      if (schedule != null) {
        DocumentSnapshot boatInfo =
            await _firestore.collection("boats").doc(schedule!.boatID).get();

        QuerySnapshot<Map<String, dynamic>> portInfo = await _firestore
            .collection('ports')
            .where('portName', isEqualTo: schedule!.destination)
            .get();

        double distanceInMeters = Geolocator.distanceBetween(
            boatInfo['latitude'],
            boatInfo['longitude'],
            portInfo.docs[0].get('latitude'),
            portInfo.docs[0].get('longitude'));
        print(distanceInMeters);
        return distanceInMeters;
      }
      return null;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<BoatTrip>> getBoatTrip(String source) async {
    try {
      print(source);
      QuerySnapshot<Map<String, dynamic>> port = await _firestore
          .collection('ports')
          .where('portName', isEqualTo: source)
          .get();

      QuerySnapshot<Map<String, dynamic>> trips = await _firestore
          .collection('schedule')
          .where('source', isEqualTo: port.docs[0].id)
          .get();
      print(trips.docs[0].data());
      return trips.docs.map((e) => BoatTrip.fromMap(e.data())).toList();
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
