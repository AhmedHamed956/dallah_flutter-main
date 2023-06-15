import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:dallah/core/config/locator.dart';
import 'package:dallah/view/ui/home/home_page.dart';
import 'package:dallah/viewModel/auth_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:provider/provider.dart';
import 'core/config/translate_preference.dart';
import 'core/constants/app_theme.dart';
import 'core/constants/strings.dart';
import 'view/index.dart';

void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: AppColors.primaryColor,
    statusBarIconBrightness: Brightness.dark,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  var delegate =
      await LocalizationDelegate.create(preferences: TranslatePreferences(), fallbackLocale: 'en', supportedLocales: ['en', 'ar']);

  runApp(LocalizedApp(delegate, MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    changeLocale(context, 'ar');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;
    log('${localizationDelegate.supportedLocales}', name: '${this} # locale');
    return LocalizationProvider(
      state: LocalizationProvider.of(context).state,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthViewModel>(
            create: (BuildContext context) => AuthViewModel(),
          ),
        ],
        child: MaterialApp(
          title: Strings.appName,
          theme: themeData,
          home: HomePage(),
          builder: BotToastInit(),
          navigatorObservers: [BotToastNavigatorObserver()],
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            localizationDelegate
          ],
          supportedLocales: localizationDelegate.supportedLocales,
          locale: localizationDelegate.currentLocale,
        ),
      ),
    );
  }
}
