import 'package:flutter/material.dart';
import 'package:clyr_mobile/flavors.dart';
import 'package:clyr_mobile/src/app.dart';
import 'package:clyr_mobile/src/core/config/env.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  F.appFlavor = Flavor.prod;

  // Supabase 초기화
  await Supabase.initialize(
    url: Env.supabaseUrl,
    anonKey: Env.supabaseAnonKey,
    debug: F.appFlavor == Flavor.prod, // 개발 모드에서는 로그 확인
  );

  runApp(ProviderScope(child: const App()));
}
