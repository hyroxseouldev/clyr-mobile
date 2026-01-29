import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:clyr_mobile/src/feature/settings/infra/entity/enrollment_entity.dart';

extension EnrollmentStatusL10n on EnrollmentStatus {
  String getLocalizedName(AppLocalizations l10n) {
    switch (this) {
      case EnrollmentStatus.active:
        return l10n.enrollmentStatusActive;
      case EnrollmentStatus.inactive:
        return l10n.enrollmentStatusInactive;
      case EnrollmentStatus.cancelled:
        return l10n.enrollmentStatusCancelled;
      case EnrollmentStatus.expired:
        return l10n.enrollmentStatusExpired;
    }
  }
}
