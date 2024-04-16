import 'user_model.dart';

class UnsplashPhotoModel {
  final String id;
  final String? description;
  final Urls urls;
  final User user;

  UnsplashPhotoModel({
    required this.id,
    required this.description,
    required this.urls,
    required this.user,
  });

  factory UnsplashPhotoModel.fromJson(Map<String, dynamic> json) => UnsplashPhotoModel(
        id: json["id"],
        description: json["description"],
        urls: Urls.fromJson(json["urls"]),
        user: User.fromJson(json["user"]),
      );
}

class Urls {
  final String raw;
  final String full;
  final String regular;
  final String small;
  final String thumb;
  final String smallS3;

  Urls({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
    required this.smallS3,
  });

  factory Urls.fromJson(Map<String, dynamic> json) => Urls(
        raw: json["raw"],
        full: json["full"],
        regular: json["regular"],
        small: json["small"],
        thumb: json["thumb"],
        smallS3: json["small_s3"],
      );
}
