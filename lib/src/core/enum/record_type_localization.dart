import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:clyr_mobile/src/core/enum/enum.dart';

extension RecordTypeLocalization on RecordType {
  String getLocalizedName(AppLocalizations l10n) {
    switch (this) {
      case RecordType.timeBased:
        return l10n.recordTypeTimeBased;
      case RecordType.weightBased:
        return l10n.recordTypeWeightBased;
      case RecordType.repBased:
        return l10n.recordTypeRepBased;
      case RecordType.distanceBased:
        return l10n.recordTypeDistanceBased;
      case RecordType.survey:
        return l10n.recordTypeSurvey;
      case RecordType.checklist:
        return l10n.recordTypeChecklist;
      case RecordType.photo:
        return l10n.recordTypePhoto;
      case RecordType.other:
        return l10n.recordTypeOther;
    }
  }
}
