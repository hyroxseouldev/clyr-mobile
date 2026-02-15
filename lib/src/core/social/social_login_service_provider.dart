import 'package:clyr_mobile/src/core/social/social_login_service.dart';
import 'package:clyr_mobile/src/core/social/social_login_service_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'social_login_service_provider.g.dart';

@Riverpod(keepAlive: true)
SocialLoginService socialLoginService(Ref ref) {
  return SocialLoginServiceImpl();
}
