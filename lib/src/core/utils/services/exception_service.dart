import 'dart:io';

import 'package:axolor_mobile/src/core/exceptions/bad_request_exception.dart';
import 'package:axolor_mobile/src/core/exceptions/not_found_exception.dart';
import 'package:axolor_mobile/src/core/exceptions/unauthorized_exception.dart';

class ExceptionService {
  Exception throwAppropriateException({required int statusCode}) {
    switch (statusCode) {
      case 400:
        return BadRequestException('Bad request');
      case 401:
        return UnauthorizedException('Unauthorized');
      case 404:
        return NotFoundException('Resource not found');
      default:
        return const HttpException('HTTP Error');
    }
  }
}
