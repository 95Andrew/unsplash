import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplash/data/models/network_response_model.dart';
import 'package:unsplash/data/models/unsplash_photo_model.dart';
import 'package:unsplash/data/repositories/photo_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final PhotoRepository photoRepository;

  HomeCubit(this.photoRepository) : super(HomeInitialState()) {
    fetchData();
  }

  Future<void> fetchData() async {
    emit(HomeLoadingState());

    final NetworkResponseModel<List<UnsplashPhotoModel>?> r = await photoRepository.getPhotos();

    if (r.isError || r.result == null) {
      emit(HomeErrorState());
    } else {
      emit(HomeContentState(r.result!));
    }
  }

  Future<void> goToDetail( UnsplashPhotoModel unsplashPhoto) async {
    emit(HomeRedirectToDetailState(unsplashPhoto));
  }
}
