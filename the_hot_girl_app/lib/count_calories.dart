//IMPORTS///////////////////////////////////////////////////////////////////////
import 'package:flutter/services.dart';
import 'package:the_hot_girl_app/new_day_checker.dart';
import 'package:the_hot_girl_app/theme_color_palette.dart';
import 'create_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'globals.dart' as globals;

//CLASSES////////////////////////////////////////////////////////////////////
class CountCals extends StatefulWidget {
  const CountCals({super.key});

  final String title = "Count Calories🍰";

  @override
  State<CountCals> createState() => _CountCals();
}

class _CountCals extends State<CountCals> {
  //declare variables
  int initialIndex = 0;
  int calMax = 1520;
  int calEntered = 0;
  String calEnteredKey = "";
  bool isDeficit = true;
  final inputController = TextEditingController();
  Color textColor = pink3.withValues(alpha: 1.0);

  bool hasBuiltOnce = false;

  @override
  Widget build(BuildContext context) {
    //padVal is the value for how much padding is around each button.
    const double padVal = 10;

    //reset all values if a day has passed
    if (!hasBuiltOnce) {
      _resetIfNewDay();
      hasBuiltOnce = true;
    }

    // Load stored state
    _loadState();

    //scaffold that makes the UI for the homepage
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Title Text
            Padding(
              padding: const EdgeInsets.all(padVal),
              child: Text(
                "Count Calories 🍰",
                textAlign: TextAlign.center,
                style: GoogleFonts.allura(
                  fontSize: 49.0,
                  color: pink2.withValues(alpha: 1.0),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(0),
              child: TextField(
                style: TextStyle(color: textColor),
                keyboardType: TextInputType.number,
                controller: inputController,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(
                    RegExp(r'^-?\d*\.?\d*'),
                  ), // Limits input to 0-9 and negative numbers
                ],
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: butter.withValues(alpha: 1.0),
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: butter.withValues(alpha: 1.0),
                      width: 2.0,
                    ),
                  ),
                  hintText: 'Enter calories here, babe',
                  hintStyle: TextStyle(
                    color: textColor, // Set the color here
                  ),
                ),
                onSubmitted: (value) {
                  calEntered += int.parse(value);
                  _saveState(calEnteredKey, calEntered);
                  inputController.clear();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "$calEntered / $calMax",
                style: TextStyle(
                  fontSize: 40.0,
                  color: pink2.withValues(alpha: 1.0),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),

      //creates the bottom navigator menu (see create_bottom_nav.dart)
      bottomNavigationBar: BottomNav(initialIndex),
    );
  }

  ////////////////////////////////////////////////////////////////////////////////FUNCTIONS///////////////////
  // Save state
  void _saveState(String key, int value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  //load state
  void _loadState() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      calEntered = prefs.getInt(calEnteredKey) ?? 0;
      if (calEntered > calMax) {
        isDeficit = false;
      } else {
        isDeficit = true;
      }
      globals.isDeficitGlobal = isDeficit;
    });
  }

  //reset checkboxes daily
  void _resetIfNewDay() async {
    bool isNewDay = await DayChecker.isNewDay();
    if (isNewDay) {
      _saveState(calEnteredKey, 0);
      globals.isDeficitGlobal = true;
    }
  }
}
