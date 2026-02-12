# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Flutter Environment

This project uses **FVM (Flutter Version Management)**. The required Flutter version is `3.38.0`.

```bash
# Install Flutter version via FVM (if not already installed)
fvm install 3.38.0

# Use FVM for all Flutter commands
fvm flutter <command>

# Example: Run the app
fvm flutter run --flavor dev
```

## Build & Development Commands

### Build for Different Flavors

This project uses `flutter_flavorizr` for multi-environment builds (dev, stage, prod).

```bash
# Generate flavor configurations (run after modifying flavorizr.yaml)
fvm flutter pub run flutter_flavorizr

# Build Android
fvm flutter build apk --flavor dev
fvm flutter build apk --flavor prod
fvm flutter build appbundle --flavor prod

# Build iOS
fvm flutter build ios --flavor dev
fvm flutter build ios --flavor prod

# Run with specific flavor
fvm flutter run --flavor dev
fvm flutter run --flavor prod
```

### Entry Points

- **Dev**: `lib/main_dev.dart`
- **Stage**: `lib/main_stage.dart`
- **Prod**: `lib/main_prod.dart`

### Code Generation

This project uses code generation for several packages. Run after modifying models, providers, or DTOs.

```bash
# Run all code generators
fvm dart run build_runner build --delete-conflicting-outputs

# Watch for changes during development
fvm dart run build_runner watch --delete-conflicting-outputs
```

Generated files include:
- Riverpod providers (`@riverpod` annotation)
- JSON serialization (`@JsonSerializable` annotation)
- Freezed models (`@freezed` annotation)
- Retrofit API clients
- Envied environment variables

### Linting

```bash
# Run Flutter analyze
fvm flutter analyze

# Run custom_lint (includes riverpod_lint)
fvm dart run custom_lint
```

## Project Architecture

### Clean Architecture: 3-Layer Structure

```
lib/src/
├── core/              # Shared utilities, configs, base classes
│   ├── config/        # Environment configuration (Envied)
│   ├── error/         # AppException sealed class hierarchy
│   ├── health/        # Health service (HealthKit integration)
│   ├── pagination/    # Pagination utilities & widgets
│   ├── permission/    # Permission service (platform permissions)
│   ├── router/        # GoRouter configuration
│   ├── storage/       # Supabase storage service
│   ├── supabase/      # Supabase client provider
│   ├── theme/         # Theme configuration & widgets
│   ├── typedef/       # FutureEither typedef
│   └── usecase/       # Base usecase interface
│
├── feature/           # Feature modules (auth, home, log, etc.)
│   └── [feature_name]/
│       ├── data/      # Data Layer: Repository implementations
│       │   └── repository/       # Repository interface + impl with debug logs
│       ├── infra/     # Domain Layer: Entity, usecase
│       │   ├── entity/           # Freezed entities
│       │   └── usecase/          # Use case interfaces + providers
│       └── presentation/  # UI Layer: provider, view, widget
│           ├── provider/         # Riverpod controllers
│           ├── view/             # UI views (*_view.dart)
│           └── widget/           # Reusable widgets (*_widget.dart)
│
└── shared/            # Cross-feature shared widgets & utilities
```

### Key Architectural Rules

1. **Absolute Imports Only**: Never use relative imports (`../..`). Always use `package:clyr_mobile/...`

2. **Centralized Data Layer** (`core/data/`):
   - **DTO**: All DTOs from Drizzle schema in `dto.dart` with `@JsonSerializable`
   - **Data Source**: `CoreDataSource` interface for Supabase queries
   - **AuthDataSource**: Separate interface for auth-related operations
   - **Purpose**: Single source of truth for all data models, shared across features

3. **Supabase Instance**: Always use `core/supabase/supabase_provider.dart`'s `supabaseClientProvider`
   ```dart
   // ✅ Correct: Use core's supabaseClientProvider
   import 'package:clyr_mobile/src/core/supabase/supabase_provider.dart';

   @Riverpod(keepAlive: true)
   MyDataSource myDataSource(Ref ref) {
     final client = ref.watch(supabaseClientProvider);
     return MyDataSourceImpl(client);
   }

   // ❌ Wrong: Creating separate Supabase instance
   @Riverpod(keepAlive: true)
   SupabaseClient supabaseClient(Ref ref) {
     return Supabase.instance.client;  // Don't duplicate
   }
   ```

4. **Repository Injection**: Inject DataSource from outside, never pass `Ref` to Repository
   ```dart
   // ✅ Correct: Inject DataSource directly
   class MyRepositoryImpl implements MyRepository {
     final MyDataSource _dataSource;
     MyRepositoryImpl(this._dataSource);
   }

   // Provider injects dependency
   @Riverpod(keepAlive: true)
   MyRepository myRepository(Ref ref) {
     final dataSource = ref.watch(myDataSourceProvider);
     return MyRepositoryImpl(dataSource);
   }

   // ❌ Wrong: Repository receives Ref and reads providers internally
   class MyRepositoryImpl implements MyRepository {
     final Ref _ref;
     MyRepositoryImpl(this._ref);

     MyDataSource get _dataSource => _ref.read(myDataSourceProvider);
   }
   ```

