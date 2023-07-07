import 'style.dart';

TextStyle primaryFont = GoogleFonts.montaga();

TextStyle secondaryFont(TextStyle textStyle) =>
    GoogleFonts.pacifico(textStyle: textStyle);

TextTheme getTextTheme(ColorScheme colorScheme) {
  return TextTheme(
    displayLarge: primaryFont.copyWith(color: colorScheme.primary),
    displayMedium: primaryFont.copyWith(color: colorScheme.primary),
    displaySmall: primaryFont.copyWith(color: colorScheme.primary),

    headlineLarge: primaryFont.copyWith(),
    headlineMedium: primaryFont.copyWith(),
    headlineSmall: primaryFont.copyWith(),

    labelLarge: primaryFont.copyWith(),
    labelMedium: primaryFont.copyWith(),
    labelSmall: primaryFont.copyWith(),

    titleLarge: primaryFont.copyWith(color: colorScheme.onPrimaryContainer),
    titleMedium: primaryFont.copyWith(color: colorScheme.onPrimaryContainer),
    titleSmall: primaryFont.copyWith(color: colorScheme.onPrimaryContainer),

    bodyLarge: primaryFont.copyWith(color: colorScheme.onPrimaryContainer),
    bodyMedium: primaryFont.copyWith(color: colorScheme.onPrimaryContainer),
    bodySmall: primaryFont.copyWith(color: colorScheme.onPrimaryContainer),
  );
}
