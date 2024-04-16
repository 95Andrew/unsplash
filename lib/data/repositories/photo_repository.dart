import 'package:unsplash/data/managers/network_manager.dart';
import 'package:unsplash/data/models/network_response_model.dart';
import 'package:unsplash/data/models/unsplash_photo_model.dart';

class PhotoRepository {
  final NetworkManager networkManager;

  PhotoRepository(this.networkManager);

  Future<NetworkResponseModel<List<UnsplashPhotoModel>?>> getPhotos() => networkManager.getPhotos();
}