### DTO JSON Serialization Rule

**Always use `@JsonSerializable` generated factories for all DTOs.**

```dart
// ✅ Correct: Use generated factory
@JsonSerializable()
class MyDto {
  final String id;
  final String name;

  MyDto({required this.id, required this.name});

  factory MyDto.fromJson(Map<String, dynamic> json) =>
      _$MyDtoFromJson(json);
  Map<String, dynamic> toJson() => _$MyDtoToJson(this);
}

// ❌ Wrong: Custom fromJson implementation
@JsonSerializable()
class MyDto {
  final String id;
  final String name;

  MyDto({required this.id, required this.name});

  factory MyDto.fromJson(Map<String, dynamic> json) {
    return MyDto(
      id: json['id'] as String,
      name: json['name'] as String,
    );
  }
  Map<String, dynamic> toJson() => _$MyDtoToJson(this);
}
```

**Why?**
- **Consistency**: All DTOs follow the same pattern
- **Maintainability**: Single source of truth for serialization logic
- **Type Safety**: Generated code handles null safety and type conversions
- **Nested Objects**: `@JsonSerializable` automatically handles nested DTO serialization
- **JSONB Fields**: Use `@JsonKey` annotations for Supabase jsonb columns

**For Supabase jsonb arrays/objects, use `@JsonKey` annotations:**
```dart
@JsonSerializable()
class UserProfileDto {
  final String id;
  @JsonKey(name: 'fitness_goals')
  final List<String>? fitnessGoals;  // JSONB array
  @JsonKey(name: 'onboarding_data')
  final Map<String, dynamic>? onboardingData;  // JSONB object

  UserProfileDto({
    required this.id,
    this.fitnessGoals,
    this.onboardingData,
  });

  factory UserProfileDto.fromJson(Map<String, dynamic> json) =>
      _$UserProfileDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UserProfileDtoToJson(this);
}
```

### Enum Localization Rule

**Always use separate `*_localization.dart` extension for enum localization.**

#### File Structure
```
lib/src/core/enum/
├── enum.dart                          # Enum + basic extensions (JSON, fromString)
├── record_type_localization.dart      # RecordType localization
├── blueprint_card_title_localization.dart  # BlueprintCardTitleEnum localization
└── ...

lib/src/feature/*/infra/entity/
├── *_entity.dart                      # Enum + basic extensions
├── *_entity_localization.dart         # Enum localization
└── ...
```

#### Pattern
1. **`enum.dart` or `*_entity.dart`**: Define enum + basic extensions (value, fromString)
2. **`*_localization.dart`**: Define `getLocalizedName(AppLocalizations)` extension
3. **Widgets**: Receive localized strings as parameters from View layer

#### Example
```dart
// enum.dart - Basic extensions only
extension RecordTypeX on RecordType {
  String get value => switch (this) {
    RecordType.timeBased => 'TIME_BASED',
    // ...
  };
}

// record_type_localization.dart - Localization only
extension RecordTypeL10n on RecordType {
  String getLocalizedName(AppLocalizations l10n) => switch (this) {
    RecordType.timeBased => l10n.recordTypeTimeBased,
    // ...
  };
}

// View - Handle localization
final displayTitle = titleEnum?.getLocalizedName(l10n) ?? item.title;
MyWidget(title: displayTitle);  // Pass localized string
```

#### Naming Convention
- Basic extension: `{EnumName}X`
- Localization extension: `{EnumName}L10n` or `{EnumName}Localization`

3. **Infra Layer** (`feature/*/infra/`):
   - **Entity**: Freezed immutable models for UI consumption
   - **Repository**: Uses `core/data` data sources, returns `FutureEither<AppException, Entity>`
   - **UseCase**: Abstract interface with `Named Record` params

4. **Presentation Layer** (`feature/*/presentation/`):
   - **Provider**: Use `@riverpod` with `Notifier`/`AsyncNotifier`, single `AsyncValue<T>` state
   - **View**: Files end with `_view.dart`, classes named `*View`
   - **Widget**: Files end with `_widget.dart`, receive Entity as parameter

5. **State Management**: Riverpod v3+ with code generation
   - Prefer `Notifier`/`AsyncNotifier` over `StateProvider`
   - Use `AsyncValue.guard()` for error capture
   - Handle side-effects (navigation, snackbar) in View's `ref.listen()`

6. **Error Handling**:
   - Data Layer: Map external errors (e.g., Supabase `AuthException`) to `AppException`
   - Repository Layer: Use `debugPrint()` for error logging in development
   - Presentation Layer: Display errors via `error.getLocalizedMessage(l10n)` extension

### File Naming Conventions

- **Views**: `feature_name_view.dart` (e.g., `login_view.dart`)
- **Widgets**: `widget_name_widget.dart`
- **Providers**: `feature_name_provider.dart` or `feature_name_controller.dart`
- **All lowercase with underscores** (snake_case)

### Core Dependencies

