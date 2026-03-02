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

  final String title = "Skincare🌿";

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
    String step4 = "4. $skinCycleResult";

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
                "Skincare🌿",
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
                "2. Kojic Acid & Turmeric💛",
                style: TextStyle(color: textColor, fontSize: fontSizeVal),
              ),
            ),

            //step 3
            Padding(
              padding: const EdgeInsets.all(0),
              child: Text(
                "3. Azelaic Acid Serum 🧪",
                style: TextStyle(color: textColor, fontSize: fontSizeVal),
              ),
            ),

            //step 4
            Padding(
              padding: const EdgeInsets.all(0),
              child: Text(
                step4,
                style: TextStyle(color: textColor, fontSize: fontSizeVal),
              ),
            ),

            //step 5
            Padding(
              padding: const EdgeInsets.all(0),
              child: Text(
                "5. Moisturizer ✨",
                style: TextStyle(color: textColor, fontSize: fontSizeVal),
              ),
            ),

            //step 6
            Padding(
              padding: const EdgeInsets.all(0),
              child: Text(
                "6. Aquaphor 🐌",
                style: TextStyle(color: textColor, fontSize: fontSizeVal),
              ),
            ),

            //step 7
            Padding(
              padding: const EdgeInsets.all(0),
              child: Text(
                "7. Niacinamide Body Lotion🐇",
                style: TextStyle(color: textColor, fontSize: fontSizeVal - 2),
              ),
            ),

            // timer Button
            Visibility(
              visible: isButtonVis,
              child: Padding(
                padding: const EdgeInsets.all(padVal),
                child: GestureDetector(
                  onDoubleTap: () => startToothTimer(),
                  child: SizedBox(
                    height: 100,
                    width: 300,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: pink2.withValues(alpha: 1.0),
                        foregroundColor: textColor,
                      ),
                      child: Text(
                        "Start Timer",
                        style: TextStyle(
                          fontSize: 30,
                          color: butter.withValues(alpha: 1.0),
                        ),
                      ),
                      //when the button is pressed, go to the Daily Todo page
                      onPressed: () => startSkincareTimer(),
                    ),
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
        return "Rest Day💧";
      case DateTime.thursday:
        return "Retinal💦";
      case DateTime.friday:
        return "Exfoliate🧽 +  \n    Vitamin C🍊";
      case DateTime.saturday:
        return "Rest Day💧";
      case DateTime.sunday:
        return "Rest Day💧";
      default:
        return "If you're seeing this text, the app is broke💖";
    }
  }

  void startSkincareTimer() {
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

  void startToothTimer() {
    setState(() {
      isButtonVis = false;
    });
    _start = 120;
    const intervalOneSec = Duration(seconds: 1);
    _timer = Timer.periodic(intervalOneSec, (Timer timer) {
      if (_start == 1) {
        setState(() {
          isButtonVis = true;
          playSound();
          timer.cancel();
          _start = 60;
        });
      } else if (_start == 100 ||
          _start == 80 ||
          _start == 60 ||
          _start == 40 ||
          _start == 20) {
        setState(() {
          playSound();
          _start--;
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
