import 'package:clyr_mobile/src/feature/auth/data/user_repository.dart';
import 'package:clyr_mobile/src/feature/auth/infra/usecase/auth_usecases.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_usecases_provider.g.dart';

@riverpod
AuthUseCases authUseCases(Ref ref) {
  final repository = ref.read(userRepositoryProvider);
  return AuthUseCases.fromRepository(repository);
}
