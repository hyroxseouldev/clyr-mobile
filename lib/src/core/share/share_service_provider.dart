import 'package:clyr_mobile/src/core/share/share_service.dart';
import 'package:clyr_mobile/src/core/share/share_service_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'share_service_provider.g.dart';

/// Share service provider
@riverpod
ShareService shareService(Ref ref) {
  return ShareServiceImpl();
}
