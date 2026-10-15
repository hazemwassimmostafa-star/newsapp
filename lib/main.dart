import 'package:flutter/material.dart';
import 'package:newsapp/l10n/app_localizations.dart';
import 'package:newsapp/common/localization/language_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/common/themes/app_theme.dart';
import 'package:newsapp/common/themes/theme_provider.dart';
import 'package:newsapp/screens/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
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
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: Size(393, 852),
      builder: (context, child) => MaterialApp(
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: context.watch<ThemeProvider>().themeMode,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        locale: context.watch<LanguageProvider>().locale,
        supportedLocales: AppLocalizations.supportedLocales,
        home: MainScreen(),
      ),
    );
  }
}
