import 'package:anons_dao/services/anons_service.dart';
import 'package:anons_dao/theme/theme.dart';
import 'package:anons_dao/views/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  await AnonsService().setup();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anons dao',
      theme: AnonsTheme.anonsDark,
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
