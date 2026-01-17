import 'package:clyr_mobile/src/core/data/dto.dart';
import 'package:clyr_mobile/src/core/supabase/supabase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

part 'data_source.g.dart';

@Riverpod(keepAlive: true)
CoreDataSource coreDataSource(Ref ref) {
  return SupabaseDataSource(supabase: ref.watch(supabaseClientProvider));
}

abstract interface class CoreDataSource {
  Future<ProgramsDto> getCurrentActiveProgram();
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
              thumbnail_url,
              short_description,
              description,
              is_public,
              is_for_sale,
              price,
              access_period_days,
              difficulty,
              duration_weeks,
              days_per_week,
              created_at,
              updated_at
            )
          ''')
          .eq('user_id', userId)
          .eq('status', 'ACTIVE')
          .maybeSingle();

      print('getCurrentActiveProgram: response = $response');

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
}
