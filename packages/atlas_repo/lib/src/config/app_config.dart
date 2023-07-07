import 'atlas_config.dart';
import 'package:realm/realm.dart';

AppConfiguration appConfig = AppConfiguration(
  atlas.appId,
  baseUrl: Uri.parse(atlas.baseUrl),
);
