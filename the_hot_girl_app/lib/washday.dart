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
  Color textColor = pink2.withValues(alpha: 1.0);
  bool isButtonVis = true;

  @override
  Widget build(BuildContext context) {
    //padVal is the value for how much padding is around each button.
    const double padVal = 20;
    const double fontSizeVal = 35.0;
    String step9 = "9. $step9Result";

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
                  "1. Uninstall 🤍",
                  style: TextStyle(color: textColor, fontSize: fontSizeVal),
                ),
              ),

              //step 2
              Padding(
                padding: const EdgeInsets.all(0),
                child: Text(
                  "2. Detangle 🌿",
                  style: TextStyle(color: textColor, fontSize: fontSizeVal),
                ),
              ),

              //step 3
              Padding(
                padding: const EdgeInsets.all(0),
                child: Text(
                  "2. Shampoo 🧼",
                  style: TextStyle(color: textColor, fontSize: fontSizeVal),
                ),
              ),

              //step 4
              Padding(
                padding: const EdgeInsets.all(0),
                child: Text(
                  "4. Rinse 💧",
                  style: TextStyle(color: textColor, fontSize: fontSizeVal),
                ),
              ),

              //step 5
              Padding(
                padding: const EdgeInsets.all(0),
                child: Text(
                  "5. Conditioner 🧴",
                  style: TextStyle(color: textColor, fontSize: fontSizeVal),
                ),
              ),

              //step 6
              Padding(
                padding: const EdgeInsets.all(0),
                child: Text(
                  "6. Steamer 💨",
                  style: TextStyle(color: textColor, fontSize: fontSizeVal),
                ),
              ),

              //step 7
              Padding(
                padding: const EdgeInsets.all(0),
                child: Text(
                  "7. Rinse 💧",
                  style: TextStyle(color: textColor, fontSize: fontSizeVal),
                ),
              ),

              //step 8
              Padding(
                padding: const EdgeInsets.all(0),
                child: Text(
                  "8. Blowdry♨️",
                  style: TextStyle(color: textColor, fontSize: fontSizeVal),
                ),
              ),

              //step 9
              Padding(
                padding: const EdgeInsets.all(0),
                child: Text(
                  step9,
                  style: TextStyle(color: textColor, fontSize: fontSizeVal),
                ),
              ),

              //step 10
              Padding(
                padding: const EdgeInsets.all(0),
                child: Text(
                  "10. Blue Magic💙",
                  style: TextStyle(color: textColor, fontSize: fontSizeVal),
                ),
              ),

              //Are We Adding Heat Button
              Visibility(
                visible: isButtonVis,
                child: GestureDetector(
                  onDoubleTap: () => _useHeat(),
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
                          "Use Heat",
                          style: TextStyle(
                            fontSize: 30,
                            color: butter.withValues(alpha: 1.0),
                          ),
                        ),
                        //when the button is pressed, go to the Daily Todo page
                        onPressed: () => _useHeat,
                      ),
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
  ///// change 9th step for using heat
  void _useHeat() {
    setState(() {
      step9Result = "Heat Protectant + \n     Heat♨️♨️";
      isButtonVis = false;
    });
  }
}
