import 'package:flutter/material.dart';

import 'app.dart';
import 'flavors.dart';
import 'locator.dart';

Future<void> main() async {
  F.appFlavor = Flavor.STAGING;
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(App());
}
