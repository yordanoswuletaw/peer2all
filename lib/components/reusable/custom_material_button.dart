import 'package:peer2all/const_pattern.dart';
import 'package:peer2all/palette.dart';
import 'package:flutter/material.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({
    Key? key,
    required this.onpress,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final Function() onpress;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10, right: 4),
      child: MaterialButton(
        onPressed: onpress,
        height: 10,
        color: kGreen,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Row(
          children: [
            Text(
              text,
              style: titleStyle(context, 14.0, FontWeight.w900, .5),
            ),
            Icon(icon),
          ],
        ),
      ),
    );
  }
}
