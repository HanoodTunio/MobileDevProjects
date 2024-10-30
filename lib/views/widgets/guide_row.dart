// lib/views/widgets/guide_row.dart

import 'package:flutter/material.dart';

class GuideRow extends StatelessWidget {
  final String srNo;
  final String guideId;
  final String guideName;
  final String status;
  final VoidCallback onActionTap;
  final VoidCallback onRowTap;

  const GuideRow({
    Key? key,
    required this.srNo,
    required this.guideId,
    required this.guideName,
    required this.status,
    required this.onActionTap,
    required this.onRowTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onRowTap, // Tap the row to navigate to details
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Row(
          children: [
            Expanded(flex: 1, child: Text(srNo, textAlign: TextAlign.center)),
            Expanded(flex: 2, child: Text(guideId, textAlign: TextAlign.center)),
            Expanded(flex: 2, child: Text(guideName, textAlign: TextAlign.center)),
            Expanded(flex: 2, child: Text(status, textAlign: TextAlign.center)),
            Expanded(
              flex: 1,
              child: IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: onActionTap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
