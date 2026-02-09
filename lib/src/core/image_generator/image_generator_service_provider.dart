import 'package:clyr_mobile/src/core/image_generator/image_generator_service.dart';
import 'package:clyr_mobile/src/core/image_generator/image_generator_service_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_generator_service_provider.g.dart';

/// Image generator service provider
@riverpod
ImageGeneratorService imageGeneratorService(Ref ref) {
  return ImageGeneratorServiceImpl();
}
