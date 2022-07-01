import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class NetworkImageWidget extends StatelessWidget {
  final double height;
  final double width;
  final String imageUrl;

  const NetworkImageWidget(
      {Key? key, required this.height, required this.width, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      width: width,
      height: height,
      imageUrl: imageUrl,
      placeholder: (context, url) => const Center(
        child: SizedBox(
          width: 40.0,
          height: 40.0,
          child: CircularProgressIndicator(),
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      cacheManager: CacheManager(Config(
        "fluttercampus",
        stalePeriod: const Duration(days: 7),
        //one week cache period
      )),
    );
  }
}
