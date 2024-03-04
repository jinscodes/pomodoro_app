import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TrackSlider extends StatelessWidget {
  final int height;

  const TrackSlider({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CarouselSlider(
        options: CarouselOptions(
          height: 300.0,
        ),
        items: [1, 2, 3, 4, 5].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: const BoxDecoration(color: Colors.amber),
                child: Text(
                  'text $i',
                  style: const TextStyle(fontSize: 16.0),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
