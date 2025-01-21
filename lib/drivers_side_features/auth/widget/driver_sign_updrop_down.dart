import 'package:andrewngugi_rider_app/assets_helper/app_font/app_font.dart';
import 'package:flutter/material.dart';


class DropdownButtonController {
  String? value;

  DropdownButtonController({this.value});
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({
    super.key,
    required this.title,
    required this.list,
    required this.controller,
  });

  final List<String> list; // Expect a list of items for the dropdown
  final String title; // Title to display above the dropdown
  final DropdownButtonController
  controller; // Controller to manage the selected value

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title, // Display the title
          style: TextFontStyle.textStyle14PoppinsW500,
        ),
        const SizedBox(height: 8.0), // Vertical spacing
        Container(
          height: 60.0, // Adjust height as needed
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
              color: Colors.black12,
              width: 2,
            ),
          ),
          child: DropdownButton<String>(
            value: widget.controller.value,
            hint: const Text("Select an option"),
            icon: const Icon(Icons.arrow_drop_down), // Dropdown arrow icon
            isExpanded: true, // Dropdown fills available space
            underline: const SizedBox(), // Removes the underline
            items: widget.list.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                widget.controller.value =
                    newValue; // Update the controller value
              });
            },
          ),
        ),
      ],
    );
  }
}