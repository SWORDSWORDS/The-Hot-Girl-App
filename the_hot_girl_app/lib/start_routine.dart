//IMPORTS///////////////////////////////////////////////////////////////////////
import 'package:the_hot_girl_app/theme_color_palette.dart';
import 'create_bottom_nav.dart';
import 'package:flutter/material.dart';

//CLASSES////////////////////////////////////////////////////////////////////
class StartRoutine extends StatefulWidget {
  const StartRoutine({super.key});

  final String title = "🎀Pick a Routine🎀";

  @override
  State<StartRoutine> createState() => _StartRoutine();
}

class _StartRoutine extends State<StartRoutine> {
  int _counter = 30;
  String buttonMessage = 'Tap the button to start!';
  Color buttonColor = pink1.withValues(alpha: 1.0);
  bool _buttonUnpressed = false;
  bool merpoCalled = false;
  Row myButtons = const Row();

  void _decreaseCounter() async {
    Route routeArgs = ModalRoute.of(context)!;

    while (_buttonUnpressed && !merpoCalled && routeArgs.isCurrent) {
      setState(() {
        buttonMessage = 'Hold down until you reach your destination.';
        buttonColor = pink2.withValues(alpha: 1.0);
        if (_counter > 0) {
          _counter--;
        }
        if (_counter == 0) {
          callMerpo(context);
        }
      });

      // wait a second
      await Future.delayed(const Duration(milliseconds: 1000));
    }

    while (!_buttonUnpressed) {
      setState(() {
        buttonMessage = "You are holding the button.";
        buttonColor = pink2.withValues(alpha: 1.0);
      });

      // wait a second
      await Future.delayed(const Duration(milliseconds: 1000));
    }
  }

  Row makeButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(15),
          child: ElevatedButton(
            onPressed: () => callMerpo(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: butter.withValues(alpha: 1.0),
            ),
            child: const Text('CALL MERPO'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, 'home'),
            style: ElevatedButton.styleFrom(
              backgroundColor: pinkBlack.withValues(alpha: 1.0),
            ),
            child: const Text('Return to Home Page'),
          ),
        ),
      ],
    );
  }

  void callMerpo(BuildContext context) {
    merpoCalled = true;
  }

  @override
  Widget build(BuildContext context) {
    double contSize = 300;
    myButtons = makeButtons();
    int initialIndex = 0;

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Seconds: $_counter',
                style: TextStyle(
                  fontSize: 40.0,
                  color: butter.withValues(alpha: 1.0),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Listener(
              onPointerDown: (details) {
                _buttonUnpressed = false;
                _counter = 30; //reset timer when user presses down
              },
              onPointerUp: (details) {
                _buttonUnpressed = true;
                _decreaseCounter();
              },
              child: Container(
                width: contSize,
                height: contSize,
                decoration: BoxDecoration(
                  color: buttonColor,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    buttonMessage,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: butter.withValues(alpha: 1.0),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),

            const Padding(padding: EdgeInsets.all(15)),

            _buttonUnpressed
                ? Visibility(visible: true, child: myButtons)
                : Visibility(visible: false, child: myButtons), //ternary
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(initialIndex),
    );
  }
}