- **State**: `hooks_riverpod`, `flutter_hooks`
- **Backend**: `supabase_flutter`
- **Routing**: `go_router`
- **Networking**: `dio`, `retrofit`
- **Forms**: `flutter_form_builder`, `form_builder_validators`
- **Async**: `fpdart` (Either monad)
- **Storage**: `flutter_secure_storage`

### Environment Variables

Environment variables are managed using `envied` package:
- Define in `.env.{flavor}` files (e.g., `.env.dev`)
- Generate with: `fvm dart run build_runner build`
- Access via: `Env.{variableName}`

---

## Service Layer

Services provide a clean abstraction layer over external APIs and SDKs (HealthKit, Permissions, Storage, etc.).

### Service Layer Architecture

```
┌─────────────────────────────────────────────────────────────────────────┐
│                              REPOSITORY                                 │
│                   Uses Services through interfaces                        │
└───────────────────────────────┬─────────────────────────────────────────┘
                                │
                                ▼
┌─────────────────────────────────────────────────────────────────────────┐
│                            SERVICE LAYER                                 │
│  ┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐    │
│  │  HealthService  │    │ PermissionService│    │ StorageService  │    │
│  │  (HealthKit)     │    │  (Platform)      │    │  (Supabase)     │    │
│  └─────────────────┘    └─────────────────┘    └─────────────────┘    │
│           │                      │                      │              │
└───────────│──────────────────────│──────────────────────│──────────────┘
            │                      │                      │
            ▼                      ▼                      ▼
┌─────────────────────────────────────────────────────────────────────────┐
│                        EXTERNAL APIS/SDKs                                │
│  ┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐    │
│  │    HealthKit    │    │  Permission     │    │   Supabase      │    │
│  │    (iOS/Android)│    │  (OS APIs)      │    │   (Backend)      │    │
│  └─────────────────┘    └─────────────────┘    └─────────────────┘    │
└─────────────────────────────────────────────────────────────────────────┘
```

### Service Structure

**Location**: `lib/src/core/`

**Pattern**: Interface + Implementation + Provider

```
lib/src/core/
├── health/
│   ├── health_service.dart              # Abstract interface
│   ├── health_service_impl.dart         # Concrete implementation
│   ├── health_service_provider.dart     # Riverpod provider
│   └── entity/                           # Service-specific entities
│       └── health_workout_data.dart
├── permission/
│   ├── permission_service.dart           # Abstract interface
│   ├── permission_service_impl.dart      # Concrete implementation
│   ├── permission_service_provider.dart  # Riverpod provider
│   └── entity/                           # Service-specific entities
│       ├── permission_result.dart
│       └── permission_type.dart
└── storage/
    └── storage_service.dart             # Implementation (no interface needed)
```

### Service Implementation Rules

1. **Interface-Implementation Separation**
   - Define abstract interface in `{service}_service.dart`
   - Implement in `{service}_service_impl.dart`
   - Provide via Riverpod in `{service}_service_provider.dart`

2. **Return Type**
   - Always use `FutureEither<AppException, T>` for async operations
   - Map platform-specific errors to `AppException`

3. **Error Handling**
   - Catch platform exceptions (e.g., HealthKit errors)
   - Convert to appropriate `AppException` type
   - Include descriptive error messages

4. **Debug Logging**
   - Use `debugPrint()` for development logging
   - Log service operations: entry, success, errors

### Service Example: HealthService

**Interface** (`health_service.dart`):
```dart
import 'package:clyr_mobile/src/core/error/exception.dart';
import 'package:clyr_mobile/src/core/health/entity/health_workout_data.dart';
import 'package:clyr_mobile/src/core/util/type_defs.dart';

abstract class HealthService {
  /// Fetch workout data within date range
  FutureEither<List<HealthWorkoutData>> getWorkouts({
    required DateTime startDate,
    required DateTime endDate,
    int? limit,
  });

  /// Get latest workout within date range
  FutureEither<HealthWorkoutData?> getLatestWorkout({
    required DateTime startDate,
    required DateTime endDate,
  });
}
```

**Implementation** (`health_service_impl.dart`):
```dart
import 'package:flutter/foundation.dart';
import 'package:clyr_mobile/src/core/error/exception.dart';
import 'package:clyr_mobile/src/core/health/health_service.dart';
import 'package:health/health.dart';

class HealthServiceImpl implements HealthService {
  HealthServiceImpl({Health? healthFactory})
    : _health = healthFactory ?? Health();

  final Health _health;

  @override
  FutureEither<List<HealthWorkoutData>> getWorkouts({
    required DateTime startDate,
    required DateTime endDate,
    int? limit,
  }) async {
    debugPrint('💪 [HealthService] Fetching workouts: $startDate to $endDate');

    try {
      final healthData = await _health.getHealthDataFromTypes(
        startTime: startDate,
        endTime: endDate,
        types: [HealthDataType.WORKOUT],
      );

      if (healthData.isEmpty) {
        debugPrint('📭 [HealthService] No workouts found');
        return left(AppException.noData('No workouts found in date range'));
      }

      final workouts = healthData
          .map((data) => _convertToWorkoutData(data))
          .where((workout) => workout != null)
          .cast<HealthWorkoutData>()
          .toList();

      debugPrint('✅ [HealthService] Fetched ${workouts.length} workouts');
      return right(workouts);
    } catch (e) {
      debugPrint('❌ [HealthService] Error: $e');
      return left(AppException.health('Failed to fetch workouts: ${e.toString()}'));
    }
  }
}
```

