import 'package:clyr_mobile/src/core/error/exception.dart';
import 'package:fpdart/fpdart.dart';

/// FutureEither with AppException as Left type
typedef FutureEither<R> = Future<Either<AppException, R>>;
