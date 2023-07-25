

import 'package:flutter/material.dart';
import 'package:lobor/helper/constant.dart';
import 'package:lobor/home/presentation/pages/profile_screen.dart';
import '../widgets/navigation_screen.dart';
import 'Categories_screen.dart';
import 'history_screen.dart';
import 'home_screen.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key, this.ZrawerController}) : super(key: key);
  static const  route='/mainScreen';
  final ZrawerController;
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex=0;
  List <NavigationButtonScreens> screens = <NavigationButtonScreens>
  [
    const  NavigationButtonScreens(title:'Home', body: HomeScreen()),
    const  NavigationButtonScreens(title:'History', body:HistoryScreen()),
    const  NavigationButtonScreens(title:'Categories', body:CategoriesScreen()),
    const  NavigationButtonScreens(title:'Profile', body:ProfileScreen()),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar:BottomNavigationBar(
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon:Icon(Icons.home_outlined),
            activeIcon:Icon(Icons.home_filled),
            label: ""
          ),
          BottomNavigationBarItem(
              icon:Icon(Icons.history_edu_outlined),
              activeIcon:Icon(Icons.history_edu),
              label: ''
          ),
          BottomNavigationBarItem(
              icon:Icon(Icons.category_outlined),
              activeIcon:Icon(Icons.category),
              label: ''
          ),
          BottomNavigationBarItem(
              icon:Icon(Icons.person_outlined),
              activeIcon:Icon(Icons.person),
              label: ''
          ),

        ],
        onTap:(index){
          setState(() {
            currentIndex = index;
          });
        },
        showSelectedLabels:false,
        currentIndex: currentIndex,
        selectedFontSize:13,
        unselectedFontSize:12,
        selectedItemColor:AppColor.primary,
        unselectedItemColor:AppColor.gray400,
      ),
      body: Stack(children: [
        screens[currentIndex].body ,
      ],),


    );
  }
}