**Provider** (`health_service_provider.dart`):
```dart
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:clyr_mobile/src/core/health/health_service.dart';
import 'package:clyr_mobile/src/core/health/health_service_impl.dart';

@Riverpod(keepAlive: true)
HealthService healthService(Ref ref) {
  return HealthServiceImpl();
}
```

### Usage in Repository

```dart
class HomeRepositoryImpl implements HomeRepository {
  final CoreDataSource _dataSource;
  final HealthService _healthService;

  HomeRepositoryImpl({
    required CoreDataSource dataSource,
    required HealthService healthService,
  })  : _dataSource = dataSource,
        _healthService = healthService;

  @override
  FutureEither<List<HealthWorkoutData>> getWorkoutsByDate(DateTime date) async {
    debugPrint('🏠 [HomeRepository] Fetching workouts for: $date');

    final result = await _healthService.getWorkouts(
      startDate: DateTime(date.year, date.month, date.day),
      endDate: DateTime(date.year, date.month, date.day, 23, 59, 59),
    );

    return result.fold(
      (error) {
        debugPrint('❌ [HomeRepository] HealthService error: ${error.message}');
        return left(error);
      },
      (workouts) {
        debugPrint('✅ [HomeRepository] Got ${workouts.length} workouts');
        return right(workouts);
      },
    );
  }
}
```

### Service Debug Log Guidelines

- **HealthService**: `💪` (health/fitness)
- **PermissionService**: `🔐` (security/permission)
- **StorageService**: `💾` (storage/file)
- **Log Format**: `💪 [ServiceName] Action description`
- **Success**: `✅ [ServiceName] Success message`
- **Error**: `❌ [ServiceName] Error: ${error}`
- **Empty**: `📭 [ServiceName] No data found`

### Available Services

| Service | Purpose | External Dependency |
|---------|---------|---------------------|
| **HealthService** | HealthKit integration | `health` package |
| **PermissionService** | Platform permissions | `permission_handler` |
| **StorageService** | Supabase Storage | `supabase_flutter` |
| **AuthDataSource** | Supabase Auth | `supabase_flutter` |
| **CoreDataSource** | Supabase Database | `supabase_flutter` |

See `document/flutter_rule.md` for comprehensive development guidelines in Korean.

---

## Clean Architecture Implementation: Home Feature

This section documents the Clean Architecture pattern implementation for the Home feature, serving as a reference for all feature development.

### Architecture Pattern

```
┌─────────────────────────────────────────────────────────────────────────┐
│                           PRESENTATION LAYER                            │
│  ┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐    │
│  │      View       │◄───┤    Provider     │◄───┤    Widget      │    │
│  │   (home_view)   │    │  (*_provider)   │    │  (*_widget)     │    │
│  └─────────────────┘    └─────────────────┘    └─────────────────┘    │
│           │                      │                      │              │
│           │                      ▼                      │              │
│           │            ┌─────────────────┐              │              │
│           │            │     UseCase     │              │              │
│           │            │  (*_usecase)    │              │              │
│           │            └─────────────────┘              │              │
└───────────│──────────────────┼──────────────────────────│──────────────┘
            │                  │                          │
            ▼                  ▼                          ▼
┌─────────────────────────────────────────────────────────────────────────┐
│                           DOMAIN LAYER (infra)                          │
│  ┌─────────────────┐    ┌─────────────────┐                              │
│  │     Entity      │◄───┤    UseCase      │                              │
│  │  (*_entity)     │    │  (*_usecase)    │                              │
│  └─────────────────┘    └─────────────────┘                              │
│           │                                                      │
└───────────│──────────────────────────────────────────────────────────┘
            │
            ▼
┌─────────────────────────────────────────────────────────────────────────┐
│                            DATA LAYER                                   │
│  ┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐    │
│  │   Repository    │◄───┤  Data Source    │◄───┤    Services     │    │
│  │ (*_repository)  │    │ (data_source)   │    │ (health/perm)   │    │
│  │  (with logs)    │    │                 │    │                 │    │
│  └─────────────────┘    └─────────────────┘    └─────────────────┘    │
└─────────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────────┐
│                            CORE LAYER                                   │
│  ┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐    │
│  │     DTO         │    │  Supabase       │    │   HealthKit     │    │
│  │  (dto.dart)     │    │                 │    │   Permissions   │    │
│  └─────────────────┘    └─────────────────┘    └─────────────────┘    │
└─────────────────────────────────────────────────────────────────────────┘
```

### Data Flow Examples

#### Flow 1: Active Program Display

