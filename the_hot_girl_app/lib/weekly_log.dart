//IMPORTS///////////////////////////////////////////////////////////////////////
import 'dart:typed_data';

import 'package:the_hot_girl_app/theme_color_palette.dart';
import 'create_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:week_number/western_traditional.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:screenshot/screenshot.dart';
import 'package:gal/gal.dart';
import 'globals.dart' as globals;

//CLASSES////////////////////////////////////////////////////////////////////
class WeeklyLog extends StatefulWidget {
  const WeeklyLog({super.key});

  final String title = "🌸🩷WEEKLY LOG🩷🌸";

  @override
  State<WeeklyLog> createState() => _WeeklyLog();
}

class _WeeklyLog extends State<WeeklyLog> {
  //declare variables
  int initialIndex = 0;
  String skinCycleResult = "";
  Color borderColor = pink3.withValues(alpha: 1.0);
  Color textColor = pink3.withValues(alpha: 1.0);
  bool hasBuiltOnce = false;
  bool isSchedCleared = false;
  ScreenshotController screenshotController = ScreenshotController();
  Map<int, String> kv = {
    DateTime.monday: " ",
    DateTime.tuesday: " ",
    DateTime.wednesday: " ",
    DateTime.thursday: " ",
    DateTime.friday: " ",
    DateTime.saturday: " ",
    DateTime.sunday: " ",
  };
  GlobalKey screenshotKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    //padVal is the value for how much padding is around each button.
    const double padVal = 60;
    final List<String> items = [
      "Mon",
      "Tues",
      "Wed",
      "Thurs",
      "Fri",
      "Sat",
      "Sun",
    ];
    DateTime startDateTime = dateTimeFromWeekNumber(
      DateTime.now().year,
      DateTime.now().weekNumber,
    );
    String startString = DateFormat(
      'MM/dd/yyyy',
    ).format(startDateTime.add(Duration(days: 1)));
    String endString = DateFormat(
      'MM/dd/yyyy',
    ).format(startDateTime.add(Duration(days: 7)));
    _loadState();
    var scaf = Screenshot(
      controller: screenshotController,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                padVal / 6,
                padVal * 2,
                padVal / 6,
                0,
              ),
              child: Text(
                "$startString - $endString",
                textAlign: TextAlign.center,
                style: GoogleFonts.allura(fontSize: 35.0, color: borderColor),
              ),
            ),

            //Save and Clear Button
            Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Visibility(
                  visible: DateTime.now().weekday == DateTime.sunday,
                  child: GestureDetector(
                    onDoubleTap: () => saveAndClear(),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: SizedBox(
                        height: 100,
                        width: 300,
                        child: ElevatedButton(
                          clipBehavior: Clip.antiAlias,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: pink2.withValues(alpha: 1.0),
                            foregroundColor: textColor,
                          ),
                          child: Text(
                            "Save and Clear",
                            style: TextStyle(
                              fontSize: 30,
                              color: butter.withValues(alpha: 1.0),
                            ),
                          ),
                          //when the button is pressed, go to the Daily Todo page
                          onPressed: () => {},
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  if (!isSchedCleared) {
                    getEmojis(DateTime.now().weekday == index + 1);
                  }

                  return Padding(
                    padding: EdgeInsetsGeometry.all(10),
                    child: ListTile(
                      title: Text(
                        items[index],
                        style: TextStyle(color: textColor),
                      ), // Use the index to access the data
                      subtitle: Text(
                        kv[index + 1]!,
                        style: TextStyle(fontSize: 24.0),
                      ),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: borderColor, // Specify border color
                          width: 1.0, // Specify border width
                        ),
                        borderRadius: BorderRadius.circular(
                          5.0,
                        ), // Optional: add rounded corners
                      ),
                      tileColor: pink1.withValues(alpha: 1.0),
                      contentPadding: EdgeInsets.fromLTRB(padVal / 12, 0, 0, 0),
                      isThreeLine: true,
                    ),
                  );
                },
              ),
            ),
          ],
        ),

        //creates the bottom navigator menu (see create_bottom_nav.dart)
        bottomNavigationBar: BottomNav(initialIndex),
      ),
    );
    return scaf;
  }

  ////////////////////////////////////////////////////////////////////////////////FUNCTIONS///////////////////
  void getEmojis(bool onCurrDay) {
    if (onCurrDay) {
      String finalString = "";
      if (globals.isCheckedSupplGlobal) {
        finalString += "💊";
      }
      if (!globals.isCheckedSupplGlobal) {
        finalString = finalString.replaceAll("💊", "");
      }

      if (globals.isCheckedLangGlobal) {
        finalString += "💬";
      }
      if (!globals.isCheckedLangGlobal) {
        finalString = finalString.replaceAll("💬", "");
      }

      if (globals.isCheckedWaterGlobal) {
        finalString += "💧";
      }
      if (!globals.isCheckedWaterGlobal) {
        finalString = finalString.replaceAll("💧", "");
      }

      if (globals.isDeficitGlobal) {
        finalString += "🍎";
      }
      if (!globals.isDeficitGlobal) {
        finalString = finalString.replaceAll("🍎", "");
      }

      if (globals.isCheckedSkinGlobal) {
        finalString += "🧼";
      }
      if (!globals.isCheckedSkinGlobal) {
        finalString = finalString.replaceAll("🧼", "");
      }

      if (globals.isCheckedGymGlobal) {
        finalString += "🏋🏾‍♀️";
      }
      if (!globals.isCheckedGymGlobal) {
        finalString = finalString.replaceAll("🏋🏾‍♀️", "");
      }

      kv[DateTime.now().weekday] = finalString;
      _saveState(DateTime.now().weekday.toString(), finalString);
    }
    if (DateTime.now().weekday != DateTime.sunday) {
      _saveState(DateTime.sunday.toString(), "");
    }
  }

  void _saveState(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  void saveAndClear() async {
    // Capture the image
    final Uint8List? imageBytes = await screenshotController.capture(
      pixelRatio: 3.0, // Increase pixelRatio for higher resolution
    );

    if (imageBytes != null) {
      // Save to gallery
      await Gal.putImageBytes(
        imageBytes,
        album: "!the_hot_girl_log", // Specify the custom album name here
      );
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Saved to "!the_hot_girl_log"',
            style: TextStyle(color: textColor),
          ),
          backgroundColor: butter.withValues(alpha: 1.0),
        ),
      );
    }

    setState(() {
      _saveState(DateTime.monday.toString(), "");
      _saveState(DateTime.tuesday.toString(), "");
      _saveState(DateTime.wednesday.toString(), "");
      _saveState(DateTime.thursday.toString(), "");
      _saveState(DateTime.friday.toString(), "");
      _saveState(DateTime.saturday.toString(), "");
      _saveState(DateTime.sunday.toString(), "");
    });
    // globals.isCheckedSupplGlobal = false;
    // globals.isCheckedWaterGlobal = false;
    // globals.isCheckedLangGlobal = false;
    // globals.isCheckedGymGlobal = false;
    // globals.isCheckedSkinGlobal = false;
    // globals.isDeficitGlobal = true;
    // isSchedCleared = true;
  }

  //load  states
  void _loadState() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      kv[DateTime.monday] = prefs.getString(DateTime.monday.toString()) ?? "";
      kv[DateTime.tuesday] = prefs.getString(DateTime.tuesday.toString()) ?? "";
      kv[DateTime.wednesday] =
          prefs.getString(DateTime.wednesday.toString()) ?? "";
      kv[DateTime.thursday] =
          prefs.getString(DateTime.thursday.toString()) ?? "";
      kv[DateTime.friday] = prefs.getString(DateTime.friday.toString()) ?? "";
      kv[DateTime.saturday] =
          prefs.getString(DateTime.saturday.toString()) ?? "";
      kv[DateTime.sunday] = prefs.getString(DateTime.sunday.toString()) ?? "";
    });
  }
}
