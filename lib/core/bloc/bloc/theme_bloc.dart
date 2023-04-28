import 'package:dark_mode_flutter/core/constants/enum.dart';
import 'package:dark_mode_flutter/core/storage/main_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  ThemeBloc() : super(ThemeData.light()) {
    on<InitialThemeSetEvent>((event, emit) async {
      final bool hasDarkTheme = await isDark();
      if (hasDarkTheme) {
        emit(ThemeData.dark());
      } else {
        emit(ThemeData.light());
      }
    });

    //while switch is clicked
    on<ThemeSwitchEvent>((event, emit) {
      final isDark = state == ThemeData.dark();
      emit(isDark ? ThemeData.light() : ThemeData.dark());
      setTheme(isDark);
    });
  }
}

Future<bool> isDark() async {
  /* final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool(DARKMODE) ?? false; */
  return darkmode.get(DARKMODE) ?? false;
}

Future<void> setTheme(bool isDark) async {
  /* final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool(DARKMODE, !isDark); */
  darkmode.put(DARKMODE, !isDark);
}
