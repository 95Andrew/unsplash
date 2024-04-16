import 'package:dio/dio.dart';
import 'package:unsplash/data/constants.dart';

class DioManager {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      headers: {
        'Content-Type': 'application/json',
        'Cache-Control': 'no-store',
      },
    ),
  );
}
