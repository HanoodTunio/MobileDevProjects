import 'package:flutter/material.dart';

class CustomDropdownField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget prefixIcon;
  final List<String> options; // Options for the dropdown

  const CustomDropdownField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    required this.options,
  });

  @override
  _CustomDropdownFieldState createState() => _CustomDropdownFieldState();
}

class _CustomDropdownFieldState extends State<CustomDropdownField> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Background color of the dropdown
          borderRadius: BorderRadius.circular(30), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Shadow color
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, 4), // Shadow position
            ),
          ],
        ),
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: widget.hintText,
            labelStyle: TextStyle(color: Colors.blue[800]), // Customize label color
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30), // Rounded corners
              borderSide: BorderSide(color: Colors.grey.shade300), // Light gray border
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Color(0xFF1A76D2)), // Focused border color
            ),
            filled: true,
            fillColor: Colors.white,
            prefixIcon: widget.prefixIcon, // Prefix icon
          ),
          value: _selectedValue, // Initial value
          hint: Text(widget.hintText),
          items: widget.options.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              _selectedValue = newValue; // Update the selected value
              widget.controller.text = newValue!; // Store the selected value in the controller
            });
          },
        ),
      ),
    );
  }
}