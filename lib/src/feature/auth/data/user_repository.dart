import 'package:clyr_mobile/src/core/exception/exception.dart';
import 'package:clyr_mobile/src/core/supabase/supabase_provider.dart';
import 'package:clyr_mobile/src/core/typedef/typedef.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

part 'user_repository.g.dart';

@Riverpod(keepAlive: true)
UserRepository userRepository(Ref ref) {
  final supabase = ref.watch(supabaseClientProvider);
  return UserRepositoryImpl(supabase: supabase);
}

abstract interface class UserRepository {
  FutureEither<AuthException, void> login(
    ({String email, String password}) params,
  );
  FutureEither<AuthException, void> signup(
    ({String email, String password}) params,
  );
  FutureEither<AuthException, void> logout();
}

class UserRepositoryImpl implements UserRepository {
  final sb.SupabaseClient supabase;
  UserRepositoryImpl({required this.supabase});

  @override
  FutureEither<AuthException, void> login(
    ({String email, String password}) params,
  ) async {
    try {
      await supabase.auth.signInWithPassword(
        email: params.email,
        password: params.password,
      );
      return right(null);
    } on sb.AuthException catch (e) {
      return left(AuthException(code: e.code ?? 'unknown', message: e.message));
    } catch (e) {
      return left(AuthException(code: 'unknown', message: e.toString()));
    }
  }

  @override
  FutureEither<AuthException, void> signup(
    ({String email, String password}) params,
  ) async {
    try {
      await supabase.auth.signUp(
        email: params.email,
        password: params.password,
      );
      return right(null);
    } on sb.AuthException catch (e) {
      return left(AuthException(code: e.code ?? 'unknown', message: e.message));
    } catch (e) {
      return left(AuthException(code: 'unknown', message: e.toString()));
    }
  }

  @override
  FutureEither<AuthException, void> logout() async {
    try {
      await supabase.auth.signOut();
      return right(null);
    } on sb.AuthException catch (e) {
      return left(AuthException(code: e.code ?? 'unknown', message: e.message));
    } catch (e) {
      return left(AuthException(code: 'logout-error', message: e.toString()));
    }
  }
}
