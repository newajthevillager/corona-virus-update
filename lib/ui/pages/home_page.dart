import 'package:corona_live/res/colors/app_colors.dart';
import 'package:corona_live/ui/pages/corona_countries.dart';
import 'package:corona_live/ui/pages/corona_summary_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int current_tab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.darkBg,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            current_tab = index;
          });
        },
        currentIndex: current_tab,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.border_all),
            title: Text("Summary"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list),
            title: Text("Countries"),
          ),
        ],
        selectedIconTheme: IconThemeData(
          color: Colors.white,
        ),
        selectedItemColor: Colors.white,
        unselectedIconTheme: IconThemeData(
          color: Colors.grey[700],
        ),
        unselectedItemColor: Colors.grey[700],
      ),
      body: IndexedStack(
        children: <Widget>[
          CoronaSummaryPage(),
          CoronaCountries(),
        ],
        index: current_tab,
      ),
    );
  }
}