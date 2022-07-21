import 'package:flutter/material.dart';
import 'interface/router.dart';
import 'interface/views/startup/startup_view.dart';
import 'locator.dart';
import 'services/navigation_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();
  runApp(const ImGood());
}

class ImGood extends StatelessWidget {
  const ImGood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "I'm Good",
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: const StartupView(),
      navigatorKey: locator<NavigationService>().navigationKey,
      onGenerateRoute: generateRoute,
    );
  }
}
