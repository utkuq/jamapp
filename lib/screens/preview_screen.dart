import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class PreviewScreen extends StatelessWidget {
  const PreviewScreen({super.key, required this.picture});

  final XFile picture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Önizleme')),
      body: Center(
        child: Column(
          children: [
            Image.file(
              File(picture.path),
              fit: BoxFit.cover,
              width: 250,
            ),
            const SizedBox(height: 24),
            //Text(picture.name),
            const Text(
              "Bu görsel kullanılsın mı?",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context, null);
                    },
                    icon: const Icon(
                      Icons.cancel,
                      size: 50,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context, picture);
                    },
                    icon: const Icon(
                      Icons.done_sharp,
                      size: 50,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
