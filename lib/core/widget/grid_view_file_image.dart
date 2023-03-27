import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qbidding/core/utils/utilities.dart';

class GridViewFileImageB extends StatelessWidget {
  final int crossAxisCount;
  final List<ImageFile> images;
  final double padding;
  const GridViewFileImageB({
    Key? key,
    this.crossAxisCount = 5,
    this.images = const <ImageFile>[],
    this.padding = 15,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return images.isNotEmpty
        ? GridView.builder(
            padding: EdgeInsets.only(top: padding),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: images.length,
            itemBuilder: (context, index) {
              return ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.file(
                    File(images[index].file.path),
                    fit: BoxFit.cover,
                  ));
            },
          )
        : const SizedBox();
  }
}
