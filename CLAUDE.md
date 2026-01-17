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
├── feature/           # Feature modules (auth, home, workout, etc.)
│   └── [feature_name]/
│       ├── data/      # Data Layer: DTOs, data_source, repository
│       ├── infra/     # Domain Layer: Entity, usecase
│       └── presentation/  # UI Layer: provider, view, widget
│
└── shared/            # Cross-feature shared widgets & utilities
```

### Key Architectural Rules

1. **Absolute Imports Only**: Never use relative imports (`../..`). Always use `package:clyr_mobile/...`

2. **Data Layer** (`feature/*/data/`):
   - **DTO**: Use `@JsonSerializable`, must implement `toEntity()` method
   - **Data Source**: Direct API/DB communication (Dio, Supabase)
   - **Repository**: Abstract interface + implementation, returns `FutureEither<AppException, Entity>`

3. **Infra Layer** (`feature/*/infra/`):
   - **Entity**: Immutable models for UI consumption
   - **UseCase**: Abstract interface with `Named Record` params, integrate multiple usecases into single provider

4. **Presentation Layer** (`feature/*/presentation/`):
   - **Provider**: Use `@riverpod` with `Notifier`/`AsyncNotifier`, single `AsyncValue<T>` state
   - **View**: Files end with `_view.dart`, classes named `*View`
   - **Widget**: Files end with `_widget.dart`, use `factory fromEntity()` for Entity-based widgets

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
