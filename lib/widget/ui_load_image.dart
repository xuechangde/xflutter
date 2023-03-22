import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import '../res/images.dart';

class UiLoadImage extends StatelessWidget {
  final bool showPlaceholder;
  final String placeholder;
  final String image;
  final BoxFit fit;

  final double radius;
  final double? width;
  final double? height;

  const UiLoadImage({
    Key? key,
    this.image = '',
    this.placeholder = Images.imgNormal,
    this.fit = BoxFit.cover,
    this.radius = 0,
    this.showPlaceholder = true,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget imageWidget = image.isEmpty
        ? Image.asset(placeholder, fit: fit)
        : CachedNetworkImage(
            fadeOutDuration: const Duration(milliseconds: 1),
            fadeInDuration: const Duration(milliseconds: 1),
            width: width,
            height: height,
            fit: fit,
            placeholder: (ctx, s) {
              return Image.asset(placeholder, fit: fit);
            },
            errorWidget: (ctx, s, d) {
              return Image.asset(Images.imgNormal, fit: fit);
            },
            imageUrl: image??'',
          );
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: imageWidget,
    );
  }
}
