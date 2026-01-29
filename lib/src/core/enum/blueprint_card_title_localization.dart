import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:clyr_mobile/src/core/enum/enum.dart';

extension BlueprintCardTitleEnumL10n on BlueprintCardTitleEnum {
  String getLocalizedName(AppLocalizations l10n) {
    switch (this) {
      case BlueprintCardTitleEnum.coolDown:
        return l10n.blueprintTitleCoolDown;
      case BlueprintCardTitleEnum.warmUp:
        return l10n.blueprintTitleWarmUp;
      case BlueprintCardTitleEnum.mainWorkout:
        return l10n.blueprintTitleMainWorkout;
      case BlueprintCardTitleEnum.aerobics:
        return l10n.blueprintTitleAerobics;
      case BlueprintCardTitleEnum.accessory:
        return l10n.blueprintTitleAccessory;
    }
  }
}
