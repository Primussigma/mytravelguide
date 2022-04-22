import 'package:flutter/material.dart';
import 'package:my_app/controllers/scheduleController.dart';
import 'package:get/get.dart';
import 'package:my_app/screens/ticket/component/tripcard.dart';

class TripList extends GetView<ScheduleController> {
  String source;
  TripList({Key? key, required this.source}) : super(key: key);
  final ScheduleController _controller =
      Get.put<ScheduleController>(ScheduleController());

  @override
  Widget build(BuildContext context) {
    return GetX<ScheduleController>(initState: (_) async {
      print("TripList() ran");
      await _controller.updateList(source);
    }, builder: (controller) {
      return Visibility(
        visible: controller.visibility,
        replacement: Center(child: CircularProgressIndicator()),
        child: ListView.builder(
          itemCount: controller.currentView.length,
          itemBuilder: (context, index) {
            return TripCard(
                boat: controller.currentView[index], source: source);
          },
        ),
      );
    });
  }
}
