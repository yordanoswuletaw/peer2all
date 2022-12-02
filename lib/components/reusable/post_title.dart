import 'package:peer2all/const_pattern.dart';
import 'package:flutter/material.dart';

class PostTitle extends StatelessWidget {
  const PostTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 16.0, left: 8.0, right: 8.0, bottom: 8.0),
      child: SelectableText.rich(
        TextSpan(
          text: title,
          style: titleStyle(context, 17.0, FontWeight.w700, 1.0),
        ),
      ),
    );
  }
}
