import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khatoon_container/app_notifier.dart';
import 'package:provider/provider.dart';

class MainAppBar extends StatefulWidget {


  const MainAppBar({super.key });

  @override
  State<MainAppBar> createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  bool sidebarToggle = false;
  bool menuToggle = false;

  // breakpoints (approx like Tailwind)

  static const double sm = 640;
  static const double lg = 1024;
  static const double xl = 1280;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final notifier = Provider.of<AppNotifier>(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final isXL = width >= xl;
        final showSearch =
            width >=
            lg; // per HTML: search hidden on small, visible on xl:block => visible from lg+
        // HTML shows search in a div hidden xl:block -> that means visible on xl and up.
        // To be flexible we show from lg; change to isXL if you want strictly only xl.

        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: isXL ? 0 : 12,
            vertical: isXL ? 16 : 12,
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: isXL
                  ? BorderSide.none
                  : BorderSide(
                      color: isDark ? Colors.grey[800]! : Colors.grey[200]!,
                    ),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (notifier.isLoading)
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                ),
              IconButton(
                onPressed: () => notifier.toggleTheme(),
                icon: Icon(
                  notifier.themeConfig.themeMode == ThemeMode.dark
                      ? Icons.light_mode
                      : Icons.dark_mode,
                ),
              ),

              // GestureDetector(
              //   onTap: _toggleSidebar,
              //   child: Container(
              //     height: isXL ? 44 : 40,
              //     width: isXL ? 44 : 40,
              //     decoration: BoxDecoration(
              //       color: sidebarToggle
              //           ? Colors.transparent
              //           : (isDark ? Colors.grey[850] : Colors.grey[100]),
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     margin: const EdgeInsets.only(right: 8),
              //     child: Center(
              //       child: AnimatedSwitcher(
              //         duration: const Duration(milliseconds: 180),
              //         transitionBuilder: (child, anim) =>
              //             FadeTransition(opacity: anim, child: child),
              //         child: sidebarToggle
              //             ? Icon(
              //                 Icons.close,
              //                 key: const ValueKey('close'),
              //                 size: isXL ? 16 : 20,
              //                 color: isDark
              //                     ? Colors.grey[300]
              //                     : Colors.grey[700],
              //               )
              //             : (isXL
              //                   ? Icon(
              //                       Icons.view_headline,
              //                       key: const ValueKey('xl_hamburger'),
              //                       size: 16,
              //                       color: isDark
              //                           ? Colors.grey[300]
              //                           : Colors.grey[700],
              //                     )
              //                   : Icon(
              //                       Icons.menu,
              //                       key: const ValueKey('menu'),
              //                       size: 20,
              //                       color: isDark
              //                           ? Colors.grey[300]
              //                           : Colors.grey[700],
              //                     )),
              //       ),
              //     ),
              //   ),
              // ),

              // Logo (visible only when NOT XL) -> html: class="xl:hidden"
              if (!isXL)
                GestureDetector(
                  onTap: () {
                    // navigate to home if needed
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: SizedBox(
                      height: 28,
                      child: Image.asset(
                        isDark ? 'assets/logo_dark.png' : 'assets/logo.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),

              // Application nav menu button (visible only on small screens in HTML - xl:hidden)
              // if (!isXL)
              //   GestureDetector(
              //     onTap: _toggleSidebar,
              //     child: Container(
              //       margin: const EdgeInsets.only(right: 8),
              //       height: 40,
              //       width: 40,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(10),
              //       ),
              //       child: Center(
              //         child: Icon(
              //           Icons.apps_rounded,
              //           size: 20,
              //           color: isDark ? Colors.grey[300] : Colors.grey[700],
              //         ),
              //       ),
              //     ),
              //   ),

              // Spacer between left controls and search (matches justify-between)
              const SizedBox(width: 8),
              // Expanded takes the rest of the space to align search/other items to center/right
              Expanded(
                child: Row(
                  mainAxisAlignment: isXL
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.spaceBetween,
                  children: [
                    // If you want some left content on XL, put here. In original HTML left of search is the toggles/logo.
                    // We keep a flexible spacer so search sits in middle-left like original.
                    if (isXL) const SizedBox(width: 8),

                    // Search form - visible on xl in HTML. Here we show for lg+ (adjust if needed).
                    if (showSearch)
                      SizedBox(
                        width: isXL ? 430 : 300,
                        child: _buildSearchField(context, isDark),
                      ),

                    // Right side: you can put user avatar, icons, etc. For parity with HTML we leave it empty or add small gap.
                    if (!showSearch) const Spacer(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSearchField(BuildContext context, bool isDark) {
    return SizedBox(
      height: 44,
      child: TextField(
        style: TextStyle(
          color: isDark ? Colors.white.withOpacity(0.9) : Colors.grey[900],
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: isDark ? Colors.grey[900] : Colors.transparent,
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 12, right: 8),
            child: Icon(
              Icons.search,
              size: 20,
              color: isDark ? Colors.grey[400] : Colors.grey[500],
            ),
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 40,
            minHeight: 40,
          ),
          hintText: 'Search or type command...',
          hintStyle: TextStyle(
            color: isDark ? Colors.white.withOpacity(0.3) : Colors.grey[400],
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: isDark ? Colors.grey[800]! : Colors.grey[200]!,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: isDark ? Colors.grey[800]! : Colors.grey[200]!,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.blue.withOpacity(0.6),
              width: 1.5,
            ),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 6.0),
            child: ElevatedButton(
              onPressed: () {
                // you can hook up shortcut or command palette open
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(56, 32),
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                elevation: 0,
                backgroundColor: isDark
                    ? Colors.white.withOpacity(0.02)
                    : Colors.grey[50],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    color: isDark ? Colors.grey[800]! : Colors.grey[200]!,
                  ),
                ),
                foregroundColor: isDark ? Colors.grey[300] : Colors.grey[600],
              ),
              child:const Row(
                mainAxisSize: MainAxisSize.min,
                children:   [
                  Text('⌘', style: TextStyle(fontSize: 12, height: 1.0)),
                  SizedBox(width: 4),
                  Text('K', style: TextStyle(fontSize: 12, height: 1.0)),
                ],
              ),
            ),
          ),
          // to remove default suffix padding
          suffixIconConstraints: const BoxConstraints(minWidth: 72),
        ),
      ),
    );
  }
}
