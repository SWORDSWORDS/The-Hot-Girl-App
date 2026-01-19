//IMPORTS///////////////////////////////////////////////////////////////////////////////////////
import 'package:flutter/material.dart';
import 'create_bottom_nav.dart';
import 'theme_color_palette.dart';
import 'package:google_fonts/google_fonts.dart';

//CLASSES///////////////////////////////////////////////////////////////////////////////////////
//HomePage is Stateful. It calls on _HomePageState
class HomePage extends StatefulWidget {
  //constructor
  const HomePage({super.key});

  final String title = "The Hot Girl App";

  @override
  State<HomePage> createState() => _HomePageState();
} //end of HomePage

//_HomePageState returns a scaffold that makes the UI for the homepage
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //padVal is the value for how much padding is around each button.
    const double padVal = 20;
    Color textColor = butter.withValues(alpha: 1.0);

    //initialIndex determines which icon the bottom navigator will start on (See create_bottom_nav.dart)
    int initialIndex = 1;

    //scaffold that makes the UI for the homepage
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Title Text
            Padding(
              padding: const EdgeInsets.all(padVal),
              child: Text(
                "The H🔥t Girl App🎀",
                textAlign: TextAlign.center,
                style: GoogleFonts.allura(
                  fontSize: 60.0,
                  color: pink2.withValues(alpha: 1.0),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            //Start A Routine Button
            Padding(
              padding: const EdgeInsets.all(
                padVal,
              ), //creates padding around the button
              child: SizedBox(
                //sets the size of the button
                height: 100,
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: pink2.withValues(alpha: 1.0),
                    foregroundColor: textColor,
                  ),
                  child: Text(
                    'Start A Routine 🔥',
                    style: TextStyle(fontSize: 30),
                  ),
                  //when the button is pressed, go to the Start A Routine page
                  onPressed: () => Navigator.pushNamed(context, 'startRoutine'),
                ),
              ),
            ),

            //Daily Todo Button
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
                    'Daily Todo 🩰',
                    style: TextStyle(fontSize: 30),
                  ),
                  //when the button is pressed, go to the Daily Todo page
                  onPressed: () => Navigator.pushNamed(context, 'dailyTodo'),
                ),
              ),
            ),

            //Log Button
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
                    'Weekly Log 🎀',
                    style: TextStyle(fontSize: 30),
                  ),
                  //when the button is pressed, go to the Weekly Log page
                  onPressed: () => Navigator.pushNamed(context, 'weeklyLog'),
                ),
              ),
            ),
          ],
        ),
      ),

      //creates the bottom navigator menu (see create_bottom_nav.dart)
      bottomNavigationBar: BottomNav(initialIndex),
    );
  }
}
