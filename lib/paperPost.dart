import 'package:bio_blog/theme.dart';
import 'package:flutter/material.dart';

class PaperPost extends StatelessWidget {
  final String title;
  final String imageURL;
  final bool even;

  PaperPost({required this.title, required this.imageURL, required this.even});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.0,
      decoration: BoxDecoration(
        color: (even) ? AppColors.purple : AppColors.green,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 24),
            ),
          ),
          SizedBox(height: 8.0),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              imageURL,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 300.0,
            ),
          ),
        ],
      ),
    );
  }
}
