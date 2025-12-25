import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:khatoon_container/app_notifier.dart';
import 'package:khatoon_container/core/components/app_bar/main_app_bar.dart';
import 'package:khatoon_container/core/components/menu/presentation/widgets/menu.dart';
import 'package:khatoon_container/core/components/pages/home/presentation/home_page.dart';
import 'package:khatoon_container/core/components/pages/sign_in/presentation/sign_in_page.dart';
import 'package:khatoon_container/injection_container.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InjectionContainer.init();
  await Hive.initFlutter();
  // final user = sl<UserLocalDataSource>();
  //  user.getAllUsers();
  runApp(
      ChangeNotifierProvider(
      lazy: false,
      create: (BuildContext context) => AppNotifier(),
      child: Consumer<AppNotifier>(
        builder: (BuildContext context, AppNotifier notifier, Widget? child) {
          return MaterialApp(
            title: 'App with Global Notifier',
            debugShowCheckedModeBanner: false,
            supportedLocales: <Locale>[const Locale('fa'), const Locale('en')],
            locale: const Locale('fa'),
            localizationsDelegates: <LocalizationsDelegate<dynamic>>[
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            localeResolutionCallback: (Locale? locale, Iterable<Locale> supportedLocales) {
              for (Locale supportedLocale in supportedLocales) {
                if (supportedLocale.languageCode == locale?.languageCode) {
                  return supportedLocale;
                }
              }
              return supportedLocales.first;
            },
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: notifier.themeConfig.primaryColor,
              ),
              useMaterial3: true,
              fontFamily: 'Vazir',
            ).copyWith(scaffoldBackgroundColor: Colors.white),
            darkTheme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: notifier.themeConfig.primaryColor,
                brightness: Brightness.dark,
              ),
              useMaterial3: true,
              fontFamily: 'Vazir',
            ).copyWith(scaffoldBackgroundColor: Colors.grey[900]),
            themeMode: notifier.themeConfig.themeMode,
            home: const MainAppScreen(),
          );
        },
      ),
    ),
  );
}

class MainAppScreen extends StatelessWidget {
  const MainAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppNotifier notifier = Provider.of<AppNotifier>(context);
    final bool isRTL = Localizations.localeOf(context).languageCode == 'fa';

    return Directionality(
      textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
      child: (notifier.isLogin
          ? const SignInPage()
          : Scaffold(
              backgroundColor: Colors.white,
              appBar: const PreferredSize(
                preferredSize: Size.fromHeight(72),
                child: SafeArea(child: MainAppBar()),
              ),
              body: Row(
                children: <Widget>[
                  // Navigation Bar
                  const ExpandableMenu(isRail: true),
                  // Main Content
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        if (notifier.errorMessage != null)
                          Container(
                            color: Colors.red.withAlpha(1),
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: <Widget>[
                                const Icon(Icons.error, color: Colors.red),
                                const SizedBox(width: 8),
                                Expanded(child: Text(notifier.errorMessage!)),
                                IconButton(
                                  onPressed: notifier.clearError,
                                  icon: const Icon(Icons.close),
                                ),
                              ],
                            ),
                          ),
                        Expanded(
                          child: Consumer<AppNotifier>(
                            builder: (BuildContext context, AppNotifier notifier, Widget? child) {
                              return notifier.getCurrentPage(context) ??
                                  const HomePage();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
    );
  }
}
