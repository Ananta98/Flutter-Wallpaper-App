import 'package:get/get.dart';
import 'package:wallpaper_app/controllers/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}