import 'package:clyr_mobile/src/core/exception/exception.dart';
import 'package:clyr_mobile/src/core/supabase/supabase_provider.dart';
import 'package:clyr_mobile/src/core/typedef/typedef.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide AuthException;

part 'user_repository.g.dart';

@Riverpod(keepAlive: true)
UserRepository userRepository(Ref ref) {
  final supabase = ref.read(supabaseClientProvider);
  return UserRepositoryImpl(supabase: supabase);
}

abstract class UserRepository {
  FutureEither<AppException, void> login(String email, String password);
  FutureEither<AppException, void> signup(String email, String password);
  FutureEither<AppException, void> logout();
}

class UserRepositoryImpl extends UserRepository {
  final SupabaseClient supabase;
  UserRepositoryImpl({required this.supabase});

  @override
  FutureEither<AppException, void> login(String email, String password) {
    return FutureEither(() async {
      try {
        final response = await supabase.auth.signInWithPassword(
          email: email,
          password: password,
        );
        return right(response.user?.toJson() ?? {});
      } catch (e) {
        return left(AuthException(e.toString()));
      }
    });
  }

  @override
  FutureEither<AppException, void> signup(String email, String password) async {
    try {
      final response = await supabase.auth.signUp(
        email: email,
        password: password,
      );
      return right(response.user?.toJson() ?? {});
    } catch (e) {
      return left(AuthException(e.toString()));
    }
  }

  @override
  FutureEither<AppException, void> logout() async {
    try {
      await supabase.auth.signOut();
      return right(null);
    } catch (e) {
      return left(AuthException(e.toString()));
    }
  }
}
