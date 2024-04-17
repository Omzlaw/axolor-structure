import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/services.dart';

class NetworkService {
  final Dio _dio = Dio();

  NetworkService() {
    _setupPinning();
  }

  void _setupPinning() async {
    ByteData certificates = await rootBundle.load('assets/id_ed25519.pem');

    (_dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final securityContext = SecurityContext(); //1
      securityContext
          .setTrustedCertificatesBytes(certificates.buffer.asUint8List());
      return HttpClient(context: securityContext);
    };
  }

  Future<Response> get(String endpoint, config) async {
    try {
      final response = await _dio.get(endpoint);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
