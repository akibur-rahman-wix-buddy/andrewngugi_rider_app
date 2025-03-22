import 'dart:io';

import 'package:andrewngugi_rider_app/drivers_side_features/controller/AppController.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

class SecondSignUpImagePicker extends StatefulWidget {
  const SecondSignUpImagePicker({super.key});

  @override
  _SecondSignUpImagePickerState createState() =>
      _SecondSignUpImagePickerState();
}

class _SecondSignUpImagePickerState extends State<SecondSignUpImagePicker> {
  final ImagePicker _picker = ImagePicker();
  String? _errorMessage;

  // Pick an image and update the list in AppController
  Future<void> _pickImage(int index) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      // Safely update the list in AppController
      AppController controller = Get.put(AppController());
      controller.listOfImage[index] = image;

      // Log the image path
      print('Selected image path for index $index: ${image.path}');

      // Notify the parent widget about the selected images
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(3, (index) {
            return GestureDetector(
              onTap: () => _pickImage(index),  // Call the pickImage method
              child: Obx(() {
                AppController controller = Get.find<AppController>();
                return DottedBorder(
                  color: controller.listOfImage[index] == null
                      ? Colors.grey
                      : Colors.orange,
                  dashPattern: const [6, 3],
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(8.0),
                  strokeWidth: 2.0,
                  child: SizedBox(
                    width: 90,
                    height: 75,
                    child: controller.listOfImage[index] != null
                        ? ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.file(
                        File(controller.listOfImage[index]!.path),
                        fit: BoxFit.cover,
                      ),
                    )
                        : Icon(
                      Icons.camera_alt,
                      color: controller.listOfImage[index] == null
                          ? Colors.grey
                          : Colors.orange,
                    ),
                  ),
                );
              }),
            );
          }),
        ),
        if (_errorMessage != null)
          Text(
            _errorMessage!,
            style: TextStyle(color: Colors.red, fontSize: 12.sp),
          ),
      ],
    );
  }
}
