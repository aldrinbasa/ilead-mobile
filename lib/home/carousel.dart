import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'assets/images/slide-one.jpg',
  'assets/images/slide-two.png',
];

final themeMode = ValueNotifier(2);

final List<Widget> imageSliders = imgList
    .map((item) => Container(
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Image.asset(
            item,
            fit: BoxFit.cover,
            width: 1000.0,
          ),
        ),
      ),
    ))
    .toList();

class ComplicatedImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.5,
          enlargeCenterPage: true,
        ),
        items: imageSliders,
      ),
    );
  }
}