// import 'package:flutter/material.dart';
//
// class DropdownButtonController<T> {
//   T? value;
//
//   DropdownButtonController({this.value});
// }
//
// class DropdownButtonExample<T> extends StatefulWidget {
//   const DropdownButtonExample({
//     super.key,
//     required this.title,
//     required this.list,
//     required this.controller,
//   });
//
//   final List<T> list; // Expect a list of items for the dropdown
//   final String title; // Title to display above the dropdown
//   final DropdownButtonController<T> controller; // Controller to manage the selected value
//
//   @override
//   State<DropdownButtonExample> createState() => _DropdownButtonExampleState<T>();
// }
//
// class _DropdownButtonExampleState<T> extends State<DropdownButtonExample<T>> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           widget.title, // Display the title
//           style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500), // Using a simple style for now
//         ),
//         const SizedBox(height: 8.0), // Vertical spacing
//         Container(
//           height: 60.0, // Adjust height as needed
//           padding: const EdgeInsets.all(8.0),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(16.0),
//             border: Border.all(
//               color: Colors.black12,
//               width: 2,
//             ),
//           ),
//           child: DropdownButton<T>(
//             value: widget.controller.value,
//             hint: const Text("Select an option"),
//             icon: const Icon(Icons.arrow_drop_down), // Dropdown arrow icon
//             isExpanded: true, // Dropdown fills available space
//             underline: const SizedBox(), // Removes the underline
//             items: widget.list.map((T item) {
//               return DropdownMenuItem<T>(
//                 value: item,
//                 child: Text(item.toString()), // Use toString() to display the item
//               );
//             }).toList(),
//             onChanged: (T? newValue) {
//               setState(() {
//                 widget.controller.value = newValue; // Update the controller value
//               });
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }


import 'package:flutter/material.dart';

class DropdownButtonController<T> {
  T? value;

  DropdownButtonController({this.value});
}

class DropdownButtonExample<T> extends StatefulWidget {
  const DropdownButtonExample({
    super.key,
    required this.title,
    required this.list,
    required this.controller,
    this.hint,
    this.onChanged, // Add onChanged callback
  });

  final List<T> list; // Expect a list of items for the dropdown
  final String title; // Title to display above the dropdown
  final DropdownButtonController<T> controller; // Controller to manage the selected value
  final ValueChanged<T?>? onChanged;

  final Widget? hint; // Callback function when a value is selected

  @override
  State<DropdownButtonExample<T>> createState() => _DropdownButtonExampleState<T>();
}

class _DropdownButtonExampleState<T> extends State<DropdownButtonExample<T>> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title, // Display the title
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500), // Using a simple style for now
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
          child: DropdownButton<T>(
            value: widget.controller.value,
            hint: widget.hint ?? Text("Select an option"),
            icon: const Icon(Icons.arrow_drop_down), // Dropdown arrow icon
            isExpanded: true, // Dropdown fills available space
            underline: const SizedBox(), // Removes the underline
            items: widget.list.map((T item) {
              return DropdownMenuItem<T>(
                value: item,
                child: Text(item.toString()), // Use toString() to display the item
              );
            }).toList(),
            onChanged: (T? newValue) {
              setState(() {
                widget.controller.value = newValue; // Update the controller value
              });
              widget.onChanged!(newValue); // Notify parent widget of the change
            },
          ),
        ),
      ],
    );
  }
}
