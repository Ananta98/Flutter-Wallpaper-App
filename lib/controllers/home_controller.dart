import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:wallpaper_app/models/photo.dart';
import 'package:wallpaper_app/services/api_response.dart';
import 'package:wallpaper_app/services/api_service.dart';

class HomeController extends GetxController {
  APIService service = APIService();
  RxList<Photo> result = <Photo>[].obs;
  var isLoading = true.obs;
  var page = 1.obs;
  var hasMore = false.obs;
  RxString searchTerm = "".obs;
  int pageSize = 20;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    getPhotos();
    scrollController.addListener(() {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        getPhotos();
      }
    });
    super.onInit();
  }

  getPhotos() async {
    ApiResponse<Photo> response = await service.getPhotos(
        page: page.value, pageSize: pageSize, search: searchTerm);
    if (response.success == true) {
      hasMore.value = response.data.length >= pageSize;
      result.addAll(response.data);
      if (hasMore.value) {
        page++;
      }
    } else {
      Get.snackbar("Error", response.message);
    }
    isLoading.value = false;
    update();
  }

  searchPhotos(String value) async {
    page.value = 1;
    searchTerm.value = value;
    isLoading.value = true;
    getPhotos();
  }

  refreshPhotos() async {
    getPhotos();
  }
}
