import 'package:flutter/material.dart';

class Modals {
  Future<dynamic> appBottomSheet(BuildContext context, Widget body) {
    return showModalBottomSheet(
      isScrollControlled: true,

      // barrierColor:,
      enableDrag: true,
      showDragHandle: true,
      context: context,
      builder: (context) {
        return body;
      },
    );
  }
}
