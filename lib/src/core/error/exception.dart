import 'package:freezed_annotation/freezed_annotation.dart';

part 'exception.freezed.dart';

/// Base exception type for the application
@freezed
abstract class AppException with _$AppException {
  const factory AppException.auth(String? message) = AuthException;
  const factory AppException.network(String? message) = NetworkException;
  const factory AppException.order(String? message) = OrderException;
  const factory AppException.workout(String? message) = WorkoutException;
  const factory AppException.home(String? message) = HomeException;
  const factory AppException.log(String? message) = LogException;
  const factory AppException.onboarding(String? message) = OnboardingException;
  const factory AppException.health(String? message) = HealthException;
  const factory AppException.noData(String? message) = NoDataException;
  const factory AppException.permission(String? message) = PermissionException;
  const factory AppException.database(String? message) = DatabaseException;
  const factory AppException.community(String? message) = CommunityException;
  const factory AppException.program(String? message) = ProgramException;

  const AppException._();

  String? get message => maybeWhen(
    auth: (msg) => msg,
    network: (msg) => msg,
    order: (msg) => msg,
    workout: (msg) => msg,
    home: (msg) => msg,
    log: (msg) => msg,
    onboarding: (msg) => msg,
    health: (msg) => msg,
    noData: (msg) => msg,
    permission: (msg) => msg,
    database: (msg) => msg,
    community: (msg) => msg,
    program: (msg) => msg,
    orElse: () => null,
  );
}
