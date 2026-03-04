import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tok_tik/config/app_theme.dart';
import 'package:tok_tik/presentation/providers/discover_provider.dart';
import 'package:tok_tik/presentation/screens/discover/discover_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DiscoverProvider()..loadNextPage(),
        ),
      ],
      child: MaterialApp(
        theme: AppTheme().getTheme(),
        title: 'Tok Tik',
        debugShowCheckedModeBanner: false,
        home: DiscoverScreen(),
      ),
    );
  }
}
