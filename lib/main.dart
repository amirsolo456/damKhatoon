import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:khatoon_container/app_notifier.dart';
import 'package:khatoon_container/core/components/app_bar/main_app_bar.dart';
import 'package:khatoon_container/core/components/menu/presentation/widgets/menu.dart';
import 'package:khatoon_container/core/components/pages/home/presentation/home_page.dart';
import 'package:khatoon_container/core/components/pages/sign_in/presentation/sign_in_page.dart';
import 'package:khatoon_container/core/storage/cache_manager/presentation/cache_manager.dart';
import 'package:khatoon_container/core/storage/local_storage/sqlite/data/repositories/sqlite_provider.dart';
import 'package:khatoon_container/features/user/data/data_sources/user_local_data_source.dart';
import 'package:khatoon_container/injection_container.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InjectionContainer.init();
  await Hive.initFlutter();
  // WidgetsFlutterBinding.ensureInitialized();
  // await LocalDatabase.createDatabase();
  // final user = sl<UserLocalDataSource>();
  //  user.getAllUsers();
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppNotifier(),
      child: Consumer<AppNotifier>(
        builder: (context, notifier, child) {
          return MaterialApp(
            title: 'App with Global Notifier',
            debugShowCheckedModeBanner: false,
            supportedLocales: [const Locale('fa'), const Locale('en')],
            locale: const Locale('fa'),
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            localeResolutionCallback: (locale, supportedLocales) {
              for (var supportedLocale in supportedLocales) {
                if (supportedLocale.languageCode == locale?.languageCode) {
                  return supportedLocale;
                }
              }
              return supportedLocales.first;
            },
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: notifier.themeConfig.primaryColor,
                brightness: Brightness.light,
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

@Preview(name: 'widget_preview_scaffold')
class MainAppScreen extends StatelessWidget {
  const MainAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<AppNotifier>(context);
    final isRTL = Localizations.localeOf(context).languageCode == 'fa';

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
                children: [
                  // Navigation Bar
                  const ExpandableMenu(isRail: true),
                  // Main Content
                  Expanded(
                    child: Column(
                      children: [
                        if (notifier.errorMessage != null)
                          Container(
                            color: Colors.red.withAlpha(1),
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: [
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
                            builder: (context, notifier, child) {
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
