import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_spacing.dart';
import '../domain/camera_permission_status.dart';
import '../domain/scanner_mode.dart';
import 'scanner_provider.dart';
import 'scanner_state.dart';

class ScannerScreen extends ConsumerStatefulWidget {
  const ScannerScreen({super.key});

  @override
  ConsumerState<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends ConsumerState<ScannerScreen> {
  final TextEditingController _codeController = TextEditingController();

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  void _submitManualCode() {
    final route =
        ref.read(scannerProvider.notifier).resolveCode(_codeController.text);
    if (route != null) {
      _codeController.clear();
      context.go(route);
    }
  }

  Future<void> _simulateScan() async {
    final route = await ref.read(scannerProvider.notifier).scan();
    if (route != null && mounted) {
      context.go(route);
    }
  }

  @override
  Widget build(BuildContext context) {
    final scanner = ref.watch(scannerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Scan code')),
      body: scanner.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) =>
            const Center(child: Text('Scanner is unavailable.')),
        data: _buildBody,
      ),
    );
  }

  Widget _buildBody(ScannerState state) {
    final notifier = ref.read(scannerProvider.notifier);
    final isDesk = state.mode == ScannerMode.deskQr;
    final cameraReady = state.permission == CameraPermissionStatus.granted;

    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        SegmentedButton<ScannerMode>(
          showSelectedIcon: false,
          segments: const [
            ButtonSegment(
              value: ScannerMode.deskQr,
              label: Text('Desk QR (check in)'),
            ),
            ButtonSegment(
              value: ScannerMode.bookIsbn,
              label: Text('Book ISBN'),
            ),
          ],
          selected: {state.mode},
          onSelectionChanged: (selection) => notifier.setMode(selection.first),
        ),
        const SizedBox(height: AppSpacing.md),
        _CameraPanel(
          state: state,
          onGrantAccess: notifier.requestPermission,
          onOpenSettings: notifier.openSettings,
          onSimulateScan: _simulateScan,
        ),
        const SizedBox(height: AppSpacing.lg),
        Text(
          cameraReady
              ? 'Or enter the code manually'
              : 'Enter the code manually',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: AppSpacing.sm),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TextField(
                controller: _codeController,
                textInputAction: TextInputAction.done,
                onSubmitted: (_) => _submitManualCode(),
                onChanged: (_) {
                  if (state.errorMessage != null) notifier.clearError();
                },
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: isDesk ? 'e.g. A-101' : 'e.g. 978...',
                  errorText: state.errorMessage,
                ),
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            FilledButton(
              onPressed: _submitManualCode,
              child: Text(isDesk ? 'Check in' : 'Look up'),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Manual entry always works, so you are never blocked.',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
        ),
      ],
    );
  }
}

class _CameraPanel extends StatelessWidget {
  const _CameraPanel({
    required this.state,
    required this.onGrantAccess,
    required this.onOpenSettings,
    required this.onSimulateScan,
  });

  final ScannerState state;
  final VoidCallback onGrantAccess;
  final VoidCallback onOpenSettings;
  final VoidCallback onSimulateScan;

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: switch (state.permission) {
            CameraPermissionStatus.granted => _granted(context),
            CameraPermissionStatus.denied => _denied(context),
            CameraPermissionStatus.permanentlyDenied =>
              _permanentlyDenied(context),
            CameraPermissionStatus.unavailable => _unavailable(context),
          },
        ),
      ),
    );
  }

  List<Widget> _granted(BuildContext context) {
    final isDesk = state.mode == ScannerMode.deskQr;
    return [
      Icon(
        Icons.qr_code_scanner,
        size: AppSpacing.iconLg,
        color: Theme.of(context).colorScheme.primary,
      ),
      const SizedBox(height: AppSpacing.sm),
      Text(
        'Live camera viewfinder (simulated)',
        style: Theme.of(context).textTheme.labelMedium,
      ),
      const SizedBox(height: AppSpacing.xs),
      Text(
        isDesk ? 'Point at the desk QR code' : 'Point at the book barcode',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      const SizedBox(height: AppSpacing.md),
      OutlinedButton(
        onPressed: onSimulateScan,
        child: const Text('Simulate scan'),
      ),
    ];
  }

  List<Widget> _denied(BuildContext context) {
    return [
      ..._message(
        context,
        icon: Icons.no_photography_outlined,
        title: 'Camera access needed',
        body: 'We use the camera to scan desk QR codes and book barcodes.',
      ),
      const SizedBox(height: AppSpacing.md),
      FilledButton(
        onPressed: onGrantAccess,
        child: const Text('Grant Camera Access'),
      ),
    ];
  }

  List<Widget> _permanentlyDenied(BuildContext context) {
    return [
      ..._message(
        context,
        icon: Icons.no_photography_outlined,
        title: 'Camera access needed',
        body: 'Camera permission is turned off. Enable it in the app '
            'settings, or enter the code below.',
      ),
      const SizedBox(height: AppSpacing.md),
      FilledButton(
        onPressed: onOpenSettings,
        child: const Text('Open App Settings'),
      ),
    ];
  }

  List<Widget> _unavailable(BuildContext context) {
    return _message(
      context,
      icon: Icons.videocam_off_outlined,
      title: 'Camera unavailable',
      body: 'We could not start the camera on this device. '
          'Enter the code below instead.',
    );
  }

  List<Widget> _message(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String body,
  }) {
    final colors = Theme.of(context).colorScheme;
    return [
      Icon(icon, size: AppSpacing.iconMd, color: colors.onSurfaceVariant),
      const SizedBox(height: AppSpacing.sm),
      Text(
        title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      const SizedBox(height: AppSpacing.xs),
      Text(
        body,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: colors.onSurfaceVariant),
      ),
    ];
  }
}
