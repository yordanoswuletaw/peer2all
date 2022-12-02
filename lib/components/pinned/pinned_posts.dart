import 'package:peer2all/const_pattern.dart';
import 'package:peer2all/models/models.dart';
import 'package:peer2all/palette.dart';
import 'package:flutter/material.dart';

class PinnedPosts extends StatelessWidget {
  const PinnedPosts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Card(
          color: Theme.of(context).colorScheme.secondary,
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 11.0,
              right: 11.0,
              top: 16.0,
            ),
            child: Column(
              children: [
                ...pinnedPosts.map(
                  (post) => GestureDetector(
                    onTap: () {},
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(post.date),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Text(
                                  post.title.toUpperCase(),
                                  overflow: TextOverflow.clip,
                                  style: titleStyle(
                                      context, 16.0, FontWeight.w600, 1.0),
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              if (post.text.isNotEmpty)
                                Flexible(
                                  child: Text(
                                    post.text,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyle(
                                        context, 1.0, 15.0, FontWeight.w400),
                                  ),
                                ),
                              const SizedBox(height: 16.0),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Positioned(
          top: -.7,
          child: Text(
            'pinned posts',
            style: TextStyle(color: kGreen),
          ),
        ),
      ],
    );
  }
}
