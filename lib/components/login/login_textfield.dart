import 'package:peer2all/const_pattern.dart';
import 'package:peer2all/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField({
    Key? key,
    required this.label,
    required this.inputType,
  }) : super(key: key);

  final String label;
  final TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController(text: '');
    return TextFormField(
      textAlignVertical: TextAlignVertical.center,
      keyboardType: inputType,
      obscureText: inputType == TextInputType.visiblePassword ? true : false,
      inputFormatters: inputType == TextInputType.number
          ? [
              FilteringTextInputFormatter.allow(RegExp('[0-9]')),
            ]
          : inputType == TextInputType.name
              ? [
                  if (label != 'department')
                    FilteringTextInputFormatter.allow(RegExp('[A-Za-z]')),
                  if (label == 'section') LengthLimitingTextInputFormatter(1),
                  if (label == 'department')
                    FilteringTextInputFormatter.allow(RegExp('[ A-Za-z]')),
                ]
              : [LengthLimitingTextInputFormatter(16)],
      controller: _controller,
      validator: (val) {
        if (val!.isEmpty) return '$label should not be empty';
        if (inputType == TextInputType.visiblePassword) {
          if (val.length < 6 || val.length > 16) {
            return '$label lenght should be 6 - 16 charactes';
          }
        }
        return null;
      },
      onSaved: (val) {
        _controller.text = '';
      },
      style: textStyle(context, 1.0, 16.0, FontWeight.w600),
      decoration: InputDecoration(
        label: Text(label),
        labelStyle: const TextStyle(
          fontSize: 16.0,
        ),
        helperText: label == 'department'
            ? 'Enter full departmet name. e.g Software Engineering'
            : null,
        helperStyle: const TextStyle(fontSize: 12.5, color: kGreen),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: kGreen,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
