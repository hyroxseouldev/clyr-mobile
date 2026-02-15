import 'package:clyr_mobile/src/core/data/dto.dart';
import 'package:clyr_mobile/src/core/supabase/supabase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

part 'auth_data_source.g.dart';

/// Authentication Data Source Provider
@Riverpod(keepAlive: true)
AuthDataSource authDataSource(Ref ref) {
  final supabase = ref.read(supabaseClientProvider);
  return SupabaseAuthDataSource(supabase: supabase);
}

/// Authentication Data Source Interface
///
/// Handles authentication operations and user profile CRUD.
/// All methods throw Exception on failure (following CoreDataSource pattern).
abstract interface class AuthDataSource {
  /// Sign in with email and password
  Future<void> login({required String email, required String password});

  /// Sign up with email, password, and user metadata
  Future<void> signup({
    required String email,
    required String password,
    required String fullName,
  });

  /// Sign out current user
  Future<void> logout();

  /// Sign in with Google token
  Future<void> loginWithGoogle({required String idToken, String? accessToken});

  /// Get current user's ID
  String? getCurrentUserId();

  /// Get current user's profile
  Future<UserProfileDto> getUserProfile();

  /// Create a new user profile
  Future<UserProfileDto> createUserProfile({
    required String accountId,
    String? nickname,
    String? bio,
    String? profileImageUrl,
    String? phoneNumber,
    List<String>? fitnessGoals,
    String? fitnessLevel,
  });

  /// Update existing user profile (or create if not exists)
  Future<UserProfileDto> updateUserProfile({
    required String accountId,
    String? nickname,
    String? bio,
    String? profileImageUrl,
    String? phoneNumber,
    List<String>? fitnessGoals,
    String? fitnessLevel,
    bool? onboardingCompleted,
    Map<String, dynamic>? onboardingData,
  });
}

/// Supabase implementation of AuthDataSource
class SupabaseAuthDataSource implements AuthDataSource {
  final sb.SupabaseClient supabase;

  SupabaseAuthDataSource({required this.supabase});

  @override
  Future<void> login({required String email, required String password}) async {
    try {
      await supabase.auth.signInWithPassword(email: email, password: password);
    } on sb.AuthException catch (e) {
      throw Exception('Login failed: ${e.message}');
    } catch (e) {
      throw Exception('Login error: $e');
    }
  }

  @override
  Future<void> signup({
    required String email,
    required String password,
    required String fullName,
  }) async {
    try {
      await supabase.auth.signUp(
        email: email,
        password: password,
        data: {'full_name': fullName, 'role': 'USER', 'avatar_url': ''},
      );
    } on sb.AuthException catch (e) {
      throw Exception('Signup failed: ${e.message}');
    } catch (e) {
      throw Exception('Signup error: $e');
    }
  }

  @override
  Future<void> logout() async {
    try {
      await supabase.auth.signOut();
    } on sb.AuthException catch (e) {
      throw Exception('Logout failed: ${e.message}');
    } catch (e) {
      throw Exception('Logout error: $e');
    }
  }

  @override
  Future<void> loginWithGoogle({
    required String idToken,
    String? accessToken,
  }) async {
    try {
      await supabase.auth.signInWithIdToken(
        provider: sb.OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );
    } on sb.AuthException catch (e) {
      throw Exception('Google login failed: ${e.message}');
    } catch (e) {
      throw Exception('Google login error: $e');
    }
  }

  @override
  String? getCurrentUserId() {
    return supabase.auth.currentUser?.id;
  }

  @override
  Future<UserProfileDto> getUserProfile() async {
    final userId = supabase.auth.currentUser?.id;
    if (userId == null) {
      throw Exception('User not authenticated');
    }

    try {
      final response = await supabase
          .from('user_profile')
          .select()
          .eq('account_id', userId)
          .maybeSingle();

      if (response == null) {
        throw Exception('User profile not found');
      }

      return UserProfileDto.fromJson(response);
    } catch (e) {
      throw Exception('Failed to get user profile: $e');
    }
  }

  @override
  Future<UserProfileDto> createUserProfile({
    required String accountId,
    String? nickname,
    String? bio,
    String? profileImageUrl,
    String? phoneNumber,
    List<String>? fitnessGoals,
    String? fitnessLevel,
  }) async {
    try {
      final insertData = <String, dynamic>{
        'account_id': accountId,
        if (nickname != null) 'nickname': nickname,
        if (bio != null) 'bio': bio,
        if (profileImageUrl != null) 'profile_image_url': profileImageUrl,
        if (phoneNumber != null) 'phone_number': phoneNumber,
        if (fitnessGoals != null) 'fitness_goals': fitnessGoals,
        if (fitnessLevel != null) 'fitness_level': fitnessLevel,
        'updated_at': DateTime.now().toIso8601String(),
      };

      final response = await supabase
          .from('user_profile')
          .insert(insertData)
          .select()
          .single();

      return UserProfileDto.fromJson(response);
    } catch (e) {
      throw Exception('Failed to create user profile: $e');
    }
  }

  @override
  Future<UserProfileDto> updateUserProfile({
    required String accountId,
    String? nickname,
    String? bio,
    String? profileImageUrl,
    String? phoneNumber,
    List<String>? fitnessGoals,
    String? fitnessLevel,
    bool? onboardingCompleted,
    Map<String, dynamic>? onboardingData,
  }) async {
    try {
      // Get existing profile
      final existing = await supabase
          .from('user_profile')
          .select()
          .eq('account_id', accountId)
          .maybeSingle();

      final updateData = <String, dynamic>{
        if (nickname != null) 'nickname': nickname,
        if (bio != null) 'bio': bio,
        if (profileImageUrl != null) 'profile_image_url': profileImageUrl,
        if (phoneNumber != null) 'phone_number': phoneNumber,
        if (fitnessGoals != null) 'fitness_goals': fitnessGoals,
        if (fitnessLevel != null) 'fitness_level': fitnessLevel,
        if (onboardingCompleted != null)
          'onboarding_completed': onboardingCompleted,
        if (onboardingData != null) 'onboarding_data': onboardingData,
        if (onboardingCompleted == true)
          'onboarding_completed_at': DateTime.now().toIso8601String(),
        'updated_at': DateTime.now().toIso8601String(),
      };

      if (existing == null) {
        // Create new profile
        final response = await supabase
            .from('user_profile')
            .insert({...updateData, 'account_id': accountId})
            .select()
            .single();
        return UserProfileDto.fromJson(response);
      } else {
        // Update existing profile
        final response = await supabase
            .from('user_profile')
            .update(updateData)
            .eq('account_id', accountId)
            .select()
            .single();
        return UserProfileDto.fromJson(response);
      }
    } catch (e) {
      throw Exception('Failed to update user profile: $e');
    }
  }
}
