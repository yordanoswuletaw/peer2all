import 'package:peer2all/const_pattern.dart';
import 'package:peer2all/palette.dart';
import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.gKey,
    required this.clearLink,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final GlobalKey<FormState> gKey;
  final Function clearLink;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 8.0),
      child: MaterialButton(
        onPressed: () {
          FocusScope.of(context).unfocus();
          if (text == 'post') {
            if (gKey.currentState!.validate()) {
              gKey.currentState!.save();
              clearLink();
            }
          }
        },
        height: 37,
        elevation: text == 'post' ? 5 : 1,
        color: kGreen,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              text,
              style: titleStyle(context, 16.0, FontWeight.w800, .5),
            ),
            Icon(icon),
          ],
        ),
      ),
    );
  }
}
