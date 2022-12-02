import 'package:peer2all/const_pattern.dart';
import 'package:peer2all/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostContent extends StatefulWidget {
  const PostContent({Key? key, required this.description, required this.date})
      : super(key: key);

  final String description, date;

  @override
  _PostContentState createState() => _PostContentState();
}

class _PostContentState extends State<PostContent> {
  var isWhole = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: isWhole
              ? SelectableText.rich(
                  TextSpan(
                    text: widget.description,
                    style: textStyle(context, 1.0, 15.0, FontWeight.w500),
                  ),
                )
              : RichText(
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    text: widget.description,
                    style: textStyle(context, 1.0, 15.0, FontWeight.w500),
                  ),
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.date),
            ),
            Container(
              height: 33,
              width: size.width * .4,
              child: TextButton.icon(
                onPressed: () => setState(() {
                  isWhole = !isWhole;
                }),
                icon: Icon(
                  isWhole
                      ? CupertinoIcons.chevron_up
                      : CupertinoIcons.chevron_down,
                  size: 16,
                  color: kGreen,
                ),
                label: Text(
                  isWhole ? 'collapse post' : 'whole post',
                  style: const TextStyle(
                      fontSize: 14.5,
                      fontWeight: FontWeight.w600,
                      color: kGreen),
                ),
              ),
              decoration: BoxDecoration(
                //border: Border.all(width: .5, color: kGreen),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ],
        )
      ],
    );
  }
}
