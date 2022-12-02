import 'package:peer2all/components/dpt_room/dpt_room.dart';
import 'package:peer2all/components/pinned/pinned_posts.dart';
import 'package:peer2all/components/profile/profile.dart';
import 'package:peer2all/components/reusable/reusable.dart';
import 'package:peer2all/const_pattern.dart';
import 'package:peer2all/models/models.dart';
import 'package:peer2all/palette.dart';
import 'package:flutter/material.dart';

class DptScreen extends StatelessWidget {
  const DptScreen({Key? key}) : super(key: key);

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
                    ...posts.map((post) => DptPostRoom(post: post)),
                    const SizedBox(height: 94.0),
                  ],
                ),
              ),
            ],
          ),
          bottomLinearGradient(context),
          const BottomFloatButton(contentText: 'Public Room'),
          if (currentUser.adminStatus['isRep'] &&
              currentUser.adminStatus['uniqueId'])
            Positioned(
              bottom: 20,
              left: 28,
              child: GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (context) => const DptAdmin(),
                  ),
                ),
                child: Image.asset(
                  './assets/images/add.png',
                  height: 34,
                  width: 34,
                ),
              ),
            ),
        ],
      ),
    );
  }

  SliverAppBar buildAppBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      floating: true,
      leading: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Profile()),
        ),
        child: Hero(
          tag: '#profile',
          child: Container(
            margin: const EdgeInsets.only(left: 4.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.secondary,
                width: 1.5,
              ),
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              //radius: 300,
              backgroundImage: AssetImage(currentUser.profileImg),
            ),
          ),
        ),
      ),
      title: Text(
        '${currentUser.dpt} Room',
        style: textStyle(context, 1.0, 16.0, FontWeight.w900),
      ),
      actions: [
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: ColoredBox(
              color: kGreen,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                child: Text(
                  'room: ${currentUser.year}',
                  style: textStyle(context, 1.0, 14.0, FontWeight.w800),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 4),
      ],
    );
  }
}
