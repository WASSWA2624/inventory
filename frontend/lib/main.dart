import 'package:flutter/material.dart';

/// Entry point for the Tapture application.
void main() {
  runApp(const _TaptureApp());
}

class _TaptureApp extends StatelessWidget {
  const _TaptureApp();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Tapture', home: Scaffold());
  }
}
