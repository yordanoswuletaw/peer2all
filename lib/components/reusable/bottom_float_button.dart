import 'package:peer2all/palette.dart';
import 'package:peer2all/screens/dpt_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../const_pattern.dart';

class BottomFloatButton extends StatelessWidget {
  const BottomFloatButton({Key? key, required this.contentText})
      : super(key: key);

  final String contentText;

  @override
  Widget build(BuildContext context) {
    bool isPublicRoom = contentText == 'Department Room';
    return Positioned(
      bottom: 20.0,
      child: GestureDetector(
        onTap: () => isPublicRoom
            ? Navigator.push(
                context,
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (context) => const DptScreen(),
                ),
              )
            : Navigator.pop(context),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: kGreen,
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: contentText,
                  style: textStyle(context, 1.0, 16.0, FontWeight.w800),
                ),
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Icon(
                    isPublicRoom
                        ? CupertinoIcons.chevron_down_circle
                        : CupertinoIcons.chevron_up_circle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
