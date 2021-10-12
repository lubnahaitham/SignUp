import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'default_text_field.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({Key? key}) : super(key: key);

  @override
  _CustomFormState createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final TextEditingController _phone = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                const SizedBox(height: 20),

                DefaultTextField(
                  label: "Name",
                  controller: _name,
                  iconData: Icons.person,
                  formBuilderValidators: [
                    FormBuilderValidators.required(context)
                  ],
                  name: 'name',
                ),
                DefaultTextField(
                  label: "Email",
                  controller: _email,
                  iconData: Icons.email,
                  formBuilderValidators: [
                    FormBuilderValidators.required(context),
                    FormBuilderValidators.email(context),
                  ],
                  name: 'email',
                ),
                DefaultTextField(
                  label: "Phone",
                  controller: _phone,
                  iconData: Icons.phone,
                  formBuilderValidators: [
                    FormBuilderValidators.required(context),
                    FormBuilderValidators.numeric(context),
                  ],
                  name: 'email',
                ),
                DefaultTextField(
                  label: "Password",
                  controller: _password,
                  iconData: Icons.password,
                  formBuilderValidators: [
                    FormBuilderValidators.required(context),
                    FormBuilderValidators.minLength(context, 8),
                  ],
                  name: 'email',
                ),
                DefaultTextField(
                  label: "Confirm Password",
                  controller: _confirmPassword,
                  iconData: Icons.password,
                  formBuilderValidators: [
                    FormBuilderValidators.required(context),
                    FormBuilderValidators.minLength(context, 8),
                    FormBuilderValidators.match(context, _password.text),
                  ],
                  name: 'email',
                ),
                const SizedBox(height: 40),

                ElevatedButton(
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    final validationSuccess = _formKey.currentState!.validate();
                    if (validationSuccess) {
                      _formKey.currentState!.save();
                    }
                    FocusScope.of(context).unfocus();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
