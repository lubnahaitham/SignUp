import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class DefaultTextField extends StatelessWidget {
  final String name;
  final List<String? Function(String?)> formBuilderValidators;
  final String label;
  final IconData iconData;
  final TextEditingController controller;

  const DefaultTextField({
    Key? key,
    required this.name,
    required this.formBuilderValidators,
    required this.label,
    required this.controller,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      controller: controller,
      validator: FormBuilderValidators.compose(formBuilderValidators),
      decoration: InputDecoration(
        prefixIcon: Icon(iconData),
        labelText: label,
      ),
      obscureText: name == 'password' || name == 'confirm_password',
    );
  }
}
