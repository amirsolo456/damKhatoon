import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:khatoon_container/app_notifier.dart';
import 'package:khatoon_container/core/components/app_bar/main_app_bar.dart';
import 'package:khatoon_container/core/components/menu/presentation/widgets/menu.dart';
import 'package:khatoon_container/core/components/pages/home/presentation/home_page.dart';
import 'package:khatoon_container/injection_container.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InjectionContainer.init();
  await Hive.initFlutter();
  runApp(
    ChangeNotifierProvider(
      lazy: true,
      create: (context) => AppNotifier(),
      child: Consumer<AppNotifier>(
        builder: (context, notifier, child) {
          return MaterialApp(
            title: 'App with Global Notifier',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: notifier.themeConfig.primaryColor,
                brightness: Brightness.light,
              ),
              useMaterial3: true,
            ),
            darkTheme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: notifier.themeConfig.primaryColor,
                brightness: Brightness.dark,
              ),
              useMaterial3: true,
            ),
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
    final notifier = Provider.of<AppNotifier>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar:const PreferredSize(
        preferredSize: const Size.fromHeight(72),
        child: SafeArea(
          child: MainAppBar( ),
        ),
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
    );
  }
}
