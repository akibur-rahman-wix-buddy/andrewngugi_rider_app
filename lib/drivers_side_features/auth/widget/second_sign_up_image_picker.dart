import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';

class SecondSignUpImagePicker extends StatefulWidget {
  const SecondSignUpImagePicker({super.key});

  @override
  State<SecondSignUpImagePicker> createState() =>
      _SecondSignUpImagePickerState();
}

class _SecondSignUpImagePickerState extends State<SecondSignUpImagePicker> {
  final List<XFile?> _images = List.filled(3, null); // Holds selected images
  final ImagePicker _picker = ImagePicker(); // For picking images

  Future<void> _pickImage(int index) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _images[index] = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(3, (index) {
        return GestureDetector(
          onTap: () => _pickImage(index),
          child: DottedBorder(
            color: _images[index] == null ? Colors.grey : Colors.orange,
            dashPattern: const [6, 3],
            borderType: BorderType.RRect,
            radius: const Radius.circular(8.0),
            strokeWidth: 2.0,
            child: SizedBox(
              width: 90.w,
              height: 75.h,
              child: _images[index] != null
                  ? ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.file(
                  File(_images[index]!.path),
                  fit: BoxFit.cover,
                ),
              )
                  : Icon(
                Icons.camera_alt,
                color: _images[index] == null
                    ? Colors.grey
                    : Colors.orange,
              ),
            ),
          ),
        );
      }),
    );
  }
}