```dart
// 1. DATA LAYER: CoreDataSource (lib/src/core/data/data_source.dart)
Future<ActiveProgramDto> getCurrentActiveProgram() async {
  final response = await supabase.from('enrollments').select('*').eq('is_active', true).single();
  return ActiveProgramDto.fromJson(response);
}

// 2. DATA LAYER: HomeRepository (lib/src/feature/home/data/repository/home_repository.dart)
FutureEither<AppException, ActiveProgramEntity> getActiveProgram() async {
  debugPrint('🏠 [HomeRepository] Fetching active program...');

  try {
    final dataSource = ref.read(coreDataSourceProvider);
    final dto = await dataSource.getCurrentActiveProgram();

    if (dto == null) {
      debugPrint('📭 [HomeRepository] No active program found');
      return right(const ActiveProgramEntity.empty());
    }

    debugPrint('✅ [HomeRepository] Active program fetched: ${dto.title}');
    return right(ActiveProgramEntity.fromDto(dto));
  } catch (e) {
    debugPrint('❌ [HomeRepository] Error fetching active program: $e');
    return left(AppException.home(e.toString()));
  }
}

// 3. DOMAIN LAYER: GetActiveProgramUseCase (get_active_program_usecase.dart)
class GetActiveProgramUseCase implements Usecase<void, ActiveProgramEntity?> {
  final HomeRepository _repository;
  GetActiveProgramUseCase(this._repository);

  @override
  FutureEither<AppException, ActiveProgramEntity?> call(void input) {
    return _repository.getActiveProgram();
  }
}

// 4. PRESENTATION LAYER: Provider (home_controller.dart)
@riverpod
class HomeController extends _$HomeController {
  @override
  FutureOr<ActiveProgramEntity?> build() async {
    final usecase = ref.watch(getActiveProgramUseCaseProvider);
    final result = await usecase(null);
    return result.fold(
      (l) => throw l,
      (r) => r,
    );
  }
}

// 5. PRESENTATION LAYER: View (home_view.dart)
final activeProgramState = ref.watch(homeControllerProvider);
AsyncWidget<ActiveProgramEntity?>(
  data: activeProgramState,
  builder: (activeProgram) => ProgramSelector(programList: [activeProgram!]),
)
```

#### Flow 2: Blueprint Sections by Date

