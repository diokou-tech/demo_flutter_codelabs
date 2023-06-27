import 'package:flutter/material.dart';
import 'package:shrine/colors.dart';
import 'home.dart';
import 'login.dart';
import 'package:shrine/supplemental/cut_corners_border.dart';

class ShrineApp extends StatelessWidget {
  const ShrineApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme _buildShrineTextTheme(TextTheme base) {
      return base
          .copyWith(
            headlineLarge: base.headlineLarge!.copyWith(
              fontWeight: FontWeight.w500,
            ),
            headlineMedium: base.headlineMedium!.copyWith(
              fontSize: 18.0,
            ),
            headlineSmall: base.headlineSmall!.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 14.0,
            ),
            bodyMedium: base.bodyMedium!.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 16.0,
            ),
          )
          .apply(
            fontFamily: 'Rubik',
            displayColor: kShrineBrown900,
            bodyColor: kShrineBrown900,
          );
    }

    ThemeData _buildSherineTheme() {
      final ThemeData base = ThemeData.light();
      return base.copyWith(
          colorScheme: base.colorScheme.copyWith(
            primary: kShrinePurple,
            secondary: kShrinePurple,
            error: kShrineErrorRed,
          ),
          inputDecorationTheme: InputDecorationTheme(
              border: CutCornersBorder(),
              focusedBorder: CutCornersBorder(
                  borderSide: BorderSide(width: 2, color: kShrinePurple)),
              floatingLabelStyle: TextStyle(color: kShrinePurple)),
          textTheme: _buildShrineTextTheme(base.textTheme),
          textSelectionTheme:
              const TextSelectionThemeData(selectionColor: kShrinePurple));
    }

    final ThemeData _ksherinTheme = _buildSherineTheme();

    return MaterialApp(
      title: 'Shrine',
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (BuildContext context) => const LoginPage(),
        '/': (BuildContext context) => HomePage(),
      },
      theme: _ksherinTheme,
    );
  }
}

// TODO: Build a Shrine Theme (103)
// TODO: Build a Shrine Text Theme (103)
