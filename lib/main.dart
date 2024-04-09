import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_theme/json_theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vote_ready/components/level_status_notifier.dart';
import 'package:vote_ready/components/score_notifier.dart';
import 'package:vote_ready/pages/home_page.dart';
import 'package:vote_ready/pages/login_page.dart';
import 'package:vote_ready/pages/register_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final themeStr = await rootBundle.loadString('assets/appainter_theme.json');
  final themeJson = jsonDecode(themeStr);
  final theme = ThemeDecoder.decodeThemeData(themeJson, validate: true) ?? ThemeData();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ScoreProvider>(
        create: (context) => ScoreProvider(),
      ),
      ChangeNotifierProvider<LevelCompletionNotifier>(
        create: (context) => LevelCompletionNotifier(),
      ),
    ],
    child: VoteReadyGame(
      theme: theme,
    ),
  ));
}

class VoteReadyGame extends StatelessWidget {
  final ThemeData? theme;

  const VoteReadyGame({
    Key? key,
    required this.theme,
  }) : super(key: key);

  Future<bool> _checkIfRegistered() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool registered = prefs.getBool('registered') ?? false;
    return registered;
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      child: MaterialApp(
        routes: {
          "HomePage": (context) => const HomePage(),
        },
        home: StreamBuilder(
          stream: AuthService.userStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return FutureBuilder<bool>(
                future: _checkIfRegistered(),
                builder: (context, registeredSnapshot) {
                  if (registeredSnapshot.connectionState == ConnectionState.done) {
                    if (registeredSnapshot.data!) {
                      return const HomePage();
                    } else {
                      return const Register();
                    }
                  } else {
                    // Show a loading indicator while checking registration status
                    return const Scaffold(
                      body: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                },
              );
            } else {
              return const LoginPage();
            }
          },
        ),
        theme: theme,
      ),
    );
  }
}
