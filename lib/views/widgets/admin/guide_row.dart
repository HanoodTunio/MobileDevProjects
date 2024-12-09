// lib/views/widgets/guide_row.dart

import 'package:flutter/material.dart';

class GuideRow extends StatefulWidget {
  final String srNo;
  final String guideId;
  final String guideName;
  final String status;
  final Color statusColor; // Add statusColor as a parameter
  final VoidCallback onActionTap;
  final VoidCallback onRowTap;

  const GuideRow({
    Key? key,
    required this.srNo,
    required this.guideId,
    required this.guideName,
    required this.status,
    required this.statusColor, // Add statusColor to constructor
    required this.onActionTap,
    required this.onRowTap,
  }) : super(key: key);

  @override
  _GuideRowState createState() => _GuideRowState();
}

class _GuideRowState extends State<GuideRow> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onRowTap,
        child: Container(
          color: _isHovered ? Colors.blue.withOpacity(0.1) : Colors.white, // Change color on hover
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          child: Row(
            children: [
              Expanded(flex: 1, child: Text(widget.srNo, textAlign: TextAlign.center)),
              Expanded(flex: 2, child: Text(widget.guideId, textAlign: TextAlign.center)),
              Expanded(flex: 2, child: Text(widget.guideName, textAlign: TextAlign.center)),
              Expanded(
                flex: 2,
                child: Text(
                  widget.status,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: widget.statusColor, // Set color based on the status
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: widget.onActionTap,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
