import 'package:flutter/material.dart';

// build Loading
Widget buildLoadingUi() {
  return Center(child: CircularProgressIndicator());
}

// build Error UI
Widget buildErrorUi(String message) {
  return Center(
    child: Text(
      message,
      style: TextStyle(color: Colors.red),
    ),
  );
}
