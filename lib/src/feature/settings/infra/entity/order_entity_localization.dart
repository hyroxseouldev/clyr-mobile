import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:clyr_mobile/src/feature/settings/infra/entity/order_entity.dart';

extension OrderStatusL10n on OrderStatus {
  String getLocalizedName(AppLocalizations l10n) {
    switch (this) {
      case OrderStatus.pending:
        return l10n.orderStatusPending;
      case OrderStatus.completed:
        return l10n.orderStatusCompleted;
      case OrderStatus.cancelled:
        return l10n.orderStatusCancelled;
    }
  }
}
