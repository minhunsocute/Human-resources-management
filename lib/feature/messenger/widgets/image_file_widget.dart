import 'package:flutter/material.dart';

class ImageFileWidget extends StatelessWidget {
  const ImageFileWidget({super.key, required this.imageNumber});
  final int imageNumber;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: (imageNumber / 5) * 80),
      child: Center(
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return const Icon(
              Icons.person,
              size: 50,
            );
          },
          itemCount: imageNumber,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5, mainAxisSpacing: 20, crossAxisSpacing: 15),
        ),
      ),
    );
  }
}
