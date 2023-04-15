
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

class ImageItem extends StatelessWidget {
  String ImageURL;


  ImageItem(this.ImageURL);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl:
      '${ImageURL}',
      imageBuilder: (context, imageProvider) =>
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(14),
            ),
          ),
      placeholder: (context, url) => Center(
          child: CircularProgressIndicator(
            color: Colors.blue,
          )),
      errorWidget: (context, url, error) => Center(
          child:
          Image.asset('assets/person.png')),
    );
  }
}
