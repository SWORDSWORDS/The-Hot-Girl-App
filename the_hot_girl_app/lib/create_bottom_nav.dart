//IMPORTS///////////////////////////////////////////////////////////////////////
import 'package:flutter/material.dart';
import 'theme_color_palette.dart';

//CLASSES///////////////////////////////////////////////////////////////////////
//BottomNav is Stateful. It calls on _BottomNavState
class BottomNav extends StatefulWidget {
  final int
  initialIndex; //determines which icon the bottom navigator will start on

  //constructor
  const BottomNav(this.initialIndex, {super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
} //end of BottomNav

//_BottomNavState returns a BottomNavigatorBar that makes the UI for the bottom menu
// ignore: camel_case_types
class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 1; //start the app with the 'Home' icon highlighted

  @override
  Widget build(BuildContext context) {
    _selectedIndex = widget.initialIndex;

    //makes the UI for the bottom menu
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(Icons.arrow_back),
          label: 'Arrow Back',
        ),
        //create the 'Home' icon
        BottomNavigationBarItem(
          icon: const Icon(Icons.home_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.arrow_forward),
          label: 'Arrow Forward',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: pinkWhite.withValues(alpha: 1.0),
      unselectedItemColor: pinkWhite.withValues(alpha: 1.0),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: pink2.withValues(alpha: 1.0),
      onTap: _onItemTapped,
    );
  }

  //FUNCTIONS///////////////////////////////////////////////////////////////////
  //when an icon is tapped, highlight the tapped icon and change _selectedIndex to the highlighted icon's index
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    //depending on the current value for _selectedIndex, navigate to the highlighted icon's corresponding page
    switch (_selectedIndex) {
      case 0:
        Navigator.pushNamed(context, 'home');
        break;
      case 1:
        Navigator.pushNamed(context, 'home');
        break;
      case 2:
        Navigator.pushNamed(context, 'home');
        break;
    }
  }
} //end of _BottomNavState

//END OF create_bottom_nav.dart/////////////////////////////////////////////////
