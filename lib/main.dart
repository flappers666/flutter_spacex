import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spacex/app.dart';

void main() {
  BaseOptions dioBaseOptions = BaseOptions(
    connectTimeout: 5000,
    receiveTimeout: 5000,
    contentType: 'application/json',
    validateStatus: (status) =>
        status != null && status >= 200 && status <= 299,
  );

  final Dio _dio = new Dio(dioBaseOptions);

  runApp(const App());
}
