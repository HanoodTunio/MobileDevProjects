// lib/controllers/image_picker_controller.dart
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class ImagePickerController extends GetxController {
  RxString imagePath = ''.obs;

  Future<void> getImage() async {
    // Use FilePicker to pick an image file
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (result != null && result.files.single.path != null) {
      imagePath.value = result.files.single.path!;
    }
  }
}
