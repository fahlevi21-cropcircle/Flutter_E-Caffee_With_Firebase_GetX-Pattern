import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_caffee/app/data/models/photos/photo/photo.dart';

class ImageSquareItem extends StatelessWidget {
  const ImageSquareItem({super.key, required this.photo});

  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4.0),
      child: CachedNetworkImage(
        imageUrl: photo.urls!.small!,
        placeholder: (context, url) => Container(
          height: 120,
          child: Center(
            child: CircularProgressIndicator(),
          ),
          decoration: BoxDecoration(color: Colors.black38),
        ),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
