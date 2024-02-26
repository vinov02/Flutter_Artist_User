import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  const ImageCard({super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: 345,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
          ),
          Text(description),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black
            ),
            onPressed: () {
              // Implement button functionality
            },
            child: const Text('Explore',style: TextStyle(color: Colors.white),),
          ),
        ],
      ),
    );
  }
}