```dart
// 1. DATA LAYER: CoreDataSource (lib/src/core/data/data_source.dart)
Future<List<BlueprintSectionItemsDto>> getBlueprintSectionItemsByDate({
  required DateTime date,
}) async {
  try {
    // Get enrollment and calculate dayNumber, phaseNumber
    final enrollmentData = await supabase.from('enrollments').select().single();

    final startDate = DateTime.parse(enrollmentData['start_date']);
    final dayNumber = date.difference(startDate).inDays + 1;
    final phaseNumber = (dayNumber - 1) ~/ 7 + 1;

    // Query blueprint with nested sections
    final response = await supabase
        .from('program_blueprints')
        .select('''
          id,
          blueprint_section_items (
            id,
            section_id,
            order_index,
            blueprint_sections (
              id,
              title,
              content
            )
          )
        ''')
        .eq('program_id', enrollmentData['program_id'])
        .eq('phase_number', phaseNumber)
        .eq('day_number', dayNumber)
        .single();

    return (response['blueprint_section_items'] as List)
        .map((e) => BlueprintSectionItemsDto.fromJson(e))
        .toList();
  } catch (e) {
    print('getBlueprintSectionItemsByDate: error = $e');
    throw Exception('Failed to get blueprint sections: $e');
  }
}

// 2. DATA LAYER: HomeRepository (lib/src/feature/home/data/repository/home_repository.dart)
FutureEither<AppException, List<BlueprintSectionEntity>> getBlueprintSections({
  required DateTime date,
}) async {
  debugPrint('📅 [HomeRepository] Fetching blueprint sections for: $date');

  try {
    final dataSource = ref.read(coreDataSourceProvider);
    final dtos = await dataSource.getBlueprintSectionItemsByDate(date: date);
    final entities = dtos.map((dto) => BlueprintSectionEntity.fromDto(dto)).toList();

    debugPrint('✅ [HomeRepository] Fetched ${entities.length} sections');
    return right(entities);
  } catch (e) {
    debugPrint('❌ [HomeRepository] Error fetching sections: $e');
    return left(AppException.home(e.toString()));
  }
}

// 3. DOMAIN LAYER: BlueprintSectionEntity (lib/src/feature/home/infra/entity/home_entity.dart)
@freezed
class BlueprintSectionEntity with _$BlueprintSectionEntity {
  const factory BlueprintSectionEntity({
    required String id,
    required String title,
    required String content,
    required int orderIndex,
  }) = _BlueprintSectionEntity;

  factory BlueprintSectionEntity.fromDto(BlueprintSectionItemsDto dto) {
    final section = dto.blueprintSection;
    return BlueprintSectionEntity(
      id: dto.id,
      title: section?.title ?? '',
      content: section?.content ?? '',
      orderIndex: dto.orderIndex,
    );
  }
}

// 4. DOMAIN LAYER: GetBlueprintSectionsUseCase (get_blueprint_sections_usecase.dart)
class GetBlueprintSectionsUseCase
    implements Usecase<GetBlueprintSectionsParams, List<BlueprintSectionEntity>> {
  final HomeRepository _repository;

  GetBlueprintSectionsUseCase(this._repository);

  @override
  FutureEither<AppException, List<BlueprintSectionEntity>> call(
    GetBlueprintSectionsParams input,
  ) {
    return _repository.getBlueprintSections(date: input.date);
  }
}

class GetBlueprintSectionsParams {
  final DateTime date;
  const GetBlueprintSectionsParams({required this.date});
}

// 5. PRESENTATION LAYER: Provider (blueprint_section_provider.dart)
@riverpod
Future<List<BlueprintSectionEntity>> blueprintSections(
  Ref ref,
  DateTime date,
) async {
  final usecase = ref.watch(getBlueprintSectionsUseCaseProvider);
  final params = GetBlueprintSectionsParams(date: date);

  final result = await usecase(params);
  return result.fold(
    (l) => throw l,
    (r) => r,
  );
}

// 6. PRESENTATION LAYER: Widget (blueprint_section_card.dart)
import 'package:clyr_mobile/src/core/router/router_path.dart';

class BlueprintSectionCard extends StatelessWidget {
  final BlueprintSectionEntity item;
  final int index;
  final bool isCompleted;
  final bool showingCompleteButton;
  final String completedText;
  final String completeWorkoutText;

  const BlueprintSectionCard({
    super.key,
    required this.item,
    required this.index,
    this.isCompleted = false,
    this.showingCompleteButton = false,
    this.completedText = '완료됨',
    this.completeWorkoutText = '운동 완료',
  });

  void _onCompletePressed(BuildContext context) {
    context.goNamed(
      RoutePaths.homeSessionRecordCreate,
      pathParameters: {'sectionId': item.sectionId, 'sectionItemId': item.id},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ExpansionTile(
        leading: CircleAvatar(child: Text('$index')),
        title: Text(item.title),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Html(data: item.content),
          ),
          if (showingCompleteButton)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: isCompleted ? null : () => _onCompletePressed(context),
                  child: Text(isCompleted ? completedText : completeWorkoutText),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// 7. PRESENTATION LAYER: View (home_view.dart)
final l10n = AppLocalizations.of(context)!;

AsyncWidget<List<BlueprintSectionEntity>>(
  data: ref.watch(blueprintSectionsProvider(selectedDate)),
  builder: (sections) {
    if (sections.isEmpty) {
      return _buildEmptySections(context);
    }
    return Column(
      children: sections.asMap().entries.map((entry) {
        return BlueprintSectionCard(
          item: entry.value,
          index: entry.key + 1,
          isCompleted: entry.value.isCompleted,
          showingCompleteButton: entry.value.title == "main_workout",
          completedText: l10n.completed,
          completeWorkoutText: l10n.completeWorkout,
        );
      }).toList(),
    );
  },
)
```

### Layer Responsibilities

| Layer | Location | Responsibility | Input | Output | Error Handling | Debug Logs |
|-------|----------|---------------|-------|--------|----------------|-------------|
| **Data Source** | `core/data/` | API/DB communication, raw queries | Primitives | DTO | throws Exception | No |
| **Repository** | `feature/*/data/repository/` | DTO → Entity mapping, uses data sources | Primitives | `FutureEither<AppException, Entity>` | Maps to AppException | **Yes (dev mode)** |
| **UseCase** | `feature/*/infra/usecase/` | Business logic orchestration | Params Record | `FutureEither<AppException, Entity>` | Forwards from Repository | No |
| **Provider** | `feature/*/presentation/provider/` | State management, caching | Primitives | `AsyncValue<Entity>` | Throws on left | No |
| **View** | `feature/*/presentation/view/` | UI rendering | `AsyncValue<Entity>` | Widget | AsyncWidget handles | No |
| **Widget** | `feature/*/presentation/widget/` | Reusable UI components | Entity | Widget | N/A | N/A |

### Implementation Rules

1. **Data Flow Direction**: Always unidirectional: DataSource → Repository → UseCase → Provider → View
2. **DTO to Entity**: Use `factory Entity.fromDto(DTO dto)` in Entity classes
3. **Error Handling**: Use `fpdart` Either pattern - `FutureEither<AppException, T>`
4. **State Management**: Use Riverpod v3+ with code generation (`@riverpod`)
5. **Async UI**: Use `AsyncWidget<T>` wrapper for `AsyncValue<T>` handling
6. **Localization**: Always use `l10n` strings, never hardcode UI text
7. **Widget Localization**: Widgets MUST NOT import `AppLocalizations`. Pass localized strings as parameters from View layer
8. **Nested DTOs**: Use custom `fromJson` with `@JsonKey(includeFromJson: false, includeToJson: false)`
9. **Freezed Entities**: Use `@freezed` for immutable Entity classes
10. **Routing Navigation**: Always use `context.goNamed()` with `RoutePaths` constants, never hardcode routes
11. **Supabase Client**: Always use `supabaseClientProvider` from `core/supabase/supabase_provider.dart`
12. **Dependency Injection**: Inject dependencies into Repository from Provider, never pass `Ref` to Repository

