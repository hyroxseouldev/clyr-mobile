import 'package:clyr_mobile/src/core/supabase/supabase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'session_provider.g.dart';

@riverpod
class SessionNotifier extends _$SessionNotifier {
  @override
  AsyncValue<User?> build() {
    final client = ref.watch(supabaseClientProvider);

    // 초기 세션 상태 설정
    final session = client.auth.currentSession;

    // 인증 상태 변화 구독
    client.auth.onAuthStateChange.listen((data) {
      state = AsyncData(data.session?.user);
    });

    return AsyncData(session?.user);
  }

  // 로그아웃 등의 기능 추가 가능
  Future<void> signOut() async {
    await ref.read(supabaseClientProvider).auth.signOut();
  }
}
