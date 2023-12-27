import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:wallpaper_app/controllers/home_controller.dart';
import 'package:wallpaper_app/widgets/category_card.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Wallpaper App"),
          centerTitle: true,
        ),
        body: RefreshIndicator(
          onRefresh: () => controller.refreshPhotos(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView(
              controller: controller.scrollController,
              children: [
                const Text(
                  "Category",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                CategoryCard(),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Popular Photos",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  onSubmitted: controller.searchPhotos,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black54, width: 5.0),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: 'Search here ...',
                      prefixIcon: Container(
                        padding: const EdgeInsets.all(15),
                        child: const Icon(Icons.search),
                      ),
                      contentPadding: const EdgeInsets.all(2.0)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Obx(() => controller.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : StaggeredGrid.count(
                        crossAxisCount: 2,
                        children: List.generate(
                            controller.hasMore.value
                                ? controller.result.length + 1
                                : controller.result.length,
                            (index) => (index == controller.result.length) &&
                                    controller.hasMore.value
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : StaggeredGridTile.count(
                                    crossAxisCellCount: 1,
                                    mainAxisCellCount: index % 2 == 0 ? 1 : 2,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          child: Image.network(
                                            controller
                                                .result[index].src.portrait,
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  )))),
              ],
            ),
          ),
        ));
  }
}
