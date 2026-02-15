import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:clyr_mobile/src/core/health/entity/connected_device.dart';
import 'package:clyr_mobile/src/core/health/entity/connected_device_localization.dart';
import 'package:clyr_mobile/src/feature/settings/presentation/provider/device_connect_provider.dart';
import 'package:clyr_mobile/src/shared/widgets/async_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DeviceConnectView extends ConsumerWidget {
  const DeviceConnectView({super.key});

  static const String routeName = 'device_connect';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(deviceConnectControllerProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settingsDeviceConnect)),
      body: AsyncWidget<DeviceConnectState>(
        data: state,
        builder: (data) {
          final selectedDevice = data.selectedDevices.isNotEmpty
              ? data.selectedDevices.first
              : null;

          return ListView(
            children: [
              const SizedBox(height: 8),
              ListTile(
                title: Text(l10n.deviceSelectTitle),
                subtitle: Text(l10n.deviceSelectDescription),
              ),
              ...ConnectedDevice.values.map((device) {
                final isSelected = selectedDevice == device;
                return ListTile(
                  leading: Icon(
                    Icons.watch_outlined,
                    color: isSelected
                        ? Theme.of(context).colorScheme.primary
                        : null,
                  ),
                  title: Text(device.getLocalizedName(l10n)),
                  subtitle: Text(device.sourceId),
                  trailing: isSelected
                      ? Icon(
                          Icons.check,
                          color: Theme.of(context).colorScheme.primary,
                        )
                      : null,
                  onTap: () {
                    ref
                        .read(deviceConnectControllerProvider.notifier)
                        .selectSingleDevice(device);
                  },
                );
              }),
              const Divider(),
              ListTile(
                title: Text(l10n.healthReadPermission),
                subtitle: Text(
                  data.isHealthReadGranted
                      ? l10n.permissionGranted
                      : l10n.permissionDenied,
                ),
                trailing: FilledButton(
                  onPressed: () {
                    ref
                        .read(deviceConnectControllerProvider.notifier)
                        .requestHealthReadPermissions();
                  },
                  child: Text(l10n.requestPermission),
                ),
              ),
              ListTile(
                title: Text(l10n.healthWritePermission),
                subtitle: Text(
                  data.isHealthWriteGranted
                      ? l10n.permissionGranted
                      : l10n.permissionDenied,
                ),
                trailing: FilledButton(
                  onPressed: () {
                    ref
                        .read(deviceConnectControllerProvider.notifier)
                        .requestHealthWorkoutWritePermission();
                  },
                  child: Text(l10n.requestPermission),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: OutlinedButton(
                  onPressed: () {
                    ref
                        .read(deviceConnectControllerProvider.notifier)
                        .openAppSettings();
                  },
                  child: Text(l10n.openSystemSettings),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
