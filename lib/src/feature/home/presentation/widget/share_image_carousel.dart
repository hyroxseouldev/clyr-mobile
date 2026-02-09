import 'dart:typed_data';
import 'package:clyr_mobile/src/shared/widgets/checkerboard_pattern.dart';
import 'package:flutter/material.dart';

/// Share image carousel widget
/// Displays 3 shareable images in a horizontal scroll view
class ShareImageCarousel extends StatelessWidget {
  final List<Uint8List> images;
  final String simpleLabel;
  final String detailedLabel;
  final String transparentLabel;
  final int selectedIndex;
  final ValueChanged<int>? onSelectedIndexChanged;

  const ShareImageCarousel({
    super.key,
    required this.images,
    required this.simpleLabel,
    required this.detailedLabel,
    required this.transparentLabel,
    this.selectedIndex = 0,
    this.onSelectedIndexChanged,
  });

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) {
      return const SizedBox(
        height: 400,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: List.generate(
            images.length,
            (index) => _buildImageItem(context, index),
          ),
        ),
      ),
    );
  }

  Widget _buildImageItem(BuildContext context, int index) {
    final isSelected = index == selectedIndex;
    final labels = [simpleLabel, detailedLabel, transparentLabel];

    return GestureDetector(
      onTap: () => onSelectedIndexChanged?.call(index),
      child: Container(
        width: 300,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Colors.transparent,
            width: isSelected ? 3 : 0,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: _buildImageContainer(images[index], index),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              labels[index],
              style: TextStyle(
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageContainer(Uint8List imageBytes, int index) {
    final imageWidget = Image.memory(
      imageBytes,
      fit: BoxFit.contain,
    );

    // Apply checkerboard background only for transparent image (index 2)
    if (index == 2) {
      return CheckerboardPattern(
        squareSize: 15,
        child: imageWidget,
      );
    }

    return imageWidget;
  }
}
