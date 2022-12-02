import 'package:peer2all/components/reusable/reusable.dart';
import 'package:peer2all/models/models.dart';
import 'package:flutter/material.dart';

class DptPostRoom extends StatelessWidget {
  const DptPostRoom({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(8.0),
      ),
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (post.imageUrl.isNotEmpty) PostImage(imageUrl: post.imageUrl),
          PostTitle(title: post.title),
          if (post.links.isNotEmpty) PostLink(post: post),
          if (post.text.isNotEmpty)
            PostContent(description: post.text, date: post.date),
        ],
      ),
    );
  }
}
