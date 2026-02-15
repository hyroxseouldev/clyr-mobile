import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:clyr_mobile/src/core/health/entity/connected_device.dart';

extension ConnectedDeviceL10n on ConnectedDevice {
  String getLocalizedName(AppLocalizations l10n) => switch (this) {
    ConnectedDevice.garmin => l10n.deviceGarmin,
  };
}
