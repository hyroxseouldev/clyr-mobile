import 'package:clyr_mobile/src/core/data/dto.dart';
import 'package:clyr_mobile/src/core/supabase/supabase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

part 'data_source.g.dart';

@Riverpod(keepAlive: true)
CoreDataSource coreDataSource(Ref ref) {
  final supabase = ref.watch(supabaseClientProvider);
  return SupabaseDataSource(supabase: supabase);
}

abstract interface class CoreDataSource {
  Future<ProgramsDto> getCurrentActiveProgram();
  Future<List<BlueprintSectionItemsDto>> getBlueprintSectionItemsByDate({
    required DateTime date,
    bool isTest = false,
  });

  /// Create a new section record
  Future<SectionRecordDto> createSectionRecord({
    required String sectionId,
    required String sectionItemId,
    Map<String, dynamic>? content,
  });

  /// Get section records for main workout (main_workout) sections by date
  Future<List<SectionRecordDto>> getMainWorkoutSectionRecords({
    required DateTime date,
    bool isTest = false,
  });

  /// Check if user has completed onboarding
  Future<bool> checkOnboardingStatus();

  /// Complete onboarding with user data
  Future<void> completeOnboarding(Map<String, dynamic> data);
}

class SupabaseDataSource implements CoreDataSource {
  final sb.SupabaseClient supabase;
  SupabaseDataSource({required this.supabase});

  @override
  Future<ProgramsDto> getCurrentActiveProgram() async {
    final userId = supabase.auth.currentUser?.id;
    if (userId == null) {
      throw Exception('User not authenticated');
    }

    try {
      final response = await supabase
          .from('enrollments')
          .select('''
            programs (
              id,
              coach_id,
              title,
              slug,
              type,
              description,
              is_public,
              is_for_sale,
              price,
              access_period_days,
              difficulty,
              duration_weeks,
              days_per_week,
              main_image_list,
              program_image,
              created_at,
              updated_at
            )
          ''')
          .eq('user_id', userId)
          .eq('status', 'ACTIVE')
          .maybeSingle();

      if (response == null) {
        throw Exception('No active enrollment found');
      }

      if (response['programs'] == null) {
        throw Exception('Program not found for active enrollment');
      }

      return ProgramsDto.fromJson(response['programs']);
    } catch (e) {
      print('getCurrentActiveProgram: error = $e');
      throw Exception('Failed to get active program: $e');
    }
  }

  @override
  Future<List<BlueprintSectionItemsDto>> getBlueprintSectionItemsByDate({
    required DateTime date,
    bool isTest = false,
  }) async {
    final userId = supabase.auth.currentUser?.id;
    if (userId == null) {
      throw Exception('User not authenticated');
    }

    try {
      // 1. Get active enrollment
      final enrollmentResponse = await supabase
          .from('enrollments')
          .select('start_date, program_id')
          .eq('user_id', userId)
          .eq('status', 'ACTIVE')
          .maybeSingle();

      if (enrollmentResponse == null) {
        throw Exception('No active enrollment found');
      }

      final startDate = DateTime.parse(enrollmentResponse['start_date']);
      final programId = enrollmentResponse['program_id'];

      // 2. Calculate day number (1-indexed)
      final dayNumber = isTest ? 1 : date.difference(startDate).inDays + 1;

      if (dayNumber < 1) {
        throw Exception('Date is before enrollment start date');
      }

      // 3. Calculate phase number (1-indexed, 7 days per phase)
      final phaseNumber = isTest ? 1 : (dayNumber - 1) ~/ 7 + 1;

      // 4. Query blueprint by program_id, phase_number, day_number
      final programBlueprint = await supabase
          .from('program_blueprints')
          .select('id')
          .eq('program_id', programId)
          .eq('phase_number', phaseNumber)
          .eq('day_number', dayNumber)
          .maybeSingle();

      if (programBlueprint == null) {
        return [];
      }

      final blueprintId = programBlueprint['id'] as String;

      // 5. Get blueprint_section_items with nested sections and records, ordered
      // Note: Supabase doesn't support filtering nested relationships directly,
      // so we fetch all and filter in the DTO
      final sectionItems = await supabase
          .from('blueprint_section_items')
          .select('''
            id,
            blueprint_id,
            section_id,
            order_index,
            created_at,
            blueprint_sections (
              id,
              title,
              content,
              created_at,
              updated_at
            ),
            section_records!section_item_id (
              id,
              user_id,
              user_profile_id,
              section_id,
              section_item_id,
              content,
              completed_at,
              coach_comment,
              created_at,
              updated_at
            )
          ''')
          .eq('blueprint_id', blueprintId)
          .order('order_index', ascending: true);
      return sectionItems
          .map((item) => BlueprintSectionItemsDto.fromJson(item))
          .toList();
    } catch (e) {
      print('getBlueprintSectionItemsByDate: error = $e');
      throw Exception('Failed to get blueprint sections: $e');
    }
  }

