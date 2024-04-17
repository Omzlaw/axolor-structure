// import 'package:injectable/injectable.dart';

// @module
// abstract class InjectableModule {

// }

import 'package:axolor_mobile/src/features/authentication/data/data_sources/remote/create_sumsub_token_data_source.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';


final GetIt getIt = GetIt.instance;

@injectableInit
Future<void> configureDependencies() async {
    getIt.registerSingleton<CreateSumsubTokenDataSource>(
      CreateSumsubTokenDataSourceImpl(
          sumsubClientGenerator: SumsubClientGenerator()));
}
