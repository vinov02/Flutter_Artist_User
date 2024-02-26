
import 'package:flutter/material.dart';

class ExhibitionCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String place;
  final String time;

  const ExhibitionCard({super.key,
    required this.imageUrl,
    required this.name,
    required this.place,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: 250,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(place),
            Text(time),
          ],
        ),
      ),
    );
  }
}
