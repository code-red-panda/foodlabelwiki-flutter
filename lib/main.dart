import '/src/libs.dart';

Future<void> main() async {
  
  final AuthRepo authRepo = AuthRepo();


  runApp(MyAppProvider(authRepo: authRepo));

}
