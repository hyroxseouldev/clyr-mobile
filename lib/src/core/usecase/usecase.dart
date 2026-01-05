// usecase

import 'package:clyr_mobile/src/core/exception/exception.dart';
import 'package:clyr_mobile/src/core/typedef/typedef.dart';

abstract class Usecase<I, O> {
  FutureEither<AppException, O> call(I input);
}

class NoParams {
  const NoParams();
}
