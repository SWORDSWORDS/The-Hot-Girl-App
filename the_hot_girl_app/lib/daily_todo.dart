//IMPORTS///////////////////////////////////////////////////////////////////////
import 'package:the_hot_girl_app/new_day_checker.dart';
import 'package:the_hot_girl_app/theme_color_palette.dart';
import 'create_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'globals.dart' as globals;

//CLASSES////////////////////////////////////////////////////////////////////
class DailyTodo extends StatefulWidget {
  const DailyTodo({super.key});

  final String title = "🐇To Do🎀:";
  @override
  State<DailyTodo> createState() => _DailyTodo();
}

class _DailyTodo extends State<DailyTodo> {
  //declare variables
  int initialIndex = 0;
  Color textColor = pink2.withValues(alpha: 1.0);
  Color actvColor = pink2.withValues(alpha: 1.0);
  Color chckColor = butter.withValues(alpha: 1.0);

  bool _isCheckedSuppl = false;
  bool _isCheckedWater = false;
  bool _isCheckedLang = false;
  bool _isCheckedGym = false;
  bool _isCheckedExfo = false;
  bool _isCheckedShave = false;
  bool _isCheckedSkin = false;
  bool hasBuiltOnce = false;
  String checkboxKeySuppl = "isSupplChecked";
  String checkboxKeyWater = "isWaterChecked";
  String checkboxKeyLang = "isLangChecked";
  String checkboxKeyGym = "isGymChecked";
  String checkboxKeyExfo = "isExfoChecked";
  String checkboxKeyShave = "isShaveChecked";
  String checkboxKeySkin = "isSkinChecked";

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
    _loadCheckboxState();

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
                "🎀To Do🐇",
                textAlign: TextAlign.center,
                style: GoogleFonts.allura(
                  fontSize: 60.0,
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            //Checkbox for Supplements
            Padding(
              padding: const EdgeInsets.all(0),
              child: CheckboxListTile(
                title: Text(
                  "Take Supplement(s)",
                  style: TextStyle(fontSize: 35.0, color: textColor),
                ),
                value: _isCheckedSuppl, // The current value
                onChanged: (bool? newValue) {
                  setState(() {
                    _isCheckedSuppl =
                        newValue ?? false; // Update the state when tapped
                  });
                  _saveCheckboxState(checkboxKeySuppl, _isCheckedSuppl);
                },
                activeColor: actvColor,
                checkColor: chckColor,
                side: BorderSide(
                  color: textColor, // Border color when unselected
                  width: 1.5,
                ),
              ),
            ),

            //Checkbox for Water Intake
            Padding(
              padding: const EdgeInsets.all(0),
              child: CheckboxListTile(
                title: Text(
                  "Drink 72 oz of water",
                  style: TextStyle(fontSize: 35.0, color: textColor),
                ),
                value: _isCheckedWater, // The current value
                onChanged: (bool? newValue) async {
                  setState(() {
                    _isCheckedWater =
                        newValue ?? false; // Update the state when tapped
                  });
                  _saveCheckboxState(checkboxKeyWater, _isCheckedWater);
                },
                activeColor: actvColor,
                checkColor: chckColor,
                side: BorderSide(
                  color: textColor, // Border color when unselected
                  width: 1.5,
                ),
              ),
            ),

            //Checkbox for Language Practice
            Padding(
              padding: const EdgeInsets.all(0),
              child: CheckboxListTile(
                title: Text(
                  "Practice Korean & French",
                  style: TextStyle(fontSize: 34.2, color: textColor),
                ),
                value: _isCheckedLang, // The current value
                onChanged: (bool? newValue) {
                  setState(() {
                    _isCheckedLang =
                        newValue ?? false; // Update the state when tapped
                  });
                  _saveCheckboxState(checkboxKeyLang, _isCheckedLang);
                },
                activeColor: actvColor,
                checkColor: chckColor,
                side: BorderSide(
                  color: textColor, // Border color when unselected
                  width: 1.5,
                ),
              ),
            ),

            //Checkbox for Gym
            if (DateTime.now().weekday == DateTime.monday ||
                DateTime.now().weekday == DateTime.wednesday ||
                DateTime.now().weekday == DateTime.friday) ...{
              Padding(
                padding: const EdgeInsets.all(0),
                child: CheckboxListTile(
                  title: Text(
                    "Gym",
                    style: TextStyle(fontSize: 34.2, color: textColor),
                  ),
                  value: _isCheckedGym, // The current value
                  onChanged: (bool? newValue) {
                    setState(() {
                      _isCheckedGym =
                          newValue ?? false; // Update the state when tapped
                    });
                    _saveCheckboxState(checkboxKeyGym, _isCheckedGym);
                  },
                  activeColor: actvColor,
                  checkColor: chckColor,
                  side: BorderSide(
                    color: textColor, // Border color when unselected
                    width: 1.5,
                  ),
                ),
              ),
            },

            //Checkbox for Exfoliating
            if (DateTime.now().weekday == DateTime.thursday) ...{
              Padding(
                padding: const EdgeInsets.all(0),
                child: CheckboxListTile(
                  title: Text(
                    "Exfoliate ",
                    style: TextStyle(fontSize: 35.0, color: textColor),
                  ),
                  value: _isCheckedExfo, // The current value
                  onChanged: (bool? newValue) {
                    setState(() {
                      _isCheckedExfo =
                          newValue ?? false; // Update the state when tapped
                    });
                    _saveCheckboxState(checkboxKeyExfo, _isCheckedExfo);
                  },
                  activeColor: actvColor,
                  checkColor: chckColor,
                  side: BorderSide(
                    color: textColor, // Border color when unselected
                    width: 1.5,
                  ),
                ),
              ),
            },

            //Checkbox for Shaving
            if (DateTime.now().weekday == DateTime.friday) ...{
              Padding(
                padding: const EdgeInsets.all(0),
                child: CheckboxListTile(
                  title: Text(
                    "Shave",
                    style: TextStyle(fontSize: 35.0, color: textColor),
                  ),
                  value: _isCheckedShave, // The current value
                  onChanged: (bool? newValue) {
                    setState(() {
                      _isCheckedShave =
                          newValue ?? false; // Update the state when tapped
                    });
                    _saveCheckboxState(checkboxKeyShave, _isCheckedShave);
                  },
                  activeColor: actvColor,
                  checkColor: chckColor,
                  side: BorderSide(
                    color: textColor, // Border color when unselected
                    width: 1.5,
                  ),
                ),
              ),
            },

            //Checkbox for Skincare
            Padding(
              padding: const EdgeInsets.all(0),
              child: CheckboxListTile(
                title: Text(
                  "Skincare",
                  style: TextStyle(fontSize: 34.2, color: textColor),
                ),
                value: _isCheckedSkin, // The current value
                onChanged: (bool? newValue) {
                  setState(() {
                    _isCheckedSkin =
                        newValue ?? false; // Update the state when tapped
                  });
                  _saveCheckboxState(checkboxKeySkin, _isCheckedSkin);
                },
                activeColor: actvColor,
                checkColor: chckColor,
                side: BorderSide(
                  color: textColor, // Border color when unselected
                  width: 1.5,
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

  ////////////////////////////////////////////////////////////////////////////////FUNCTIONS///////////////////
  // Save state
  void _saveCheckboxState(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  //load checkbox states
  void _loadCheckboxState() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isCheckedSuppl = prefs.getBool(checkboxKeySuppl) ?? false;
      _isCheckedWater = prefs.getBool(checkboxKeyWater) ?? false;
      _isCheckedLang = prefs.getBool(checkboxKeyLang) ?? false;
      _isCheckedExfo = prefs.getBool(checkboxKeyExfo) ?? false;
      _isCheckedShave = prefs.getBool(checkboxKeyShave) ?? false;
      _isCheckedGym = prefs.getBool(checkboxKeyGym) ?? false;
      _isCheckedSkin = prefs.getBool(checkboxKeySkin) ?? false;

      globals.isCheckedSupplGlobal = _isCheckedSuppl;
      globals.isCheckedWaterGlobal = _isCheckedWater;
      globals.isCheckedLangGlobal = _isCheckedLang;
      globals.isCheckedGymGlobal = _isCheckedGym;
      globals.isCheckedSkinGlobal = _isCheckedSkin;
    });
  }

  //reset checkboxes daily
  void _resetIfNewDay() async {
    bool isNewDay = await DayChecker.isNewDay();
    if (isNewDay) {
      _saveCheckboxState(checkboxKeySuppl, false);
      _saveCheckboxState(checkboxKeyWater, false);
      _saveCheckboxState(checkboxKeyLang, false);
      _saveCheckboxState(checkboxKeyExfo, false);
      _saveCheckboxState(checkboxKeyShave, false);
      _saveCheckboxState(checkboxKeyGym, false);
      _saveCheckboxState(checkboxKeySkin, false);
      globals.isCheckedSupplGlobal = false;
      globals.isCheckedWaterGlobal = false;
      globals.isCheckedLangGlobal = false;
      globals.isCheckedGymGlobal = false;
      globals.isCheckedSkinGlobal = false;
    }
  }
}
