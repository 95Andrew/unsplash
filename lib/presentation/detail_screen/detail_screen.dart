import 'package:flutter/material.dart';
import 'package:unsplash/data/models/unsplash_photo_model.dart';

class DetailScreen extends StatelessWidget {
  final UnsplashPhotoModel unsplashPhoto;

  const DetailScreen({
    required this.unsplashPhoto,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(unsplashPhoto.urls.full),
              fit: BoxFit.cover,
              alignment: FractionalOffset.center,
            ),
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
      ),
    );
  }
}
