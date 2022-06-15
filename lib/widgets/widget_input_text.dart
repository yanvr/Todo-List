import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const InputText(this.label, this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        controller: controller,
        style:
            const TextStyle(color: Colors.black, backgroundColor: Colors.white),
        decoration: InputDecoration(labelText: label),
      ),
    );
  }
}
