import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/controllers/cartController.dart';
import 'package:my_app/models/boatTrip.dart';

class TripCard extends StatelessWidget {
  final BoatTrip boat;
  final cartController = Get.put(CartController());
  final String source;
  TripCard({Key? key, required this.boat, required this.source})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xffEBEBEB),
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      child: Row(
        children: [
          Container(
              width: 60,
              padding: const EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(boat.imageURL!, fit: BoxFit.cover))),
          const SizedBox(width: 5.0),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(boat.boat_name!),
                  const SizedBox(height: 10.0),
                  Text("Day: " + boat.date!),
                  Text("Going To: " + boat.destination!),
                  Text("Leaving:" + boat.departureTime!),
                  Text("Arriving:" + boat.arrivalTime!),
                  const SizedBox(height: 10.0)
                ],
              ),
            ),
          ),
          const SizedBox(width: 20.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              /* IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite),
                color: Colors.blue,
              ), */
              const SizedBox(height: 35.0),
              Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        Get.defaultDialog(
                            title: "Ticket Prices",
                            content: Container(
                              height: 100,
                              child: Column(children: [
                                SizedBox(height:10),
                                Text("Adult Price:\$" + boat.adultFare!.toString()),
                                SizedBox(height:20),
                                Text("Child Price:\$" + boat.childFare!.toString()),
                              ]),
                            ),
                            actions: [
                              Column(children: [
                                OutlinedButton(
                                    onPressed: () {
                                      cartController.addTicket(
                                          cartController.generateTicketItem(
                                              boat.boat_name,
                                              boat.childFare,
                                              boat.destination,
                                              source,
                                              boat.imageURL,
                                              boat.departureTime,
                                              boat.arrivalTime,
                                              boat.boatID,
                                              boat.date));
                                    },
                                    child: Text("Buy Child Ticket: \$" +
                                        boat.childFare!.toString())),
                                OutlinedButton(
                                    onPressed: () {
                                      cartController.addTicket(
                                          cartController.generateTicketItem(
                                              boat.boat_name,
                                              boat.adultFare,
                                              boat.destination,
                                              source,
                                              boat.imageURL,
                                              boat.departureTime,
                                              boat.arrivalTime,
                                              boat.boatID,
                                              boat.date));
                                    },
                                    child: Text("Buy Adult Ticket: \$" +
                                        boat.adultFare!.toString())),
                                TextButton(
                                    onPressed: () => Get.back(),
                                    child: Text("Close")),
                              ]),
                            ]);
                      },
                      child: Text("See Ticket Prices")),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
