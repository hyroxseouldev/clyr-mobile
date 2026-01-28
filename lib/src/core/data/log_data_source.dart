import 'package:clyr_mobile/src/core/data/dto.dart';
import 'package:clyr_mobile/src/core/supabase/supabase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

part 'log_data_source.g.dart';

/// Log Data Source Provider
@Riverpod(keepAlive: true)
LogDataSource logDataSource(Ref ref) {
  final supabase = ref.watch(supabaseClientProvider);
  return SupabaseLogDataSource(supabase: supabase);
}

/// Log Data Source Interface
///
/// Handles log-related data operations.
/// All methods throw Exception on failure (following CoreDataSource pattern).
abstract interface class LogDataSource {
  /// Get today's leaderboard entries
  Future<List<SectionRecordDto>> getTodayLeaderboard({
    required DateTime date,
  });
}

/// Supabase implementation of LogDataSource
class SupabaseLogDataSource implements LogDataSource {
  final sb.SupabaseClient supabase;

  SupabaseLogDataSource({required this.supabase});

  @override
  Future<List<SectionRecordDto>> getTodayLeaderboard({
    required DateTime date,
  }) async {
    final userId = supabase.auth.currentUser?.id;
    if (userId == null) {
      throw Exception('User not authenticated');
    }

    try {
      // Get active enrollment
      final enrollmentResponse = await supabase
          .from('enrollments')
          .select('start_date, program_id')
          .eq('user_id', userId)
          .eq('status', 'ACTIVE')
          .maybeSingle();

      if (enrollmentResponse == null) {
        return [];
      }

      final startDate = DateTime.parse(enrollmentResponse['start_date']);
      final programId = enrollmentResponse['program_id'];

      // Calculate day number (1-indexed)
      final dayNumber = date.difference(startDate).inDays + 1;

      if (dayNumber < 1) {
        return [];
      }

      // Calculate phase number (1-indexed, 7 days per phase)
      final phaseNumber = (dayNumber - 1) ~/ 7 + 1;

      // Query blueprint by program_id, phase_number, day_number
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

      // Get blueprint_section_items with nested sections and records
      final sectionItems = await supabase
          .from('blueprint_section_items')
          .select('''
            id,
            section_id,
            order_index,
            blueprint_sections!section_id (
              id,
              title
            ),
            section_records (
              id,
              user_id,
              user_profile_id,
              section_id,
              section_item_id,
              content,
              completed_at,
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

      // Collect all section records for today
      final List<SectionRecordDto> allRecords = [];

      for (final item in sectionItems) {
        final records = item['section_records'];
        if (records != null && records is List) {
          for (final record in records) {
            allRecords.add(SectionRecordDto.fromJson(record));
          }
        }
      }

      // Sort by completed_at (fastest first)
      allRecords.sort((a, b) => a.completedAt.compareTo(b.completedAt));

      // Assign ranks based on completion order
      final rankedRecords = <SectionRecordDto>[];
      for (int i = 0; i < allRecords.length; i++) {
        rankedRecords.add(allRecords[i]);
      }

      return rankedRecords;
    } catch (e) {
      print('getTodayLeaderboard: error = $e');
      throw Exception('Failed to get today\'s leaderboard: $e');
    }
  }
}
