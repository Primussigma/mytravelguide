import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/controllers/cartController.dart';
import 'package:my_app/models/ticketItem.dart';

class CartTickets extends StatelessWidget {
  final CartController controller = Get.find();

  CartTickets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 450,
        child: ListView.builder(
          itemCount: controller.tickets.length,
          itemBuilder: (BuildContext context, int index) {
            return CartTicketCard(
                controller: controller,
                ticket: controller.tickets.keys.toList()[index],
                quantity: controller.tickets.values.toList()[index],
                index: index);
          },
        ),
      ),
    );
  }
}

class CartTicketCard extends StatelessWidget {
  final CartController controller;
  final TicketItem ticket;
  final int quantity;
  final int index;
  const CartTicketCard(
      {Key? key,
      required this.controller,
      required this.ticket,
      required this.quantity,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                width: 100,
                padding: const EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(ticket.imageURL!, fit: BoxFit.cover))),
            const SizedBox(width: 5.0),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10.0),
                    Text("Ticket for: " + ticket.boat_name!),
                    const SizedBox(height: 10.0),
                    Text("Going To: " + ticket.destination!),
                    Text("Date: " + ticket.date!),
                    Text("Leaving:" + ticket.departureTime!),
                    Text("Arriving:" + ticket.arrivalTime!),
                    const SizedBox(height: 10.0),
                    Divider(),
                  ],
                ),
              ),
            ),
            
            Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      controller.removeTicket(ticket);
                    },
                    icon: Icon(Icons.remove_circle)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Quantity: " + "${quantity}"),
                    Text("Price: \$" + "${ticket.ticketPrice}")
                  ],
                ),
              ],
            ))
          ],
        ));
  }
}