### Routing Best Practices

**DO** - Use named navigation with RoutePaths constants:
```dart
// ✅ Correct: Type-safe navigation with constants
import 'package:clyr_mobile/src/core/router/router_path.dart';

context.goNamed(
  RoutePaths.homeSessionRecordCreate,
  pathParameters: {'sId': item.id},
);
```

**DON'T** - Never hardcode route paths:
```dart
// ❌ Wrong: Hardcoded route string
context.go('/home/workout-log-create/${item.id}');

// ❌ Wrong: Hardcoded path string
context.goNamed('/home/session-record-create/${item.id}');
```

**Why?**
- **Type Safety**: Compiler catches typos and missing parameters
- **Refactoring**: Route changes update automatically
- **Consistency**: Single source of truth for route paths
- **IDE Support**: Auto-completion and jump-to-definition

### Presentation Layer Best Practices

#### 1. Navigation - Use View's routeName

**DO** - Use View's static `routeName` constant for navigation:
```dart
// ✅ Correct: Use View's routeName constant
import 'package:clyr_mobile/src/feature/community/presentation/view/community_create_view.dart';
import 'package:clyr_mobile/src/feature/community/presentation/view/community_detail_view.dart';

context.goNamed(CommunityCreateView.routeName);
context.goNamed(
  CommunityDetailView.routeName,
  pathParameters: {'id': communityId},
);
```

**DON'T** - Don't use RoutePaths constants for navigation:
```dart
// ❌ Wrong: Using RoutePaths constants
import 'package:clyr_mobile/src/core/router/router_path.dart';

context.goNamed(RoutePaths.communityCreate);
context.goNamed(
  RoutePaths.communityDetail,
  pathParameters: {'id': communityId},
);
```

**Why?**
- **Single Source**: View's `routeName` is the canonical route identifier
- **Consistency**: Router configuration links paths to route names
- **Discoverability**: Importing the View gives immediate access to its routeName
- **Maintainability**: Route changes only require updating the View file

#### 2. Empty State - Use Shared EmptyState Widget

**DO** - Use `EmptyState` widget from `shared/widgets`:
```dart
// ✅ Correct: Use shared EmptyState widget
import 'package:clyr_mobile/src/shared/widgets/empty_state.dart';

if (communities.isEmpty) {
  return EmptyState(
    text: l10n.emptyCommunity,
    icon: const Icon(Icons.groups_outlined),
  );
}
```

**DON'T** - Don't create custom `_buildEmptyState` methods:
```dart
// ❌ Wrong: Custom empty state method
Widget _buildEmptyState(BuildContext context, AppLocalizations l10n) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.groups_outlined, size: 64),
        const SizedBox(height: 16),
        Text(l10n.emptyCommunity),
      ],
    ),
  );
}
```

**Why?**
- **Reusability**: Consistent empty state UI across the app
- **Maintainability**: Single file to update empty state styling
- **Less Boilerplate**: No need to write custom empty state code
- **Consistency**: All empty states look and behave the same

#### 3. Controller Management - Use flutter_hooks

**DO** - Use flutter_hooks for controllers and state:
```dart
// ✅ Correct: Use flutter_hooks
import 'package:flutter_hooks/flutter_hooks.dart';

class _MyForm extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final titleController = useTextEditingController();
    final selectedDate = useState<DateTime?>(null);
    final maxParticipants = useState<int>(30);

    // No dispose needed - hooks handle it automatically
    return Form(
      key: formKey,
      child: TextFormField(
        controller: titleController,
        // ...
      ),
    );
  }
}
```

**DON'T** - Don't manually manage controllers with dispose:
```dart
// ❌ Wrong: Manual controller management
class _MyForm extends ConsumerStatefulWidget {
  final _titleController = TextEditingController();
  DateTime? _selectedDate;
  int _maxParticipants = 30;

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        controller: _titleController,
        // Need setState for state updates
        onChanged: (value) {
          setState(() {
            _maxParticipants = int.parse(value);
          });
        },
      ),
    );
  }
}
```

**Why?**
- **Automatic Cleanup**: Hooks automatically dispose controllers when widget unmounts
- **Less Boilerplate**: No need to write dispose methods
- **State Management**: `useState` provides reactive state without setState
- **Type Safety**: Hooks provide typed state management
- **Reusability**: Custom hooks can be extracted and reused

**Common Hooks:**
- `useTextEditingController(text: '')` - Text editing controller with auto-disposal
- `useState(initialValue)` - Reactive state variable
- `useMemoized(() => create(), keys)` - Memoized values with dependencies
- `useEffect(fn, keys)` - Side effects with dependencies

### Widget Localization Best Practices

