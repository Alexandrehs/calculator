import 'package:flutter/material.dart';

class VisorWidget extends StatelessWidget {
  final String value;
  final String result;

  const VisorWidget({
    required this.value,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: double.infinity,
      color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  value,
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  result,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
