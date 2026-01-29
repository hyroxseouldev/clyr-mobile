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
│   ├── exception/     # AppException sealed class hierarchy
│   ├── pagination/    # Pagination utilities & widgets
│   ├── router/        # GoRouter configuration
│   ├── storage/       # Supabase storage service
│   ├── supabase/      # Supabase client provider
│   ├── theme/         # Theme configuration & widgets
│   ├── typedef/       # FutureEither typedef
│   └── usecase/       # Base usecase interface
│
├── feature/           # Feature modules (auth, home, log, etc.)
│   └── [feature_name]/
│       ├── infra/     # Domain Layer: Entity, repository, usecase
│       │   ├── entity/           # Freezed entities
│       │   ├── repository/       # Repository interface + impl (uses core/data)
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
   - Presentation Layer: Display errors via `AppExceptionX.displayMessage` extension

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
│           │                      │                                        │
└───────────│──────────────────────│──────────────────────────────────────┘
            │                      │
            ▼                      ▼
┌─────────────────────────────────────────────────────────────────────────┐
│                            DATA LAYER                                   │
│  ┌─────────────────┐    ┌─────────────────┐                              │
│  │     DTO         │    │  Data Source    │                              │
│  │  (dto.dart)     │    │ (data_source)   │                              │
│  └─────────────────┘    └─────────────────┘                              │
│           ▲                        ▲                                     │
│           │                        │                                     │
└───────────│────────────────────────│────────────────────────────────────┘
            │                        │
            ▼                        ▼
┌─────────────────────────────────────────────────────────────────────────┐
│                        INFRA LAYER (feature)                           │
│  ┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐    │
│  │     Entity      │◄───┤   Repository    │◄───┤    UseCase      │    │
│  │  (*_entity)     │    │ (*_repository)  │    │  (*_usecase)    │    │
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

// 2. INFRA LAYER: HomeRepository (lib/src/feature/home/infra/repository/home_repository.dart)
FutureEither<AppException, ActiveProgramEntity> getActiveProgram() async {
  try {
    final dataSource = ref.read(coreDataSourceProvider);
    final dto = await dataSource.getCurrentActiveProgram();
    return right(ActiveProgramEntity.fromDto(dto));
  } catch (e) {
    return left(HomeException(code: 'ACTIVE_PROGRAM_FETCH_FAILED', message: e.toString()));
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

// 2. INFRA LAYER: HomeRepository (lib/src/feature/home/infra/repository/home_repository.dart)
FutureEither<AppException, List<BlueprintSectionEntity>> getBlueprintSections({
  required DateTime date,
}) async {
  try {
    final dataSource = ref.read(coreDataSourceProvider);
    final dtos = await dataSource.getBlueprintSectionItemsByDate(date: date);
    final entities = dtos.map((dto) => BlueprintSectionEntity.fromDto(dto)).toList();
    return right(entities);
  } catch (e) {
    return left(
      HomeException(
        code: 'BLUEPRINT_SECTIONS_FETCH_FAILED',
        message: e.toString(),
      ),
    );
  }
}

// 3. INFRA LAYER: BlueprintSectionEntity (lib/src/feature/home/infra/entity/home_entity.dart)
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

| Layer | Location | Responsibility | Input | Output | Error Handling |
|-------|----------|---------------|-------|--------|----------------|
| **Data Source** | `core/data/` | API/DB communication, raw queries | Primitives | DTO | throws Exception |
| **Repository** | `feature/*/infra/repository/` | DTO → Entity mapping, uses data sources | Primitives | `FutureEither<AppException, Entity>` | Maps to AppException |
| **UseCase** | `feature/*/infra/usecase/` | Business logic orchestration | Params Record | `FutureEither<AppException, Entity>` | Forwards from Repository |
| **Provider** | `feature/*/presentation/provider/` | State management, caching | Primitives | `AsyncValue<Entity>` | Throws on left |
| **View** | `feature/*/presentation/view/` | UI rendering | `AsyncValue<Entity>` | Widget | AsyncWidget handles |
| **Widget** | `feature/*/presentation/widget/` | Reusable UI components | Entity | Widget | N/A |

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
├── infra/
│   ├── entity/
│   │   └── home_entity.dart              # ActiveProgramEntity, BlueprintSectionEntity (Freezed)
│   ├── repository/
│   │   ├── home_repository.dart          # Repository interface + impl
│   │   └── home_repository_provider.dart
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
