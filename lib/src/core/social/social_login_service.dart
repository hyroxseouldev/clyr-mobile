import 'package:clyr_mobile/src/core/social/entity/social_auth_token.dart';
import 'package:clyr_mobile/src/core/util/type_defs.dart';

abstract class SocialLoginService {
  FutureEither<SocialAuthToken> signInWithGoogle();
}
