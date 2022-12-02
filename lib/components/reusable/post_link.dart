import 'package:peer2all/models/post.dart';
import 'package:peer2all/palette.dart';
import 'package:flutter/material.dart';

class PostLink extends StatelessWidget {
  const PostLink({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        children: post.links
            .map(
              (link) => TextButton.icon(
                icon: const Icon(
                  Icons.link_rounded,
                  color: kGreen,
                  size: 32,
                ),
                label: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      link['hint'],
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 11.5,
                          fontWeight: FontWeight.w400),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: SelectableText(
                        link['link'],
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            // fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                onPressed: () {},
              ),
            )
            .toList(),
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: post.imageUrl.isEmpty
            ? const BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              )
            : null,
      ),
    );
  }
}
