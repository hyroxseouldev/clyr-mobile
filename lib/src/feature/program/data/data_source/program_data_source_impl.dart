import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:clyr_mobile/src/feature/program/data/dto/program_dto.dart';
import 'package:clyr_mobile/src/feature/program/data/data_source/program_data_source.dart';

/// Supabase implementation of ProgramDataSource
class ProgramDataSourceImpl implements ProgramDataSource {
  final SupabaseClient _supabase;

  ProgramDataSourceImpl(this._supabase);

  @override
  Future<List<ProgramWithCoachDto>> getPrograms({
    int? limit,
    int? offset,
  }) async {
    dynamic query = _supabase
        .from('programs')
        .select('''
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
          start_date,
          end_date,
          curriculum,
          created_at,
          updated_at,
          account (
            id,
            coach_profile (
              id,
              profile_image_url,
              nickname
            )
          )
        ''')
        .eq('is_public', true);

    query = query.order('created_at', ascending: false);
    if (limit != null) query = query.limit(limit);
    if (offset != null) query = query.range(offset, offset + limit! - 1);

    final response = await query;

    // Cast response to List<Map<String, dynamic>>
    final List<Map<String, dynamic>> jsonList = List<Map<String, dynamic>>.from(
      response,
    );

    return jsonList.map((json) => ProgramWithCoachDto.fromJson(json)).toList();
  }

  @override
  Future<ProgramWithCoachDto> getProgramById(String id) async {
    final response = await _supabase
        .from('programs')
        .select('''
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
          start_date,
          end_date,
          curriculum,
          created_at,
          updated_at,
          account (
            id,
            coach_profile (
              id,
              profile_image_url,
              nickname
            )
          )
        ''')
        .eq('id', id)
        .single();

    return ProgramWithCoachDto.fromJson(response);
  }
}
