import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  final String hintText; // HintText parameter
  final ValueChanged<String> onChanged; // onChanged callback

  const CustomSearchBar({
    super.key,
    required this.hintText, // Required hintText parameter
    required this.onChanged, // Required onChanged parameter
  });

  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode(); // FocusNode to manage focus state
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange); // Listen for focus changes
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus; // Update the focus state
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose(); // Dispose FocusNode when done
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.0), // Fully rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Light shadow
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
          border: Border.all(
            color: _isFocused ? Colors.blue : Colors.transparent, // Border when focused
            width: _isFocused ? 1.5 : 0, // Slightly thicker border when focused
          ),
        ),
        child: TextField(
          controller: _controller,
          focusNode: _focusNode, // Attach FocusNode to the TextField
          textAlignVertical: TextAlignVertical.center, // Centers the text vertically
          decoration: InputDecoration(
            hintText: widget.hintText, // Use hintText from the widget
            hintStyle: TextStyle(color: Colors.grey[600]), // Gray hint text
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.grey, // Light gray icon
              size: 24,
            ),
            border: InputBorder.none, // No border by default
            contentPadding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 20.0), // Padding
          ),
          onChanged: widget.onChanged, // Trigger onChanged when text is entered
        ),
      ),
    );
  }
}
