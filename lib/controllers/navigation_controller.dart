import 'package:get/get.dart';

class NavigationController extends GetxController {
  var selectedIndex = 0.obs;
  final labels = ['Home', 'Appointments', 'Messages', 'Profile'];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}