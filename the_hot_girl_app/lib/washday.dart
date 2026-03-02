//IMPORTS///////////////////////////////////////////////////////////////////////
import 'package:the_hot_girl_app/theme_color_palette.dart';
import 'create_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//CLASSES////////////////////////////////////////////////////////////////////
class Washday extends StatefulWidget {
  const Washday({super.key});

  final String title = "Washday💆🏿‍♀️";

  @override
  State<Washday> createState() => _Washday();
}

class _Washday extends State<Washday> {
  //declare variables
  int initialIndex = 0;
  String step9Result = "Leave-in Conditioner 🍯";
  String step1Result = "Shampoo w/ wigcap🧼🪥";
  String step2Result = "Condition w/ wigcap💧🪥";
  String step3Result = "Blowdry♨️";
  String step4Result = "Leave-in Conditioner Spray🍯";
  String step5Result = "Mousse Scalp☁️";
  String step6Result = "Durag🎀";
  String step7Result = "Steamer(showercap and durag)💨";
  Color textColor = pink2.withValues(alpha: 1.0);
  bool isButtonVis = true;

  @override
  Widget build(BuildContext context) {
    //padVal is the value for how much padding is around each button.
    const double padVal = 20;
    const double fontSizeVal = 30.0;
    String step1 = "1. $step1Result";
    String step2 = "2. $step2Result";
    String step3 = "3. $step3Result";
    String step4 = "4. $step4Result";
    String step5 = "5. $step5Result";
    String step6 = "6. $step6Result";
    String step7 = "7. $step7Result";

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
                  "Washday💆🏿‍♀️",
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
                  step1,
                  style: TextStyle(color: textColor, fontSize: fontSizeVal),
                ),
              ),

              //step 2
              Padding(
                padding: const EdgeInsets.all(0),
                child: Text(
                  step2,
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
                  step4,
                  style: TextStyle(color: textColor, fontSize: fontSizeVal),
                ),
              ),

              //step 5
              Padding(
                padding: const EdgeInsets.all(0),
                child: Text(
                  step5,
                  style: TextStyle(color: textColor, fontSize: fontSizeVal),
                ),
              ),

              //step 6
              Padding(
                padding: const EdgeInsets.all(0),
                child: Text(
                  step6,
                  style: TextStyle(color: textColor, fontSize: fontSizeVal),
                ),
              ),

              //step 7
              Padding(
                padding: const EdgeInsets.all(0),
                child: Text(
                  step7,
                  style: TextStyle(color: textColor, fontSize: fontSizeVal - 2),
                ),
              ),

              //Big Washday Button
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
                        "Do Big Washday",
                        style: TextStyle(
                          fontSize: 30,
                          color: butter.withValues(alpha: 1.0),
                        ),
                      ),
                      //when the button is pressed, change washday instructions
                      onPressed: () => _bigWashDay(),
                    ),
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

  ////////////////////////////////////////////////////////////////////////////////FUNCTIONS///////////////////
  ///// change steps to be for big wash day
  void _bigWashDay() {
    setState(() {
      step1Result = "Detangle🤍";
      step2Result = "Shampoo🧼";
      step3Result = "Clay Mask🌿";
      step4Result = " Condition💧";
      step5Result = "Blowdry♨️";
      step6Result = "Leave-in Conditioner 🍯";
      step7Result = "Blue Magic💙";
      isButtonVis = false;
    });
  }
}
