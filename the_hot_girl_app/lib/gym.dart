//IMPORTS///////////////////////////////////////////////////////////////////////
import 'package:the_hot_girl_app/theme_color_palette.dart';
import 'create_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:week_number/western_traditional.dart';

//CLASSES////////////////////////////////////////////////////////////////////
class Gym extends StatefulWidget {
  const Gym({super.key});

  final String title = "Gym 🔥";

  @override
  State<Gym> createState() => _Gym();
}

class _Gym extends State<Gym> {
  //declare variables
  int initialIndex = 0;
  Color textColor = pink3.withValues(alpha: 1.0);
  Color underlineColor = pink2.withValues(alpha: 1.0);
  bool isButtonVis = true;
  bool isWeek1 = false;
  bool isWeek2 = false;
  Uri urlVariable = Uri();
  String variableTitle = "";
  String title = "";

  @override
  Widget build(BuildContext context) {
    //padVal is the value for how much padding is around each button.
    const double padVal = 10;
    const double fontSizeVal = 30.0;
    final Uri urlWarmUp = Uri.parse(
      'https://youtu.be/eQHmKJh20_c?si=l1oqGS3yw5Em-7_q',
    );

    final Uri urlCoolDown = Uri.parse(
      'https://youtu.be/GVZZi-Gth_M?si=oFLNV7L1QY1hfzZ1',
    );
    isWeek1 = DateTime.now().weekNumber % 2 != 0;
    isWeek2 = DateTime.now().weekNumber % 2 == 0;
    if (isWeek1) {
      title = "It's Week 1!  🤍";
    }
    if (isWeek2) {
      title = "It's Week 2!  🎧";
    }
    setVariables();

    //scaffold that makes the UI for the homepage
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //Title Text
              Padding(
                padding: const EdgeInsets.all(padVal),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.allura(
                    fontSize: 55.0,
                    color: pink2.withValues(alpha: 1.0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              //step 1
              Padding(
                padding: const EdgeInsets.all(padVal),
                child: InkWell(
                  child: Text(
                    '1. Warm Up🔥',
                    style: TextStyle(
                      fontSize: fontSizeVal,
                      color: textColor,
                      decoration: TextDecoration.underline,
                      decorationColor: underlineColor,
                      decorationStyle: TextDecorationStyle.dotted,
                    ),
                  ),
                  onTap: () => launchUrl(urlWarmUp),
                ),
              ),

              //step 2
              Padding(
                padding: const EdgeInsets.all(padVal),
                child: InkWell(
                  child: Text(
                    variableTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: fontSizeVal,
                      color: textColor,
                      decoration: TextDecoration.underline,
                      decorationColor: underlineColor,
                      decorationStyle: TextDecorationStyle.dotted,
                    ),
                  ),
                  onTap: () => launchUrl(urlVariable),
                ),
              ),

              //step 3
              Padding(
                padding: const EdgeInsets.all(0),
                child: Text(
                  "3. 30 minutes Cardio 🫀",
                  style: TextStyle(color: textColor, fontSize: fontSizeVal),
                ),
              ),

              //step 4
              Padding(
                padding: const EdgeInsets.all(padVal),
                child: InkWell(
                  child: Text(
                    "4. Cool Down❄️",
                    style: TextStyle(
                      fontSize: fontSizeVal,
                      color: textColor,
                      decoration: TextDecoration.underline,
                      decorationColor: underlineColor,
                      decorationStyle: TextDecorationStyle.dotted,
                    ),
                  ),
                  onTap: () => launchUrl(urlCoolDown),
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

  ////////////////////////////////////////////////////////////////////////////////FUNCTIONS///////////////////
  void setVariables() {
    var curWeekDay = DateTime.now().weekday;
    if ((isWeek1 && curWeekDay == DateTime.monday) ||
        (isWeek2 && curWeekDay == DateTime.wednesday)) {
      variableTitle = "2. Pelvic Floor and Deep Core🎯";
      urlVariable = Uri.parse(
        "https://www.youtube.com/watch?v=Ip7wrGxqQhM&list=PLdMxZwVjwc1g6M0MKODDWxwBFJOG8aVYM&index=2",
      );
    } else if ((isWeek1 && curWeekDay == DateTime.wednesday) ||
        (isWeek2 && curWeekDay == DateTime.monday)) {
      variableTitle = "2. Arms and Glutes💪🏿🍑";
      urlVariable = Uri.parse(
        "https://docs.google.com/document/d/1dKPetoAVJamVREPZ3_Cx1GoVXNf_vIxQ0GxVp1eJIAg/edit?tab=t.0",
      );
    } else {
      variableTitle =
          "2. It's not a gym day gorg, but click here for all workouts 💅🏿✨";
      urlVariable = Uri.parse(
        "https://youtube.com/playlist?list=PLdMxZwVjwc1g6M0MKODDWxwBFJOG8aVYM&si=KE2SeFwiLsDwahJ3",
      );
    }
  }
}
