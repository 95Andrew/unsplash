import 'package:flutter/material.dart';
import 'package:unsplash/data/models/unsplash_photo_model.dart';

class PhotoInfoButton extends StatelessWidget {
  final UnsplashPhotoModel unsplashPhoto;

  const PhotoInfoButton({
    required this.unsplashPhoto,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.grey,
        image: DecorationImage(
          image: NetworkImage(unsplashPhoto.urls.full),
          fit: BoxFit.cover,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              maxLines: 1,
              unsplashPhoto.description ?? 'description',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w800,
                color: Colors.amberAccent,
              ),
            ),
            Text(
              unsplashPhoto.user.username,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: Colors.amberAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
