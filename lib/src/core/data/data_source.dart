import 'dart:math' as math;

import 'package:clyr_mobile/src/core/data/dto.dart';
import 'package:clyr_mobile/src/core/data/home_dto.dart';
import 'package:clyr_mobile/src/core/data/log_dto.dart';
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
  Future<ActiveProgramDto?> getCurrentActiveProgram();
  Future<TodaysSessionDto> getTodaysSessionState({
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
  Future<List<SectionRecordWithUserProfileDto>> getMainWorkoutSectionRecords({
    required DateTime date,
    bool isTest = false,
  });

  /// Get leaderboard for main_workout sections with current user's record ID and section content
  Future<LeaderboardDto> getTodayLeaderBoard({
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
  Future<ActiveProgramDto?> getCurrentActiveProgram() async {
    final userId = supabase.auth.currentUser?.id;
    if (userId == null) {
      return null;
    }

    try {
      // Step 1: Get enrollment with program data
      final enrollmentResponse = await supabase
          .from('enrollments')
          .select('''
            programs (
              id,
              coach_id,
              title,
              description,
              main_image_list,
              program_image,
              start_date,
              end_date
            )
          ''')
          .eq('user_id', userId)
          .eq('status', 'ACTIVE')
          .maybeSingle();

      if (enrollmentResponse == null) {
        return null;
      }

      final program = enrollmentResponse['programs'];
      if (program == null) {
        return null;
      }

      final coachId = program['coach_id'] as String;

      // Step 2: Get coach profile separately using account_id
      Map<String, dynamic>? coachProfile;
      if (coachId.isNotEmpty) {
        final coachProfileResponse = await supabase
            .from('coach_profile')
            .select('profile_image_url, nickname')
            .eq('account_id', coachId)
            .maybeSingle();
        coachProfile = coachProfileResponse;
      }

      // Manually assemble ActiveProgramDto
      return ActiveProgramDto(
        id: program['id'] as String,
        coachId: coachId,
        title: program['title'] as String,
        description: program['description'] as String?,
        programImage: program['program_image'] as String?,
        mainImageList: (program['main_image_list'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
        startDate: program['start_date'] != null
            ? DateTime.parse(program['start_date'] as String)
            : null,
        endDate: program['end_date'] != null
            ? DateTime.parse(program['end_date'] as String)
            : null,
        coachProfileUrl: coachProfile?['profile_image_url'] as String?,
        coachName: coachProfile?['nickname'] as String?,
      );
    } catch (e) {
      print('getCurrentActiveProgram: error = $e');
      return null;
    }
  }

  @override
  Future<TodaysSessionDto> getTodaysSessionState({
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
          .select('''
            start_date,
            program_id
          ''')
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

      // 4. Query blueprint by program_id, phase_number, day_number with notes
      final programBlueprint = await supabase
          .from('program_blueprints')
          .select('id, notes')
          .eq('program_id', programId)
          .eq('phase_number', phaseNumber)
          .eq('day_number', dayNumber)
          .maybeSingle();

      if (programBlueprint == null) {
        return TodaysSessionDto(sections: [], notes: '', coachName: '');
      }

      final blueprintId = programBlueprint['id'] as String;
      final notes = programBlueprint['notes'] as String? ?? '';

      // 5. Get blueprint_section_items with nested sections and records, ordered
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
              record_type,
              is_recordable,
              created_at,
              updated_at
            ),
            section_records (
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

      // Convert to flattened DTO with isCompleted check
      final sectionItemsList = sectionItems.map((item) {
        // Check if user has a record in section_records
        bool isCompleted = false;
        final records = item['section_records'];
        if (records != null && records is List) {
          final recordsList = records;
          isCompleted = recordsList.any((record) {
            if (record is Map) {
              return record['user_id'] == userId;
            }
            return false;
          });
        }

        // Create flattenData for manual conversion
        final flattenData = {
          'id': item['id'],
          'blueprint_id': item['blueprint_id'],
          'section_id': item['section_id'],
          'order_index': item['order_index'],
          'created_at': item['created_at'],
          'blueprint_sections': item['blueprint_sections'],
          'section_records': item['section_records'],
          '_is_completed': isCompleted, // Add computed field
        };

        return FlattenBlueprintSectionItemsDto.fromJson(flattenData);
      }).toList();

      return TodaysSessionDto(
        sections: sectionItemsList,
        notes: notes,
        coachName: '', // coachName은 ActiveProgram에서 가져옵니다
      );
    } catch (e) {
      print('getTodaysSessionState: error = $e');
      throw Exception('Failed to get today\'s session: $e');
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
  Future<List<SectionRecordWithUserProfileDto>> getMainWorkoutSectionRecords({
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
      final List<SectionRecordWithUserProfileDto> mainWorkoutRecords = [];

      for (final item in sectionItems) {
        final section = item['blueprint_sections'];
        if (section != null && section['title'] != null) {
          final title = section['title'] as String;
          // Check if title contains "main_workout" (main workout)
          if (title.contains('main_workout')) {
            final records = item['section_records'] as List?;
            if (records != null) {
              for (final record in records) {
                mainWorkoutRecords.add(
                  SectionRecordWithUserProfileDto.fromJson(record),
                );
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
  Future<LeaderboardDto> getTodayLeaderBoard({
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
        return LeaderboardDto(
          sectionRecords: [],
          mySectionRecordId: null,
          sectionItemContent: null,
        );
      }

      final startDate = DateTime.parse(enrollmentResponse['start_date']);
      final programId = enrollmentResponse['program_id'];

      // 2. Calculate day number and phase number
      final dayNumber = isTest ? 1 : date.difference(startDate).inDays + 1;
      if (dayNumber < 1) {
        return LeaderboardDto(
          sectionRecords: [],
          mySectionRecordId: null,
          sectionItemContent: null,
        );
      }

      final phaseNumber = isTest ? 1 : (dayNumber - 1) ~/ 7 + 1;

      // 3. Query blueprint
      final programBlueprint = await supabase
          .from('program_blueprints')
          .select('id')
          .eq('program_id', programId)
          .eq('phase_number', phaseNumber)
          .eq('day_number', dayNumber)
          .maybeSingle();

      if (programBlueprint == null) {
        return LeaderboardDto(
          sectionRecords: [],
          mySectionRecordId: null,
          sectionItemContent: null,
        );
      }

      final blueprintId = programBlueprint['id'] as String;

      // 4. Get blueprint_section_items with nested sections and records
      final sectionItems = await supabase
          .from('blueprint_section_items')
          .select('''
            id,
            blueprint_sections!section_id (
              id,
              title,
              content,
              record_type
            ),
            section_records!section_item_id (
              id,
              user_id,
              section_id,
              section_item_id,
              content,
              completed_at,
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

      // 5. Collect records for main_workout sections and find my record
      final List<SectionRecordWithUserProfileDto> allRecords = [];
      String? myRecordId;
      String? mainWorkoutContent;
      String? recordType;

      for (final item in sectionItems) {
        final section = item['blueprint_sections'];
        if (section != null && section['title'] != null) {
          final title = section['title'] as String;
          if (title.contains('main_workout')) {
            // Capture the section content
            if (section['content'] != null) {
              mainWorkoutContent ??= section['content'] as String;
            }

            recordType ??= section['record_type'] as String;

            final records = item['section_records'] as List?;
            if (records != null) {
              for (final record in records) {
                final flattendData = {
                  'id': record['id'],
                  'user_id': record['user_id'],
                  'user_profile_id': record['user_profile']['id'],
                  'section_id': record['section_id'],
                  'section_item_id': record['section_item_id'],
                  'content': record['content'],
                  'completed_at': record['completed_at'],
                  'coach_comment': record['coach_comment'],
                  'nickname': record['user_profile']['nickname'],
                  'profile_image_url':
                      record['user_profile']['profile_image_url'],
                };
                print('flattendData = $flattendData');
                final recordDto = SectionRecordWithUserProfileDto.fromJson(
                  flattendData,
                );
                allRecords.add(recordDto);

                // Check if this is my record
                if (recordDto.userId == userId && myRecordId == null) {
                  myRecordId = recordDto.id;
                }
              }
            }
          }
        }
      }

      // 6. Sort allRecords by recordType before returning
      allRecords.sort((a, b) {
        // Use captured recordType, default to TIME_BASED if not set
        final recordTypeStr = recordType ?? 'TIME_BASED';

        if (recordTypeStr == 'TIME_BASED') {
          // Sort by content['record'] time string ascending (faster = better rank)
          final aRecord = a.content?['record'];
          final bRecord = b.content?['record'];

          if (aRecord == null || bRecord == null) {
            return 0; // Keep original order if null
          }

          // Parse time string (hh:mm:ss or mm:ss) to seconds
          int parseTimeToSeconds(dynamic timeStr) {
            if (timeStr == null) return 0;
            final parts = timeStr.toString().split(':');
            int seconds = 0;
            for (int i = 0; i < parts.length; i++) {
              final value = int.tryParse(parts[i]) ?? 0;
              // Rightmost part is seconds, then minutes, then hours
              seconds += value * math.pow(60, parts.length - 1 - i).toInt();
            }
            return seconds;
          }

          final aSeconds = parseTimeToSeconds(aRecord);
          final bSeconds = parseTimeToSeconds(bRecord);

          // Ascending: less time = better rank
          return aSeconds.compareTo(bSeconds);
        } else if (recordTypeStr == 'WEIGHT_BASED' ||
            recordTypeStr == 'REP_BASED' ||
            recordTypeStr == 'DISTANCE_BASED') {
          // Sort by content['record'] as number descending (larger = better)
          final aRecord = a.content?['record'];
          final bRecord = b.content?['record'];

          if (aRecord == null || bRecord == null) {
            return 0; // Keep original order if null
          }

          // Parse as double for comparison (handles both double and string)
          final aValue = double.tryParse(aRecord.toString()) ?? 0.0;
          final bValue = double.tryParse(bRecord.toString()) ?? 0.0;

          // Descending: larger value = better rank
          return bValue.compareTo(aValue);
        }

        // Default: sort by completedAt ascending
        return a.completedAt.compareTo(b.completedAt);
      });

      return LeaderboardDto(
        sectionRecords: allRecords,
        mySectionRecordId: myRecordId,
        sectionItemContent: mainWorkoutContent,
      );
    } catch (e) {
      print('getTodayLeaderBoard: error = $e');
      throw Exception('Failed to get today leaderboard: $e');
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
