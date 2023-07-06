import 'style.dart';

TextStyle primaryFont = GoogleFonts.combo();
TextStyle secondaryFont(TextStyle textStyle) => GoogleFonts.pacifico(textStyle: textStyle);

final TextTheme textTheme = TextTheme(
  displayLarge: primaryFont.copyWith(fontWeight: FontWeight.w100),
  displayMedium: primaryFont.copyWith(fontWeight: FontWeight.w100),
  displaySmall: primaryFont.copyWith(fontWeight: FontWeight.w100),

  headlineLarge: primaryFont.copyWith(fontWeight: FontWeight.w100),
  headlineMedium: primaryFont.copyWith(fontWeight: FontWeight.w100),
  headlineSmall: primaryFont.copyWith(fontWeight: FontWeight.w100),

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
