import 'package:flutter/material.dart';

/// Share action buttons widget
/// Provides download and SNS share buttons
class ShareActionButtons extends StatelessWidget {
  final VoidCallback onDownload;
  final VoidCallback onShareKakao;
  final VoidCallback onShareInstagram;
  final String downloadText;
  final String shareToKakaoText;
  final String shareToInstagramText;
  final bool isDownloading;
  final bool isSharing;

  const ShareActionButtons({
    super.key,
    required this.onDownload,
    required this.onShareKakao,
    required this.onShareInstagram,
    required this.downloadText,
    required this.shareToKakaoText,
    required this.shareToInstagramText,
    this.isDownloading = false,
    this.isSharing = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Download button (primary action)
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: isDownloading ? null : onDownload,
              icon: isDownloading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Icon(Icons.download),
              label: Text(isDownloading ? '저장 중...' : downloadText),
            ),
          ),
          const SizedBox(height: 12),

          // SNS share buttons (horizontal row)
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: isSharing ? null : onShareKakao,
                  icon: const Icon(Icons.chat),
                  label: Text(shareToKakaoText),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: isSharing ? null : onShareInstagram,
                  icon: const Icon(Icons.camera_alt),
                  label: Text(shareToInstagramText),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
