//IMPORTS///////////////////////////////////////////////////////////////////////////////////////
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_hot_girl_app/theme_color_palette.dart';
import 'home_screen.dart';
import 'start_routine.dart';
import 'daily_todo.dart';
import 'weekly_log.dart';
import 'count_calories.dart';
import 'skincare.dart';
import 'washday.dart';
import 'gym.dart';
import 'package:google_fonts/google_fonts.dart';

//FUNCTIONS/////////////////////////////////////////////////////////////////////////////////////
//runs the app
void main() => runApp(const MyApp());

//CLASSES///////////////////////////////////////////////////////////////////////////////////////
class MyApp extends StatelessWidget {
  //constructor
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //stop the app from rotating
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: pinkWhite.withValues(alpha: 1.0),
        colorScheme: ColorScheme.fromSeed(
          seedColor: pink2.withValues(alpha: 1.0),
        ),
        textTheme: GoogleFonts.rochesterTextTheme(),
        useMaterial3: true,
      ),
      initialRoute: "home",
      onGenerateRoute: (settings) {
        switch (settings.name) {
          //set the possible routes
          case 'home':
            return MaterialPageRoute(builder: (context) => const HomePage());

          case 'startRoutine':
            return MaterialPageRoute(
              builder: (context) => const StartRoutine(),
            );

          case 'dailyTodo':
            return MaterialPageRoute(builder: (context) => const DailyTodo());

          case 'countCals':
            return MaterialPageRoute(builder: (context) => const CountCals());

          case 'skincare':
            return MaterialPageRoute(builder: (context) => const Skincare());

          case 'washday':
            return MaterialPageRoute(builder: (context) => const Washday());

          case 'gym':
            return MaterialPageRoute(builder: (context) => const Gym());

          case 'weeklyLog':
            return MaterialPageRoute(
              builder: (context) => const WeeklyLog(),
              settings: settings,
            );
        }
        return null;
      },
    );
  }
}
