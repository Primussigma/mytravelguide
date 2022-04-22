// ignore_for_file: non_constant_identifier_names

import "package:get/get.dart";
import 'package:my_app/utils/dateTimeExtension.dart';
import 'package:my_app/models/ticketItem.dart';

class CartController extends GetxController {
  // add dict to store tickets in cart
  var _tickets = {}.obs;
  var today = DateTime.now();

  //add Ticket to Tickets list
  void addTicket(TicketItem ticket) {
    if (_tickets.containsKey(ticket)) {
      _tickets[ticket] += 1;
    } else {
      _tickets[ticket] = 1;
    }

    Get.snackbar("Ticket Added", "You have added a ticket to your cart",
        snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 1));
  }

  //remove Ticket from cart
  void removeTicket(TicketItem ticket) {
    if (_tickets.containsKey(ticket)) {
      if (_tickets[ticket] == 1) {
        _tickets.removeWhere((key, value) => key == ticket);
      } else {
        _tickets[ticket] -= 1;
      }
    }
  }

  //pull ticket data from tripCard and generate Ticket
  TicketItem generateTicketItem(
    String? boat_name,
    double? ticketPrice,
    String? destination,
    String? source,
    String? imageURL,
    String? departureTime,
    String? arrivalTime,
    String? boatID,
    String? date,
  ) {
    //"clean" date by converting to lowercase
    String dateString = date!.toLowerCase();
    //get date based off current DateTime
    String cDate = "null";
    if (dateString == "sunday")
      cDate = today.next(DateTime.sunday).toString().substring(0, 10);
    else if (dateString == "monday")
      cDate = today.next(DateTime.monday).toString().substring(0, 10);
    else if (dateString == "tuesday")
      cDate = today.next(DateTime.tuesday).toString().substring(0, 10);
    else if (dateString == "wednesday")
      cDate = today.next(DateTime.wednesday).toString().substring(0, 10);
    else if (dateString == "thursday")
      cDate = today.next(DateTime.thursday).toString().substring(0, 10);
    else if (dateString == "friday")
      cDate = today.next(DateTime.friday).toString().substring(0, 10);
    else if (dateString == "saturday")
      cDate = today.next(DateTime.saturday).toString().substring(0, 10);

    return TicketItem(
        boat_name: boat_name,
        ticketPrice: ticketPrice,
        destination: destination,
        source: source,
        imageURL: imageURL,
        departureTime: departureTime,
        arrivalTime: arrivalTime,
        boatID: boatID,
        date: cDate);
  }

  //get tickets
  get tickets => _tickets;

  //get ticketSubtotal
  get ticketSubtotal => _tickets.entries
      .map((ticket) => ticket.key.ticketPrice * ticket.value)
      .toList(); //doesn't actually give a subtotal, rather, a list of subtotals

  
  //get total
  get total => _tickets.entries
      .map((ticket) => ticket.key.ticketPrice * ticket.value)
      .toList()
      .fold<double>(0.0, (value, element) => value + element)
      .toStringAsFixed(2);
}