**DO** - Pass localized strings as parameters from View layer:
```dart
// ✅ Correct: Widget receives strings as parameters
// Widget (coach_profile_card_widget.dart)
class CoachProfileCard extends StatelessWidget {
  final String profileUrl;
  final String coachName;
  final String programName;
  final String subtitleText;  // Localized string passed as parameter

  const CoachProfileCard({
    required this.profileUrl,
    required this.coachName,
    required this.programName,
    this.subtitleText = '',  // Optional with default
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(subtitleText),  // Use parameter directly
        // ...
      ],
    );
  }
}

// View (home_view.dart)
final l10n = AppLocalizations.of(context)!;

CoachProfileCard(
  profileUrl: coachProfileUrl,
  coachName: coachName,
  programName: title,
  subtitleText: l10n.trainingWithCoach(coachName),  // View handles localization
),
```

**DON'T** - Never import AppLocalizations in widgets:
```dart
// ❌ Wrong: Widget directly imports AppLocalizations
import 'package:clyr_mobile/l10n/app_localizations.dart';

class CoachProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Text(l10n.trainingWithCoach(coachName));  // ❌ Widget handles localization
  }
}
```

**Why?**
- **Separation of Concerns**: Widgets focus on UI rendering, Views handle localization
- **Testability**: Widgets can be tested with mock strings without l10n context
- **Reusability**: Widgets can be used in contexts without AppLocalizations
- **Flexibility**: Easy to customize text for specific use cases
- **Type Safety**: Compile-time checking of string parameters

**Parameter Guidelines:**
- Use descriptive names: `completedText`, `emptyStateText`, `buttonText`
- Provide sensible Korean defaults for backward compatibility
- Optional parameters with defaults reduce boilerplate
- All localized strings should be passed from View layer

### File Organization

```
lib/src/feature/home/
├── data/
│   └── repository/
│       ├── home_repository.dart          # Repository interface + impl (with debug logs)
│       └── home_repository_provider.dart
├── infra/
│   ├── entity/
│   │   └── home_entity.dart              # ActiveProgramEntity, BlueprintSectionEntity (Freezed)
│   └── usecase/
│       ├── get_active_program_usecase.dart
│       ├── get_blueprint_sections_usecase.dart
│       └── home_usecase_provider.dart
└── presentation/
    ├── provider/
    │   ├── home_controller.dart          # ActiveProgram provider
    │   └── blueprint_section_provider.dart
    ├── view/
    │   └── home_view.dart
    └── widget/
        ├── program_selector.dart
        └── blueprint_section_card.dart

# Note: DTOs are centralized in lib/src/core/data/dto.dart
# Note: Data sources are in lib/src/core/data/data_source.dart
```

### Repository Debug Logs

**Repositories MUST include debug logs in development mode.**

Use `debugPrint()` for development logging:

```dart
import 'package:flutter/foundation.dart';

class HomeRepositoryImpl implements HomeRepository {
  @override
  FutureEither<ActiveProgramEntity> getActiveProgram() async {
    debugPrint('🏠 [HomeRepository] Fetching active program...');

    try {
      final dto = await _dataSource.getCurrentActiveProgram();

      if (dto == null) {
        debugPrint('📭 [HomeRepository] No active program found');
        return right(const ActiveProgramEntity.empty());
      }

      debugPrint('✅ [HomeRepository] Active program fetched: ${dto.title}');
      return right(ActiveProgramEntity.fromDto(dto));
    } catch (e) {
      debugPrint('❌ [HomeRepository] Error fetching active program: $e');
      return left(AppException.home(e.toString()));
    }
  }
}
```

**Debug Log Guidelines:**
- Use emoji prefixes for quick scanning: `🏠` (home), `✅` (success), `❌` (error), `📭` (empty), `🔍` (searching), `⏳` (loading)
- Include repository name in brackets: `[HomeRepository]`
- Log method entry: `'🏠 [HomeRepository] Fetching active program...'`
- Log success with key data: `'✅ [HomeRepository] Fetched ${items.length} items'`
- Log errors: `'❌ [HomeRepository] Error: $e'`
- Log empty states: `'📭 [HomeRepository] No data found'`

---

## Shared Widgets

This section lists reusable widgets in `lib/src/shared/widgets/` that can be used across the app.

### Available Widgets

| Widget | Description | Purpose |
|---------|-------------|---------|
| **EmptyState** | Empty state with icon + text | Display when no data is available |
| **AsyncWidget** | AsyncValue loading/data/error handling | Wrap async state with consistent UI |
| **Loader** | Circular progress indicator | Display loading state |
| **AsyncButton** | Button with loading state | Button that shows loading spinner |
| **WorkoutShareButton** | Share button for workout data | Show workout share bottom sheet |
| **CircleIconButton** | Circular icon button | Customizable round icon button |
| **HealthDetailWidget** | Workout summary card | Display workout details in 2-column grid |
| **NotFoundWidget** | Not found state with icon | Display when data is not found |

### Best Practices

1. **Localization**: Pass localized strings as parameters from View layer
2. **Reuseability**: Widgets should work independently in any context
3. **Consistency**: Follow shared widget patterns for consistency
