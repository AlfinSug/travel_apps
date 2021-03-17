import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_apps/api/CRUDModel.dart';
import 'package:travel_apps/locater.dart';
import 'package:travel_apps/screen/router_page.dart';

void main() {
  setUpLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => locator<CRUDModel>()),
      ],
      child: MaterialApp(
        initialRoute: '/',
        title: 'Travel Apps',
        theme: ThemeData(
          primaryColor: Color(0xFF3EBACE),
          accentColor: Color(0xFFD8ECF1),
          scaffoldBackgroundColor: Color(0xFFF3F5F7),
        ),
        onGenerateRoute: Router.generateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
