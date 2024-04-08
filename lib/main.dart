import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_theme/json_theme.dart';
import 'package:provider/provider.dart';
import 'package:vote_ready/components/level_status_notifier.dart';
import 'package:vote_ready/components/score_notifier.dart';
import 'dart:convert';
import 'package:vote_ready/pages/home_page.dart';
import 'package:vote_ready/pages/login_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:vote_ready/pages/profile_page.dart';
// import 'package:vote_ready/widgets/fact_card.dart';
// import 'package:vote_ready/widgets/profile_page_buttons.dart';
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
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
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
    super.key,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    Widget retVal = ScreenUtilInit(
      minTextAdapt: true,
      child: MaterialApp(
        routes: {
          "HomePage": (context) => const HomePage(),
        },
        home: StreamBuilder(
          stream: AuthService.userStream,
          builder: (context, snapshot) {
            return snapshot.hasData ? const HomePage() : const LoginPage();
          },
        ),
        theme: theme,
      ),
    );
    return retVal;
  }
}
