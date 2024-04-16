import 'package:dio/dio.dart';
import 'package:unsplash/data/constants.dart';
import 'package:unsplash/data/models/network_response_model.dart';

import 'package:unsplash/data/models/unsplash_photo_model.dart';

import 'dio_manager.dart';

class NetworkManager {
  final DioManager dioManager;

  NetworkManager(this.dioManager);

  Future<NetworkResponseModel<List<UnsplashPhotoModel>?>> getPhotos() async {
    try {
      final Response<dynamic> response = await dioManager.dio.get<dynamic>(
        photosPath,
        queryParameters: {
          'page': 1,
          'client_id': clientId,
        },
      );

      final List<UnsplashPhotoModel> l = [];

      final res = response.data;

      for (final photo in res) {
        l.add(UnsplashPhotoModel.fromJson(photo));
      }

      return NetworkResponseModel(result: l);
    } on DioException catch (_) {
      return NetworkResponseModel(isError: true);
    }
  }
}
