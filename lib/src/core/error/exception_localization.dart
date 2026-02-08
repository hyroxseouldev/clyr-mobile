import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:clyr_mobile/src/core/error/exception.dart';

extension AppExceptionL10n on AppException {
  String getLocalizedMessage(AppLocalizations l10n) {
    return maybeWhen(
      auth: (msg) => msg ?? l10n.errorDefaultAuth,
      network: (msg) => msg ?? l10n.errorDefaultNetwork,
      order: (msg) => msg ?? l10n.errorDefaultOrder,
      workout: (msg) => msg ?? l10n.errorDefaultWorkout,
      home: (msg) => msg ?? l10n.errorDefaultHome,
      log: (msg) => msg ?? l10n.errorDefaultLog,
      onboarding: (msg) => msg ?? l10n.errorDefaultOnboarding,
      health: (msg) => msg ?? l10n.errorDefaultHealth,
      noData: (msg) => msg ?? l10n.errorNoData,
      permission: (msg) => msg ?? l10n.errorDefaultPermission,
      orElse: () => l10n.errorUnknown,
    );
  }
}
