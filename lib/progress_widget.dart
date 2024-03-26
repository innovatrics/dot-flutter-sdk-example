import 'package:flutter/material.dart';

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: const CircularProgressIndicator());
  }
}
