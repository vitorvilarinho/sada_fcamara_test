import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';

class PhotosWidget extends StatelessWidget {
  const PhotosWidget({
    required this.photos,
    required this.onAddPhoto,
    super.key,
  });

  final List<File> photos;
  final Function(File?) onAddPhoto;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        GestureDetector(
          onTap: () async {
            final photo = await Modular.to.pushNamed<File?>(
              '/occurrence/camera',
            );
            onAddPhoto(photo);
          },
          child: Container(
            margin: const EdgeInsets.all(4.0),
            width: 96,
            height: 96,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/illustrations/camera_add.svg',
                package: 'sada_design_system',
              ),
            ),
          ),
        ),
        ...photos.map(
          (photo) => Padding(
            padding: const EdgeInsets.all(4.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.file(
                File(photo.path),
                width: 96,
                height: 96,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
