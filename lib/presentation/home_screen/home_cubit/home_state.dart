part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeErrorState extends HomeState {}

class HomeContentState extends HomeState {
  final List<UnsplashPhotoModel> photoList;

  HomeContentState(this.photoList);
}

class HomeEmptyState extends HomeState {}

class HomeRedirectToDetailState extends HomeState {
  final UnsplashPhotoModel unsplashPhoto;

  HomeRedirectToDetailState(this.unsplashPhoto);
}
