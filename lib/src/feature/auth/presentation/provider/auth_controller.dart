import 'package:clyr_mobile/src/feature/auth/infra/usecase/auth_usecases_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<void> build() {
    return null;
  }

  Future<void> login(String email, String password) async {
    state = const AsyncLoading();
    final usecases = ref.read(authUseCasesProvider);

    state = await AsyncValue.guard(() async {
      final result = await usecases.login((email: email, password: password));
      return result.fold((l) => throw l, (r) => r);
    });
  }

  Future<void> signup(String email, String password, String fullName) async {
    state = const AsyncLoading();
    final usecases = ref.read(authUseCasesProvider);

    state = await AsyncValue.guard(() async {
      final result = await usecases.signup((
        email: email,
        password: password,
        fullName: fullName,
      ));
      return result.fold((l) => throw l, (r) => r);
    });
  }

  Future<void> logout() async {
    state = const AsyncLoading();
    final usecases = ref.read(authUseCasesProvider);

    final result = await usecases.logout(null);

    if (ref.mounted) {
      state = result.fold(
        (l) => AsyncError(l, StackTrace.current),
        (_) => const AsyncData(null),
      );
    }
  }
}
