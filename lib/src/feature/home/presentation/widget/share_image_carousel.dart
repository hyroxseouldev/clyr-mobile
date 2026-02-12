import 'dart:typed_data';
import 'package:clyr_mobile/src/core/share/entity/share_image_entity.dart';
import 'package:clyr_mobile/src/shared/widgets/checkerboard_pattern.dart';
import 'package:flutter/material.dart';

/// Share image carousel widget
/// Displays shareable images in a horizontal scroll view
class ShareImageCarousel extends StatelessWidget {
  final List<Uint8List> images;
  final List<ShareImageStyle> styles;
  final int selectedIndex;
  final ValueChanged<int>? onSelectedIndexChanged;

  const ShareImageCarousel({
    super.key,
    required this.images,
    required this.styles,
    this.selectedIndex = 0,
    this.onSelectedIndexChanged,
  });

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.388,
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final maxHeight = MediaQuery.of(context).size.height * 0.388;
        final carouselHeight = maxHeight;

        return SizedBox(
          height: carouselHeight,
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
      },
    );
  }

  Widget _buildImageItem(BuildContext context, int index) {
    final isSelected = index == selectedIndex;
    final style = styles[index];

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
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: _buildImageContainer(images[index], style),
        ),
      ),
    );
  }

  Widget _buildImageContainer(Uint8List imageBytes, ShareImageStyle style) {
    final imageWidget = Image.memory(imageBytes, fit: BoxFit.contain);

    // Apply checkerboard background for transparent style
    if (style == ShareImageStyle.transparent) {
      return CheckerboardPattern(squareSize: 15, child: imageWidget);
    }

    return imageWidget;
  }
}
