import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class DocumentFileWidget extends StatelessWidget {
  const DocumentFileWidget({
    super.key,
    required this.filename,
    required this.size,
  });
  final String filename;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 100,
        // maxWidth: (15 * (filename.length + size.toString().length) + 80)
        //     .toDouble()
      ),
      child: Column(
        children: [
          Flexible(
            flex: 3,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'images/document.png',
                    fit: BoxFit.cover,
                    height: 50,
                    width: 50,
                  ),
                  Text(
                    filename,
                    style: const TextStyle(
                      fontSize: 12.5,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "$size KB",
                    style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: LinearPercentIndicator(
              padding: EdgeInsets.zero,
              backgroundColor: Colors.blue[100]!,
              percent: 0.7,
              lineHeight: 50,
              progressColor: Colors.blue[200]!,
              center: Text(
                "Downloading ...",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[700],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
