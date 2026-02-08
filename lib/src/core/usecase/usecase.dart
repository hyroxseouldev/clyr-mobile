import 'package:clyr_mobile/src/core/util/type_defs.dart';

abstract class Usecase<I, O> {
  FutureEither<O> call(I input);
}

class NoParams {
  const NoParams();
}
