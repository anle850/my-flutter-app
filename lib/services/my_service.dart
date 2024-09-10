import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'setup_dio.dart';

class MyService {
  MyService() {
    _configureDio();
  }

  void _configureDio() {
    (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback = (cert, host, port) => true;
      return client;
    };
  }

  Future<String> fetchData() async {
    try {
      final response = await dio.post('/action/find', data: {
        'collection': 'users',
        'database': 'binhdien',
        'dataSource': 'knorie-cluster',
        'filter': {},
        'projection': {'email': 1, '_id': 0}
      });

      if (response.data['documents'] != null) {
        final List<dynamic> documents = response.data['documents'];
        final List<String> emails =
            documents.map((doc) => doc['email'] as String).toList();
        return emails.join('\n');
      } else {
        return 'No emails found or unexpected response format';
      }
    } on DioException catch (e) {
      if (e.error is HandshakeException) {
        return 'SSL certificate error: ${e.error}. Please check your internet connection or try again later.';
      }
      return 'Unexpected error: ${e.toString()}\nPlease try again.';
    }
  }

  Future<List<String>> fetchFruitData() async {
    try {
      final response = await dio.post('/action/find', data: {
        'collection': 'fruits',
        'database': 'flutter_app',
        'dataSource': 'knorie-cluster',
        'filter': {},
        'projection': {'fruits': 1, '_id': 0}
      });

      if (response.data['documents'] != null) {
        final List<dynamic> documents = response.data['documents'];
        if (documents.isNotEmpty && documents[0]['fruits'] is List) {
          return List<String>.from(documents[0]['fruits']);
        }
      }
      return ['No fruits found or unexpected response format'];
    } on DioException catch (e) {
      if (e.error is HandshakeException) {
        return [
          'SSL certificate error: ${e.error}. Please check your internet connection or try again later.'
        ];
      }
      return ['Unexpected error: ${e.toString()}\nPlease try again.'];
    } catch (e) {
      return ['An unexpected error occurred: ${e.toString()}'];
    }
  }
}
