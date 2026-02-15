import 'package:clyr_mobile/src/core/error/exception.dart';
import 'package:clyr_mobile/src/core/social/entity/social_auth_token.dart';
import 'package:clyr_mobile/src/core/social/social_login_service.dart';
import 'package:clyr_mobile/src/core/util/type_defs.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SocialLoginServiceImpl implements SocialLoginService {
  SocialLoginServiceImpl({GoogleSignIn? googleSignIn})
    : _googleSignIn = googleSignIn ?? GoogleSignIn.instance;

  final GoogleSignIn _googleSignIn;

  @override
  FutureEither<SocialAuthToken> signInWithGoogle() async {
    debugPrint('🌐 [SocialLoginService] Starting Google sign in');

    try {
      final account = await _googleSignIn.authenticate();
      final authentication = account.authentication;
      final idToken = authentication.idToken;

      if (idToken == null || idToken.isEmpty) {
        debugPrint('❌ [SocialLoginService] Missing Google ID token');
        return left(AppException.auth('Google ID token is missing'));
      }

      debugPrint('✅ [SocialLoginService] Google sign in success');
      return right(SocialAuthToken(idToken: idToken));
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) {
        debugPrint('📭 [SocialLoginService] Google sign in cancelled');
        return left(AppException.auth('Google sign in was cancelled'));
      }

      debugPrint(
        '❌ [SocialLoginService] Google sign in failed: ${e.description}',
      );
      return left(AppException.auth('Google sign in failed: ${e.description}'));
    } catch (e) {
      debugPrint('❌ [SocialLoginService] Google sign in error: $e');
      return left(AppException.auth('Google sign in error: $e'));
    }
  }
}
