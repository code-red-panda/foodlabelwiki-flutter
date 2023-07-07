import 'shared.dart';

class InfoSnackBar{
  const InfoSnackBar();

  static show(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        //backgroundColor: styles.colors.edit,
        content: Text(message),
      ));
  }
}

class ErrorSnackBar {
  const ErrorSnackBar();

  static show(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        //backgroundColor: styles.colors.error,
        content: Text(message),
      ));
  }
}