import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageUtils {
  static Future pickImage(
      BuildContext context, Function(File) onImageSelected) async {
    try {
      return showModalBottomSheet(
        context: context,
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Camera'),
              onTap: () async {
                Navigator.of(context).pop();
                final image =
                    await ImagePicker().pickImage(source: ImageSource.camera);
                if (image == null) return;
                final imageTemporary = File(image.path);

                onImageSelected(imageTemporary);
              },
            ),
            ListTile(
              leading: Icon(Icons.image),
              title: Text('Gallery'),
              onTap: () async {
                Navigator.of(context).pop();
                final image =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                if (image == null) return;
                final imageTemporary = File(image.path);

                onImageSelected(imageTemporary);
              },
            ),
            if (Platform.isWindows) // Menambahkan opsi untuk Windows
              ListTile(
                leading: Icon(Icons.desktop_windows),
                title: Text('Windows Option'),
                onTap: () {
                  Navigator.of(context).pop();
                  // Tambahkan logika pemilihan gambar untuk Windows di sini
                  // Contoh: onWindowsImageSelected();
                },
              ),
          ],
        ),
      );
    } on PlatformException catch (e) {
      print("failed to pick image: $e");
    }
  }
}
