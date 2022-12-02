import 'package:peer2all/components/reusable/reusable.dart';
import 'package:peer2all/const_pattern.dart';
import 'package:peer2all/models/models.dart';
import 'package:peer2all/palette.dart';
import 'package:peer2all/providrs/providers.dart';
import 'package:peer2all/screens/screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(CupertinoIcons.chevron_down),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Profile',
          style: textStyle(context, 1.0, 16.0, FontWeight.w700),
        ),
        actions: [
          CustomMaterialButton(
            text: 'theme',
            icon: Icons.light_mode,
            onpress: () => context.read<SettingProvider>().changeThemeMode(),
          ),
          PopupMenuButton(
            color: Theme.of(context).colorScheme.secondary,
            onSelected: (val) {
              if (val == 'logout') {
                while (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'logout',
                child: Row(
                  children: [
                    const Icon(
                      Icons.logout,
                      color: kGreen,
                    ),
                    Text(
                      'Logout',
                      style: titleStyle(context, 16.0, FontWeight.w900),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
      body: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: '#profile',
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).colorScheme.secondary,
                      width: 1.5,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: const CircleAvatar(
                    radius: 64,
                    backgroundImage: AssetImage('./assets/images/peer2all.png'),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                margin: const EdgeInsets.only(top: 16.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(.1),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    richInfo(context, currentUser.id, 'id'),
                    const SizedBox(height: 8.0),
                    richInfo(context, currentUser.firstName, 'name',
                        currentUser.lastName),
                    const SizedBox(height: 8.0),
                    richInfo(context, currentUser.dpt, 'department'),
                    const SizedBox(height: 8.0),
                    richInfo(
                        context,
                        currentUser.year == 1
                            ? '1st'
                            : currentUser.year == 2
                                ? '2nd'
                                : currentUser.year == 3
                                    ? '3rd'
                                    : '${currentUser.year}th',
                        'year'),
                    const SizedBox(height: 8.0),
                    richInfo(
                        context, currentUser.section.toUpperCase(), 'section'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  RichText richInfo(context, text11, text21, [text12 = '']) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        style: TextStyle(color: Theme.of(context).textTheme.overline?.color),
        children: [
          TextSpan(
            text: '$text11 $text12\n',
            style: textStyle(context, 1.0, 17.0, FontWeight.w600),
          ),
          TextSpan(
            text: text21,
            style: titleStyle(context, 11.0, FontWeight.w600, .5),
          ),
        ],
      ),
    );
  }
}
