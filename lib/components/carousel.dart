import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class TopCarouselSection extends StatefulWidget {
  const TopCarouselSection({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TopCarouselSectionState createState() => _TopCarouselSectionState();
}

class _TopCarouselSectionState extends State<TopCarouselSection> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 150.0,
            autoPlay: true,
            aspectRatio: 16 / 9,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: [1, 2, 3,4].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: const BoxDecoration(
                    color: Colors.white10,
                  ),
                  child: Image.network(
                    'https://images7.alphacoders.com/133/1337829.png',
                    fit: BoxFit.cover,
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [0, 1, 2, 3].map((index) {
            return Container(
              width: 8.0,
              height: 8.0,
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index ? Colors.black : Colors.grey,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
