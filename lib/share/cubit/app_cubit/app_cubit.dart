import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screens/news/home_news_screen.dart';
import 'package:news_app/screens/news/news_screens/arab_news_screen.dart';
import 'package:news_app/screens/news/news_screens/business_screen.dart';
import 'package:news_app/screens/news/news_screens/health_screen.dart';
import 'package:news_app/screens/news/news_screens/science_screen.dart';
import 'package:news_app/screens/news/news_screens/sport_screen.dart';
import 'package:news_app/screens/news/news_screens/technology_screen.dart';
import 'package:news_app/screens/news/news_screens/world_news_screen.dart';
import 'package:news_app/screens/setting/setting_screen.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);

  int navBarCurrentIndex = 0;
  int tabBatCurrentIndex = 0;
  bool isDark = false;
  List<Widget> screens = [NewsHomePage(), SettingPage()];
  List<String> screenTitle = ["Last News", "Settings"];
  List<IconData> screenIcon = [Icons.newspaper, Icons.settings];

  List<BottomNavigationBarItem> navBarItems = [
    BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: "News Home"),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
  ];
  List<String> tabBarItems = [
    "Hot World News",
    "Hot Arab News",
    "Business",
    "Sport",
    "Technology",
    "Health",
    "Science",
  ];
  List<Widget> tabBarView = [
    WorldNewsPage(),
    ArabNewsPage(),
    BusinessNewsPage(),
    SportNewsPage(),
    TechnologyNewsPage(),
    HealthNewsPage(),
    ScienceNewsPage()
  ];



  void changeTabBar(int index) {
    tabBatCurrentIndex = index;
    emit(ChangeTabBarPages());
  }

  void changeBottomNavBar(int index) {
    navBarCurrentIndex = index;
    emit(ChangeBottomNavBar());
  }

  bool switchThemes(){
    isDark = !isDark;
    emit(ChangeAppTheme());
    return isDark;
  }
}
