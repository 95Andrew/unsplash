import 'package:flutter/material.dart';

import 'core/unsplash_router.dart';

class UnsplashApp extends StatelessWidget {
  const UnsplashApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: UnsplashRouter.home,
      onGenerateRoute: UnsplashRouter.generateRoute,
    );
  }
}
