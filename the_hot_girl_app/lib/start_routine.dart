//IMPORTS///////////////////////////////////////////////////////////////////////
import 'package:the_hot_girl_app/theme_color_palette.dart';
import 'create_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//CLASSES////////////////////////////////////////////////////////////////////
class StartRoutine extends StatefulWidget {
  const StartRoutine({super.key});

  final String title = "🎀Pick a Routine🎀";

  @override
  State<StartRoutine> createState() => _StartRoutine();
}

class _StartRoutine extends State<StartRoutine> {
  @override
  Widget build(BuildContext context) {
    //padVal is the value for how much padding is around each button.
    const double padVal = 20;
    Color textColor = butter.withValues(alpha: 1.0);

    //initialIndex determines which icon the bottom navigator will start on (See create_bottom_nav.dart)
    int initialIndex = 1;

    //scaffold that makes the UI for the homepage
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //Title Text
              Padding(
                padding: const EdgeInsets.all(padVal),
                child: Text(
                  "🎀Pick a Routine🎀",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.allura(
                    fontSize: 46.8,
                    color: pink2.withValues(alpha: 1.0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              //Gym Button
              Padding(
                padding: const EdgeInsets.all(padVal),
                child: SizedBox(
                  height: 100,
                  width: 300,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: pink2.withValues(alpha: 1.0),
                      foregroundColor: textColor,
                    ),
                    child: const Text('Gym🔥', style: TextStyle(fontSize: 30)),
                    //when the button is pressed, go to the Daily Todo page
                    onPressed: () => Navigator.pushNamed(context, 'dailyTodo'),
                  ),
                ),
              ),

              //Skincare Button
              Padding(
                padding: const EdgeInsets.all(padVal),
                child: SizedBox(
                  height: 100,
                  width: 300,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: pink2.withValues(alpha: 1.0),
                      foregroundColor: textColor,
                    ),
                    child: const Text(
                      'Skincare🧴',
                      style: TextStyle(fontSize: 30),
                    ),
                    //when the button is pressed, go to the Weekly Log page
                    onPressed: () => Navigator.pushNamed(context, 'skincare'),
                  ),
                ),
              ),

              //Washday Button
              Padding(
                padding: const EdgeInsets.all(padVal),
                child: SizedBox(
                  height: 100,
                  width: 300,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: pink2.withValues(alpha: 1.0),
                      foregroundColor: textColor,
                    ),
                    child: const Text(
                      'Washday💆🏿‍♀️',
                      style: TextStyle(fontSize: 30),
                    ),
                    //when the button is pressed, go to the Weekly Log page
                    onPressed: () => Navigator.pushNamed(context, 'washday'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      //creates the bottom navigator menu (see create_bottom_nav.dart)
      bottomNavigationBar: BottomNav(initialIndex),
    );
  }
}
