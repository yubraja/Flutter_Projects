import 'package:flutter/material.dart';
import './pages/third_page.dart';
import 'package:provider/provider.dart';
import './Providers/Data.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Data()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color.fromRGBO(189, 158, 255, 1),
          buttonTheme: ButtonThemeData(
            buttonColor: Color.fromRGBO(36, 1, 92, 1),
          )),
      home: ThirdPage(),
    );
  }
}
