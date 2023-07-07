import 'style.dart';

class ThemeDataBuilder {
  ThemeData light() {
    ColorScheme colorScheme = lightColorScheme;

    return ThemeData.light().copyWith(
      colorScheme: colorScheme,
      textTheme: getTextTheme(colorScheme),
      useMaterial3: true,
    );
  }

  ThemeData dark() {
    ColorScheme colorScheme = darkColorScheme;

    return ThemeData.light().copyWith(
      colorScheme: colorScheme,
      textTheme: getTextTheme(colorScheme),
      useMaterial3: true,
    );
  }
}
