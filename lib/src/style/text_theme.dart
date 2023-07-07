import 'style.dart';

TextStyle primaryFont = GoogleFonts.combo();
TextStyle secondaryFont(TextStyle textStyle) => GoogleFonts.pacifico(textStyle: textStyle);

final TextTheme textTheme = TextTheme(
  displayLarge: primaryFont.copyWith(),
  displayMedium: primaryFont.copyWith(),
  displaySmall: primaryFont.copyWith(),

  headlineLarge: primaryFont.copyWith(),
  headlineMedium: primaryFont.copyWith(),
  headlineSmall: primaryFont.copyWith(),

  labelLarge: primaryFont.copyWith(),
  labelMedium: primaryFont.copyWith(),
  labelSmall: primaryFont.copyWith(),

  titleLarge: primaryFont.copyWith(),
  titleMedium: primaryFont.copyWith(),
  titleSmall: primaryFont.copyWith(),

  bodyLarge: primaryFont.copyWith(),
  bodyMedium: primaryFont.copyWith(),
  bodySmall: primaryFont.copyWith(),
);
