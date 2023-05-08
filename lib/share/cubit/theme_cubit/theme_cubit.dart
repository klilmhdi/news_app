import 'package:bloc/bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  bool isDark = false;

  void switchTheme(){
    isDark = !isDark;
    emit(ChangeAppTheme());
  }
}
