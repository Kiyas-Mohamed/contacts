import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contacts/home_screen.dart';
import 'package:contacts/widgets/theme_widget.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppTheme(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppTheme>(
      builder: (context, theme, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme.currentTheme,
        home: const MyHomeScreen(),
      ),
    );
  }
}
