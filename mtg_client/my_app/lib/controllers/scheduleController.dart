import 'package:get/get.dart';
import 'package:my_app/models/boatTrip.dart';
import 'package:my_app/services/database.dart';

class ScheduleController extends GetxController {
  String source = "";
  bool visibility = false;
  final RxList<BoatTrip> _currentView = <BoatTrip>[].obs;
  List<BoatTrip> get currentView => _currentView.value;

  @override
  Future<void> onInit() async {
    super.onInit();
    print("onInit ran");
    print(source);
  }

  Future<void> updateList(String source) async {
    visibility = false;
    _currentView.value = await Database().getBoatTrip(source);
    visibility = true;
  }
}
