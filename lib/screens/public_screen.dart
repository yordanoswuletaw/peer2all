import 'package:peer2all/components/pinned/pinned_posts.dart';
import 'package:peer2all/components/profile/profile.dart';
import 'package:peer2all/components/public_room/public_post_room.dart';
import 'package:peer2all/components/reusable/reusable.dart';
import 'package:peer2all/const_pattern.dart';
import 'package:peer2all/models/models.dart';
import 'package:flutter/material.dart';

class PublicScreen extends StatelessWidget {
  const PublicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          CustomScrollView(
            slivers: [
              buildAppBar(context),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    if (pinnedPosts.isNotEmpty) const PinnedPosts(),
                    ...posts.map((post) => PublicPostRoom(post: post)),
                    const SizedBox(height: 94.0),
                  ],
                ),
              ),
            ],
          ),
          bottomLinearGradient(context),
          const BottomFloatButton(contentText: 'Department Room'),
        ],
      ),
    );
  }

  SliverAppBar buildAppBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      centerTitle: false,
      floating: true,
      leading: null,
      leadingWidth: double.infinity,
      automaticallyImplyLeading: false,
      title: Text(
        'peer2All',
        style: textStyle(context, .9, 24.0, FontWeight.w700),
      ),
      actions: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              currentUser.firstName,
              style: textStyle(context, .8, 16.0, FontWeight.w700),
            ),
            Text(
              currentUser.id.toString(),
              style: textStyle(context, .7, 12.0, FontWeight.w700),
            )
          ],
        ),
        const SizedBox(width: 8.0),
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Profile()),
          ),
          child: Hero(
            tag: '#profile',
            child: Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).colorScheme.secondary,
                  width: 1.5,
                ),
                image: const DecorationImage(
                  image: AssetImage('./assets/images/peer2all.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16.0),
      ],
    );
  }
}
