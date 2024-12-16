import 'package:flutter/material.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera'),
      ),
      body: SingleChildScrollView(
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          shrinkWrap: true,
          padding: const EdgeInsets.all(10),
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.add_a_photo,
                size: 40,
                color: Colors.grey,
              ),
            )
          ],
        ),
      )
    );
  }
}

