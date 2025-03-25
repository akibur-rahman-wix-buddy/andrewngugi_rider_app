import 'dart:developer';
import 'dart:io';
import 'package:andrewngugi_rider_app/drivers_side_features/controller/AppController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

class EditVehicleImagePicker extends StatefulWidget {
  const EditVehicleImagePicker({super.key, required this.imageList});

  final List<String> imageList;

  @override
  State<EditVehicleImagePicker> createState() => _EditVehicleImagePickerState();
}

class _EditVehicleImagePickerState extends State<EditVehicleImagePicker> {
  AppController controller = Get.put(AppController());
  final List<XFile?> _images = List.filled(3, null); // Holds selected images
  final ImagePicker _picker = ImagePicker(); // For picking images

  Future<void> _pickImage(int index) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      controller.updateListOfImage[index] = _images[index] = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    log(">>>>>>>>>>>>>>>>>>>>>>>>>>>>> image list ${widget.imageList.length.toString()}");
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(3, (index) {
        return GestureDetector(
          onTap: () => _pickImage(index),
          child: Container(
              width: 100.w,
              height: 94.h,
              decoration: BoxDecoration(
                color: Colors.grey[200], // Placeholder background color
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: _images[index] == null ? Colors.grey : Colors.orange,
                  width: 2.0,
                ),
              ),
              child: _images[index] != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.file(
                        File(_images[index]!.path),
                        fit: BoxFit.cover,
                      ),
                    )
                  : ListView.builder(
                key: ValueKey(widget.imageList),
                itemCount: widget.imageList.length,
                itemBuilder: (context, index) {
                  return Image.network(
                    widget.imageList[index],
                    fit: BoxFit.cover,
                  );
                },
              ),

          ),
        );
      }),
    );
  }
}