  @override
  Future<SectionRecordDto> createSectionRecord({
    required String sectionId,
    required String sectionItemId,
    Map<String, dynamic>? content,
  }) async {
    final userId = supabase.auth.currentUser?.id;
    if (userId == null) {
      throw Exception('User not authenticated');
    }

    try {
      // Get user profile ID
      final profileResponse = await supabase
          .from('user_profile')
          .select('id')
          .eq('account_id', userId)
          .maybeSingle();

      if (profileResponse == null) {
        throw Exception('User profile not found for user: $userId');
      }

      final userProfileId = profileResponse['id'] as String;

      final insertData = {
        'user_id': userId,
        'user_profile_id': userProfileId,
        'section_id': sectionId,
        'section_item_id': sectionItemId,
        'content': content ?? {},
      };

      final response = await supabase
          .from('section_records')
          .insert(insertData)
          .select()
          .single();

      return SectionRecordDto.fromJson(response);
    } catch (e) {
      print('createSectionRecord: error = $e');
      throw Exception('Failed to create section record: $e');
    }
  }

  @override
  Future<List<SectionRecordDto>> getMainWorkoutSectionRecords({
    required DateTime date,
    bool isTest = false,
  }) async {
    final userId = supabase.auth.currentUser?.id;
    if (userId == null) {
      throw Exception('User not authenticated');
    }

    try {
      // 1. Get active enrollment
      final enrollmentResponse = await supabase
          .from('enrollments')
          .select('start_date, program_id')
          .eq('user_id', userId)
          .eq('status', 'ACTIVE')
          .maybeSingle();

      if (enrollmentResponse == null) {
        throw Exception('No active enrollment found');
      }

      final startDate = DateTime.parse(enrollmentResponse['start_date']);
      final programId = enrollmentResponse['program_id'];

      // 2. Calculate day number (1-indexed)
      final dayNumber = isTest ? 1 : date.difference(startDate).inDays + 1;

      if (dayNumber < 1) {
        throw Exception('Date is before enrollment start date');
      }

      // 3. Calculate phase number (1-indexed, 7 days per phase)
      final phaseNumber = isTest ? 1 : (dayNumber - 1) ~/ 7 + 1;

      // 4. Query blueprint by program_id, phase_number, day_number
      final programBlueprint = await supabase
          .from('program_blueprints')
          .select('id')
          .eq('program_id', programId)
          .eq('phase_number', phaseNumber)
          .eq('day_number', dayNumber)
          .maybeSingle();

      if (programBlueprint == null) {
        return [];
      }

      final blueprintId = programBlueprint['id'] as String;

      // 5. Get blueprint_section_items with nested sections and records
      final sectionItems = await supabase
          .from('blueprint_section_items')
          .select('''
            id,
            blueprint_id,
            section_id,
            order_index,
            created_at,
            blueprint_sections!section_id (
              id,
              title,
              content,
              created_at,
              updated_at
            ),
            section_records!section_item_id (
              id,
              user_id,
              section_id,
              section_item_id,
              content,
              completed_at,
              coach_comment,
              created_at,
              updated_at,
              user_profile!user_profile_id (
                id,
                account_id,
                nickname,
                profile_image_url
              )
            )
          ''')
          .eq('blueprint_id', blueprintId)
          .order('order_index', ascending: true);
      // 6. Filter for "main_workout" (main workout) sections and collect records
      final List<SectionRecordDto> mainWorkoutRecords = [];

      for (final item in sectionItems) {
        final section = item['blueprint_sections'];
        if (section != null && section['title'] != null) {
          final title = section['title'] as String;
          // Check if title contains "main_workout" (main workout)
          if (title.contains('main_workout')) {
            final records = item['section_records'] as List?;
            if (records != null) {
              for (final record in records) {
                mainWorkoutRecords.add(SectionRecordDto.fromJson(record));
              }
            }
          }
        }
      }

      return mainWorkoutRecords;
    } catch (e) {
      print('getMainWorkoutSectionRecords: error = $e');
      throw Exception('Failed to get main workout section records: $e');
    }
  }

  @override
  Future<bool> checkOnboardingStatus() async {
    final userId = supabase.auth.currentUser?.id;
    if (userId == null) {
      throw Exception('User not authenticated');
    }

    try {
      final response = await supabase
          .from('user_profile')
          .select('onboarding_completed')
          .eq('account_id', userId)
          .maybeSingle();

      if (response == null) {
        return false;
      }

      return response['onboarding_completed'] as bool? ?? false;
    } catch (e) {
      print('checkOnboardingStatus: error = $e');
      throw Exception('Failed to check onboarding status: $e');
    }
  }

  @override
  Future<void> completeOnboarding(Map<String, dynamic> data) async {
    final userId = supabase.auth.currentUser?.id;
    if (userId == null) {
      throw Exception('User not authenticated');
    }

    try {
      await supabase
          .from('user_profile')
          .update({
            'onboarding_completed': true,
            'onboarding_data': data,
            'onboarding_completed_at': DateTime.now().toIso8601String(),
            'updated_at': DateTime.now().toIso8601String(),
          })
          .eq('account_id', userId);
    } catch (e) {
      print('completeOnboarding: error = $e');
      throw Exception('Failed to complete onboarding: $e');
    }
  }
}
