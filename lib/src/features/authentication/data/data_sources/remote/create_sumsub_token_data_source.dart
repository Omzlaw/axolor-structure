

import 'package:axolor_mobile/src/core/di/dependency_injector.dart';
import 'package:axolor_mobile/src/features/authentication/data/models/create_sumsub_token_entity.dart';
import 'package:axolor_mobile/src/features/authentication/data/repositories/sumsub_client_generator.dart';
import 'package:injectable/injectable.dart';

abstract class CreateSumsubTokenDataSource {
  Future<CreateSumsubTokenEntity> getToken();
}

@Injectable(as: CreateSumsubTokenDataSource)
class CreateSumsubTokenDataSourceImpl implements CreateSumsubTokenDataSource {
  final SumsubClientGenerator sumsubClientGenerator;

  CreateSumsubTokenDataSourceImpl({required this.sumsubClientGenerator});

  @override
  Future<CreateSumsubTokenEntity> getToken() async {
    final response = await sumsubClientGenerator.generateToken();
    if (response.statusCode == 200) {
      final createSumsubTokenEntity = CreateSumsubTokenEntity.fromJson(
          response.data as Map<String, dynamic>);
      return createSumsubTokenEntity;
    } else {
      throw getIt<ExceptionService>()
          .throwAppropriateException(statusCode: response.statusCode);
    }
  }
}
