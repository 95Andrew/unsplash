import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:unsplash/data/models/unsplash_photo_model.dart';
import 'package:unsplash/presentation/detail_screen/detail_screen.dart';
import 'package:unsplash/presentation/home_screen/home_cubit/home_cubit.dart';
import 'package:unsplash/presentation/home_screen/home_screen.dart';

class UnsplashRouter {
  static const String home = 'home';
  static const String detail = 'detail';

  static Route<dynamic>? generateRoute(RouteSettings routeSettings) {
    final arguments = routeSettings.arguments;

    switch (routeSettings.name) {
      case home:
        return _createHomeRoute();
      case detail:
        return _createDetailRoute(arguments as UnsplashPhotoModel);

      default:
        return null;
    }
  }

  static MaterialPageRoute<void> _createHomeRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return BlocProvider(
          create: (context) => GetIt.I<HomeCubit>(),
          child: const HomeScreen(),
        );
      },
    );
  }

  static MaterialPageRoute<void> _createDetailRoute(UnsplashPhotoModel unsplashPhoto) {
    return MaterialPageRoute(
      builder: (context) {
        return DetailScreen(unsplashPhoto: unsplashPhoto);
      },
    );
  }
}
