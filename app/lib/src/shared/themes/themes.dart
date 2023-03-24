import 'package:flutter/material.dart';
part 'color_schemes.g.dart';

ThemeData get lightTheme => ThemeData(
      useMaterial3: true,
      colorScheme: _lightColorScheme,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: _lightColorScheme.primaryContainer,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: _lightColorScheme.primary,
        foregroundColor: _lightColorScheme.onPrimary,
      ),
      segmentedButtonTheme: segmentButton,
    );

ThemeData get darkTheme => ThemeData(
      useMaterial3: true,
      colorScheme: _darkColorScheme,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: _darkColorScheme.primaryContainer,
      ),
      segmentedButtonTheme: segmentButton,
    );

SegmentedButtonThemeData get segmentButton => SegmentedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.selected)) {
              return const TextStyle(fontSize: 10);
            }
            return const TextStyle(fontSize: 12);
          },
        ),
      ),
    );
