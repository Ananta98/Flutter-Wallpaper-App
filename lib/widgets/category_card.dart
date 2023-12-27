import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_app/controllers/home_controller.dart';
import 'package:wallpaper_app/models/category.dart';

// ignore: must_be_immutable
class CategoryCard extends GetView<HomeController> {
  CategoryCard({super.key});

  List<Category> categories = [
    Category(
        name: "Street Art",
        imageUrl:
            "https://images.pexels.com/photos/545008/pexels-photo-545008.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
    Category(
        name: "Wild Life",
        imageUrl:
            "https://images.pexels.com/photos/704320/pexels-photo-704320.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
    Category(
        name: "Nature",
        imageUrl:
            "https://images.pexels.com/photos/34950/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
    Category(
        name: "Motivation",
        imageUrl:
            "https://images.pexels.com/photos/1434819/pexels-photo-1434819.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260"),
    Category(
        name: "Bikes",
        imageUrl:
            "https://images.pexels.com/photos/2116475/pexels-photo-2116475.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                controller.searchPhotos(categories[index].name);
              },
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                        image: NetworkImage(categories[index].imageUrl),
                        fit: BoxFit.cover),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 2),
                          blurRadius: 6.0)
                    ]),
                child: Center(
                  child: Text(
                    categories[index].name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
