import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:peer2all/theme_data.dart';
import 'package:provider/provider.dart';

import 'providrs/providers.dart';
import 'screens/screens.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SettingProvider()),
      ],
      child: const Peer2All(),
    ),
  );
}

class Peer2All extends StatelessWidget {
  const Peer2All({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'peer2All',
      theme: lightTheme(context),
      darkTheme: darkTheme(context),
      themeMode: context.watch<SettingProvider>().themeMode
          ? ThemeMode.dark
          : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home:
          'hello'.length % 2 == 0 ? const PublicScreen() : const LoginScreen(),
    );
  }
}
