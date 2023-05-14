part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class AppTabBar extends AppState {}

class ChangeBottomNavBar extends AppState {}

class ChangeTabBarPages extends AppState {}
