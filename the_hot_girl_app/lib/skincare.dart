//IMPORTS///////////////////////////////////////////////////////////////////////
import 'package:the_hot_girl_app/theme_color_palette.dart';
import 'create_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';

//CLASSES////////////////////////////////////////////////////////////////////
class Skincare extends StatefulWidget {
  const Skincare({super.key});

  final String title = "Skincare🧴";

  @override
  State<Skincare> createState() => _Skincare();
}

class _Skincare extends State<Skincare> {
  //declare variables
  int initialIndex = 0;
  String skinCycleResult = "";
  Color textColor = pink2.withValues(alpha: 1.0);
  bool hasBuiltOnce = false;
  Timer? _timer;
  int _start = 60;
  bool isButtonVis = true;

  @override
  Widget build(BuildContext context) {
    //padVal is the value for how much padding is around each button.
    const double padVal = 20;
    const double fontSizeVal = 35.0;

    skinCycleResult = _skinCycle();
    String step3 = "3. $skinCycleResult";

    //scaffold that makes the UI for the homepage
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Title Text
            Padding(
              padding: const EdgeInsets.all(padVal),
              child: Text(
                "Skincare🧴",
                textAlign: TextAlign.center,
                style: GoogleFonts.allura(
                  fontSize: 65.0,
                  color: pink2.withValues(alpha: 1.0),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            //step 1
            Padding(
              padding: const EdgeInsets.all(0),
              child: Text(
                "1. CeraVe® 🧼",
                style: TextStyle(color: textColor, fontSize: fontSizeVal),
              ),
            ),

            //step 2
            Padding(
              padding: const EdgeInsets.all(0),
              child: Text(
                "2. Toner 🌿",
                style: TextStyle(color: textColor, fontSize: fontSizeVal),
              ),
            ),

            //step 3
            Padding(
              padding: const EdgeInsets.all(0),
              child: Text(
                step3,
                style: TextStyle(color: textColor, fontSize: fontSizeVal),
              ),
            ),

            //step 4
            Padding(
              padding: const EdgeInsets.all(0),
              child: Text(
                "4. Moisturizer 🧴",
                style: TextStyle(color: textColor, fontSize: fontSizeVal),
              ),
            ),

            //step 5
            Padding(
              padding: const EdgeInsets.all(0),
              child: Text(
                "5. Aquaphor 🐌",
                style: TextStyle(color: textColor, fontSize: fontSizeVal),
              ),
            ),

            //Daily Todo Button
            Visibility(
              visible: isButtonVis,
              child: Padding(
                padding: const EdgeInsets.all(padVal),
                child: SizedBox(
                  height: 100,
                  width: 300,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: pink2.withValues(alpha: 1.0),
                      foregroundColor: textColor,
                    ),
                    child: Text(
                      "Start 1 Min Timer",
                      style: TextStyle(
                        fontSize: 30,
                        color: butter.withValues(alpha: 1.0),
                      ),
                    ),
                    //when the button is pressed, go to the Daily Todo page
                    onPressed: () => startTimer(),
                  ),
                ),
              ),
            ),

            //Timer Text
            Visibility(
              visible: !isButtonVis,
              child: Padding(
                padding: const EdgeInsets.all(padVal),
                child: Text(
                  _start.toString(),
                  style: TextStyle(
                    fontSize: 60,
                    color: pink3.withValues(alpha: 1.0),
                  ),
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

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  ////////////////////////////////////////////////////////////////////////////////FUNCTIONS///////////////////
  ///// get 3rd step depending on the day
  String _skinCycle() {
    switch (DateTime.now().weekday) {
      case DateTime.monday:
        return "Retinal 💦";
      case DateTime.tuesday:
        return "Exfoliate🧽 + \n    Vitamin C🍊";
      case DateTime.wednesday:
        return "Serum💧";
      case DateTime.thursday:
        return "Retinal💦";
      case DateTime.friday:
        return "Exfoliate🧽 +  \n    Vitamin C🍊";
      case DateTime.saturday:
        return "Serum💧";
      case DateTime.sunday:
        return "Serum💧";
      default:
        return "If you're seeing this text, the app is broke💖";
    }
  }

  void startTimer() {
    setState(() {
      isButtonVis = false;
    });
    const intervalOneSec = Duration(seconds: 1);
    _timer = Timer.periodic(intervalOneSec, (Timer timer) {
      if (_start == 1) {
        setState(() {
          isButtonVis = true;
          playSound();
          timer.cancel();
          _start = 60;
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  void playSound() async {
    final player = AudioPlayer();
    await player.play(AssetSource("sounds/japanese-eas-alarm.mp3"));
  }
}
