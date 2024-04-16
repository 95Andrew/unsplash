import 'package:flutter/material.dart';

import 'core/injector.dart' as injector;
import 'unsplash_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injector.init();
  runApp(const UnsplashApp());
}
