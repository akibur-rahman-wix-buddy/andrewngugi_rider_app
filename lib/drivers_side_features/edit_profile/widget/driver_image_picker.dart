

import 'dart:io';

import 'package:andrewngugi_rider_app/assets_helper/app_icons/app_icons.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_image/app_image.dart';
import 'package:andrewngugi_rider_app/networks/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class DriverImagePicker extends StatefulWidget {
  const DriverImagePicker({super.key, required this.driverImage});
  final String driverImage;

  @override
  _DriverImagePickerState createState() => _DriverImagePickerState();
}

class _DriverImagePickerState extends State<DriverImagePicker> {
  File? _selectedImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery, // Use ImageSource.camera for camera
      maxHeight: 180,
      maxWidth: 180,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 55,
          backgroundImage: _selectedImage != null
              ? FileImage(_selectedImage!) as ImageProvider
              : NetworkImage( imageUrl+widget.driverImage,), // Replace with AppImages.profile
        ),
        Positioned(
          bottom: 8,
          right: 8,
          child: GestureDetector(
            onTap: _pickImage,
            child: Container(
              height: 25,
              width: 25,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: SvgPicture.asset(AppIcons.editIcon2), // Replace with AppIcons.editIcon2
              ),
            ),
          ),
        ),
      ],
    );
  }
}
