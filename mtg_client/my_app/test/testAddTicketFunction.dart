import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/controllers/cartController.dart';
import 'package:get/get.dart';
import 'package:my_app/models/ticketItem.dart';

void main() {
  group("TestAddTicket", (() {
    final CartController controller = Get.put(CartController());
    final TicketItem testTicketItem = controller.generateTicketItem(
        "Pedro",
        20.80,
        "Port-of_Spain",
        "Kingstown",
        "empty",
        "10:00",
        "23:00",
        "Pedro2341793",
        "Tuesday");
    //ensure to comment out Get.snackbar in CartController as there is no context or parent widget when running tests
    test("add a ticket and check to see if it is contained in the tickets object", () {
      controller.addTicket(testTicketItem);
      expect(controller.tickets.containsKey(testTicketItem),true);
    });
    test("controller.tickets[testTicketItem].value should be 2", () {
      controller.addTicket(testTicketItem);
      expect(controller.tickets[testTicketItem], 2);
    });
  }));
}
