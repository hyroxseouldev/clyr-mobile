import 'dart:math' as math;

import 'package:flutter/material.dart';

class HeartRateChartWidget extends StatelessWidget {
  const HeartRateChartWidget({
    super.key,
    required this.heartRates,
    required this.titleText,
    required this.avgHeartRateText,
    required this.maxHeartRateText,
    required this.bpmText,
    required this.emptyText,
    required this.duration,
    required this.totalDistance,
    required this.distanceUnitText,
    required this.minuteUnitText,
    this.averageHeartRate,
    this.maxHeartRate,
  });

  final List<int> heartRates;
  final int? averageHeartRate;
  final int? maxHeartRate;
  final String titleText;
  final String avgHeartRateText;
  final String maxHeartRateText;
  final String bpmText;
  final String emptyText;
  final Duration duration;
  final double totalDistance;
  final String distanceUnitText;
  final String minuteUnitText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveAvg =
        averageHeartRate ?? _calculateAverageHeartRate(heartRates);
    final effectiveMax = maxHeartRate ?? _calculateMaxHeartRate(heartRates);
    final hasData = heartRates.isNotEmpty;

    final minChartValue = _calculateMinChartValue(heartRates);
    final maxChartValue = _calculateMaxChartValue(heartRates, minChartValue);
    final yLabels = _buildYAxisLabels(minChartValue, maxChartValue);
    final xLabels = _buildXAxisLabels(
      totalDistance: totalDistance,
      duration: duration,
      distanceUnitText: distanceUnitText,
      minuteUnitText: minuteUnitText,
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                titleText,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.info_outline,
                size: 22,
                color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 300,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: yLabels
                        .map(
                          (label) => Text(
                            '$label',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurface.withValues(
                                alpha: 0.7,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainerHighest
                          .withValues(alpha: 0.32),
                      border: Border.all(
                        color: theme.colorScheme.outline.withValues(
                          alpha: 0.38,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          CustomPaint(
                            painter: _HeartRateAreaPainter(
                              heartRates: heartRates,
                              minValue: minChartValue,
                              maxValue: maxChartValue,
                              gridColor: theme.colorScheme.outline.withValues(
                                alpha: 0.18,
                              ),
                              areaColor: const Color(0xFFEF4444),
                            ),
                          ),
                          if (!hasData)
                            Center(
                              child: Text(
                                emptyText,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.colorScheme.onSurface.withValues(
                                    alpha: 0.65,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                bpmText,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
              const Spacer(),
              ...xLabels.map(
                (label) => Expanded(
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(
                        alpha: 0.76,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 48),
            child: Text(
              totalDistance >= 1000 ? distanceUnitText : minuteUnitText,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.62),
              ),
            ),
          ),
          const SizedBox(height: 28),
          _MetricRow(
            title: avgHeartRateText,
            value: _toBpm(effectiveAvg, bpmText),
          ),
          const SizedBox(height: 20),
          _MetricRow(
            title: maxHeartRateText,
            value: _toBpm(effectiveMax, bpmText),
          ),
        ],
      ),
    );
  }

  int? _calculateAverageHeartRate(List<int> values) {
    if (values.isEmpty) return null;
    return values.reduce((a, b) => a + b) ~/ values.length;
  }

  int? _calculateMaxHeartRate(List<int> values) {
    if (values.isEmpty) return null;
    return values.reduce(math.max);
  }

  int _calculateMinChartValue(List<int> values) {
    if (values.isEmpty) return 80;
    final minRate = values.reduce(math.min);
    final paddedMin = math.max(60, minRate - 8);
    return (paddedMin ~/ 10) * 10;
  }

  int _calculateMaxChartValue(List<int> values, int minValue) {
    if (values.isEmpty) return 160;
    final maxRate = values.reduce(math.max);
    final paddedMax = maxRate + 8;
    final roundedMax = ((paddedMax + 9) ~/ 10) * 10;
    if (roundedMax <= minValue) {
      return minValue + 20;
    }
    return roundedMax;
  }

  List<int> _buildYAxisLabels(int minValue, int maxValue) {
    const divisions = 4;
    final step = (maxValue - minValue) / divisions;
    return List<int>.generate(
      divisions + 1,
      (index) => (maxValue - (step * index)).round(),
    );
  }

  List<String> _buildXAxisLabels({
    required double totalDistance,
    required Duration duration,
    required String distanceUnitText,
    required String minuteUnitText,
  }) {
    const points = [0.25, 0.5, 0.75, 1.0];

    if (totalDistance >= 1000) {
      final totalKm = totalDistance / 1000;
      return points.map((point) {
        final value = totalKm * point;
        final label = value < 10
            ? value.toStringAsFixed(1)
            : value.round().toString();
        return '$label $distanceUnitText';
      }).toList();
    }

    final totalMinutes = math.max(1, duration.inMinutes);
    return points.map((point) {
      final value = (totalMinutes * point).round();
      return '$value $minuteUnitText';
    }).toList();
  }

  String _toBpm(int? value, String bpmLabel) {
    if (value == null || value == 0) {
      return '-';
    }
    return '$value $bpmLabel';
  }
}

class _MetricRow extends StatelessWidget {
  const _MetricRow({required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: theme.textTheme.titleLarge?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.82),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Text(
          value,
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}

class _HeartRateAreaPainter extends CustomPainter {
  _HeartRateAreaPainter({
    required this.heartRates,
    required this.minValue,
    required this.maxValue,
    required this.gridColor,
    required this.areaColor,
  });

  final List<int> heartRates;
  final int minValue;
  final int maxValue;
  final Color gridColor;
  final Color areaColor;

  @override
  void paint(Canvas canvas, Size size) {
    _drawGrid(canvas, size);
    if (heartRates.isEmpty) return;
    _drawArea(canvas, size);
  }

  void _drawGrid(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = gridColor
      ..strokeWidth = 1;

    const horizontalLines = 4;
    for (var i = 0; i <= horizontalLines; i++) {
      final y = size.height * (i / horizontalLines);
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }

    const verticalLines = 4;
    for (var i = 0; i <= verticalLines; i++) {
      final x = size.width * (i / verticalLines);
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
  }

  void _drawArea(Canvas canvas, Size size) {
    final chartRange = (maxValue - minValue).toDouble();
    if (chartRange <= 0) return;

    final points = <Offset>[];

    for (var i = 0; i < heartRates.length; i++) {
      final x = heartRates.length == 1
          ? 0.0
          : size.width * (i / (heartRates.length - 1));

      final clampedRate = heartRates[i].clamp(minValue, maxValue).toDouble();
      final normalizedY = (clampedRate - minValue) / chartRange;
      final y = size.height - (normalizedY * size.height);

      points.add(Offset(x, y));
    }

    if (points.isEmpty) return;

    final linePath = _createSmoothPath(points);
    final areaPath = Path.from(linePath)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    areaPath
      ..lineTo(size.width, size.height)
      ..close();

    final fillPaint = Paint()
      ..style = PaintingStyle.fill
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          areaColor.withValues(alpha: 0.84),
          areaColor.withValues(alpha: 0.36),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final linePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.2
      ..color = areaColor.withValues(alpha: 0.95);

    canvas.drawPath(areaPath, fillPaint);
    canvas.drawPath(linePath, linePaint);
  }

  Path _createSmoothPath(List<Offset> points) {
    final path = Path();
    path.moveTo(points.first.dx, points.first.dy);

    if (points.length == 1) {
      return path;
    }

    for (var i = 0; i < points.length - 1; i++) {
      final current = points[i];
      final next = points[i + 1];
      final control = Offset((current.dx + next.dx) / 2, current.dy);
      final end = Offset((current.dx + next.dx) / 2, next.dy);
      path.quadraticBezierTo(control.dx, control.dy, end.dx, end.dy);
      path.quadraticBezierTo(end.dx, end.dy, next.dx, next.dy);
    }

    return path;
  }

  @override
  bool shouldRepaint(covariant _HeartRateAreaPainter oldDelegate) {
    return oldDelegate.heartRates != heartRates ||
        oldDelegate.minValue != minValue ||
        oldDelegate.maxValue != maxValue ||
        oldDelegate.gridColor != gridColor ||
        oldDelegate.areaColor != areaColor;
  }
}
