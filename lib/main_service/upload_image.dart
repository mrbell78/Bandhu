import 'dart:io';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import 'package:provider/provider.dart';


class ContentImageUpload extends StatefulWidget {
  const ContentImageUpload({Key? key}) : super(key: key);

  @override
  State<ContentImageUpload> createState() => _ContentImageUploadState();
}

class _ContentImageUploadState extends State<ContentImageUpload> {

  File? image;
  @override
  Widget build(BuildContext context) {
    //RegisterController controller = RegisterController.to;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height/2-50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image == null
                ? const Text('No image selected')
                : Image.file(
              image!,
              fit: BoxFit.cover,
              height: 160,
              width: 160,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final ImagePicker _picker = ImagePicker();
                final XFile? ximage =
                await _picker.pickImage(source: ImageSource.gallery);
                if (ximage != null) {
                  setState(() {
                    image = File(ximage.path);
                  });
                }
              },
              child: const Text('Select image'),
            ),
            const SizedBox(height: 16),
            // ElevatedButton(
            //   onPressed: () {
            //     // Get.defaultDialog(
            //     //   title: 'Uploading Image',
            //     //   content: const Center(
            //     //     child: CircularProgressIndicator(),
            //     //   ),
            //     // );
            //
            //
            //
            //     provider.uploadImage(context);
            //     // RegisterController.to.updateImage();
            //   },
            //   child: const Text('Update Image'),
            // ),
          ],
        ),
      ),
    );
  }
}