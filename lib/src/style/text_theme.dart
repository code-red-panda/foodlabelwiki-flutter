import 'style.dart';

TextStyle primaryFont = GoogleFonts.montaga();

TextStyle secondaryFont(TextStyle textStyle) =>
    GoogleFonts.pacifico(textStyle: textStyle);

TextTheme getTextTheme(ColorScheme colorScheme) {
  return TextTheme(
    displayLarge: primaryFont.copyWith(color: colorScheme.primary),
    displayMedium: primaryFont.copyWith(color: colorScheme.primary),
    displaySmall: primaryFont.copyWith(color: colorScheme.primary),

    headlineLarge: primaryFont.copyWith(color: colorScheme.onBackground),
    headlineMedium: primaryFont.copyWith(color: colorScheme.onBackground),
    headlineSmall: primaryFont.copyWith(color: colorScheme.onBackground),

    labelLarge: primaryFont.copyWith(color: colorScheme.onBackground),
    labelMedium: primaryFont.copyWith(color: colorScheme.onBackground),
    labelSmall: primaryFont.copyWith(color: colorScheme.onBackground),

    titleLarge: primaryFont.copyWith(color: colorScheme.onPrimaryContainer),
    titleMedium: primaryFont.copyWith(color: colorScheme.onPrimaryContainer),
    titleSmall: primaryFont.copyWith(color: colorScheme.onPrimaryContainer),

    bodyLarge: primaryFont.copyWith(color: colorScheme.onBackground),
    bodyMedium: primaryFont.copyWith(color: colorScheme.onBackground),
    bodySmall: primaryFont.copyWith(color: colorScheme.onBackground),
  );
}
