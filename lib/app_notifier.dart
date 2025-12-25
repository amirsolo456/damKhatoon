// ==================== GLOBAL NOTIFIER ====================
import 'package:flutter/material.dart';
import 'package:khatoon_container/core/base/domain/entities/theme_config.dart';
import 'package:khatoon_container/core/components/menu/domain/entities/menu_item.dart';
import 'package:khatoon_container/core/components/pages/home/presentation/home_page.dart';
import 'package:khatoon_container/core/components/pages/profile/presentation/profile_page.dart';
import 'package:khatoon_container/core/components/pages/settings/presentation/settings_page.dart';
import 'package:khatoon_container/core/components/pages/sign_in/presentation/sign_in_page.dart';
import 'package:khatoon_container/features/purchase/presentation/pages/create_purchase_page.dart';
import 'package:khatoon_container/features/purchase/presentation/pages/purchase_list_page.dart';

class AppNotifier extends ChangeNotifier {
  // Navigation State
  final List<MenuItem> _MenuItems = <MenuItem>[
    MenuItem(
      id: 'home',
      pageIndex: 0,
      label: 'خانه',
      icon:const Icon(IconData(fontFamily: 'assets/user_profile.png',0xe800 )),
      routeName: '/home',
    ),
    MenuItem(
      pageIndex: 1,
      id: 'products',
      label: 'محصولات',
      icon:const Icon(IconData(fontFamily: 'assets/user_profile.png',0xe800 )),
      children: <MenuItem>[
        MenuItem(
          pageIndex: 0,
          id: 'all_products',
          label: 'همه محصولات',
          icon:const Icon(IconData(fontFamily: 'assets/user_profile.png',0xe800 )),
          routeName: '/products',
        ),
        MenuItem(
          pageIndex: 1,
          id: 'categories',
          label: 'دسته‌بندی‌ها',
          icon:const Icon(IconData(fontFamily: 'assets/user_profile.png',0xe800 )),
          routeName: '/categories',
        ),
        MenuItem(
          pageIndex: 2,
          id: 'inventory',
          label: 'موجودی انبار',
          icon:const Icon(IconData(fontFamily: 'assets/user_profile.png',0xe800 )),
          routeName: '/inventory',
        ),
      ],
    ),
    MenuItem(
      pageIndex: 2,
      id: 'orders',
      label: 'سفارشات',
      icon:const Icon(IconData(fontFamily: 'assets/user_profile.png',0xe600,fontPackage:'assets/user_profile.png' ,matchTextDirection: true ),size: 16,),
      children: <MenuItem>[
        MenuItem(
          pageIndex: 0,
          id: 'pending_orders',
          label: 'در انتظار تایید',
          icon:const Icon(IconData(fontFamily: 'assets/chart.png',0xe800 )),
          routeName: '/orders/pending',
        ),
        MenuItem(
          pageIndex: 1,
          id: 'completed_orders',
          label: 'تکمیل شده',
          icon:const Icon(IconData(fontFamily: 'assets/user_profile.png',0xe800 )),
          routeName: '/orders/completed',
        ),
      ],
    ),
    MenuItem(
      pageIndex: 3,
      id: 'customers',
      label: 'مشتریان',
      icon:const Icon(IconData(fontFamily: 'assets/user_profile.png',0xe800 )),

      routeName: '/customers',
    ),
    MenuItem(
      pageIndex: 4,
      id: 'reports',
      label: 'گزارشات',
      icon:const Icon(IconData(fontFamily: 'assets/user_profile.png',0xe800 )),
      routeName: '/reports',
    ),
    MenuItem(
      label: 'پرداخت',
      icon:const Icon(IconData(fontFamily: 'assets/user_profile.png',0xe800 )),
      pageIndex: 5,
      id: 'purchases',
      routeName: '/purchase/purchaseListPage',
    ),
    MenuItem(
      pageIndex: 6,
      id: 'settings',
      label: 'تنظیمات',
      icon:const Icon(IconData(fontFamily: 'assets/user_profile.png',0xe800 )),
      children: <MenuItem>[
        MenuItem(
          pageIndex: 0,
          id: 'profile',
          label: 'پروفایل',
          icon:const Icon(IconData(fontFamily: 'assets/user_profile.png',0xe800 )),
          routeName: '/settings/profile',
          page: const SettingsPage(),
        ),
        MenuItem(
          pageIndex: 1,
          id: 'security',
          label: 'امنیت',
          icon:const Icon(IconData(fontFamily: 'assets/user_profile.png',0xe800 )),
          routeName: '/settings/security',
          page: const SettingsPage(),
        ),
        MenuItem(
          pageIndex: 2,
          id: 'notifications',
          label: 'اعلان‌ها',
          icon:const Icon(IconData(fontFamily: 'assets/user_profile.png',0xe800 )),
          routeName: '/settings/notifications',
          page: const SettingsPage(),
        ),
      ],
    ),
    MenuItem(
      pageIndex: 7,
      id: 'signIn',
      label: 'خروج',
      icon:const Icon(IconData(fontFamily: 'assets/user_profile.png',0xe800 )),
      routeName: '/signIn',
    ),
  ];


  Future<void>  showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  // Navigation State
  final Map<String, bool> _expandedStates = <String, bool>{};
  String? _selectedItemId;
  String? _currentRoute;
  bool _sidebarCollapsed = false;
  bool get sidebarCollapsed => _sidebarCollapsed;
  // Theme State
  ThemeConfig _themeConfig = ThemeConfig();

  // UI State
  bool _isLogin =false;
  bool _isDrawerOpen = false;
  bool _isLoading = false;
  String? _errorMessage;

  // User State
  String? _userName;
  String? _userEmail;
  String? _userRole;

  // ==================== GETTERS ====================
  void toggleSidebar() {
    _sidebarCollapsed = !_sidebarCollapsed;
    notifyListeners();
  }

  void  sidebarManually(bool state) {
    if(_sidebarCollapsed != state){
      _sidebarCollapsed =state;
      notifyListeners();
    }
  }

  void setSidebarCollapsed(bool collapsed) {
    _sidebarCollapsed = collapsed;
    notifyListeners();
  }

  void changeToLogin(bool loginState) {
    _isLogin = loginState;
    notifyListeners();
  }

  List<MenuItem> get menuItems => _MenuItems;

  bool get isLogin => _isLogin;

  ThemeConfig get themeConfig => _themeConfig;

  bool get isDrawerOpen => _isDrawerOpen;

  bool get isLoading => _isLoading;

  String? get errorMessage => _errorMessage;

  String? get userName => _userName;

  String? get userEmail => _userEmail;

  String? get userRole => _userRole;

  String? get selectedItemId => _selectedItemId;

  String? get currentRoute => _currentRoute;

  // Helper methods
  MenuItem? findItemById(String id) {
    MenuItem? findInList(List<MenuItem> items) {
      for (MenuItem item in items) {
        if (item.id == id) return item;
        if (item.children != null) {
          final MenuItem? found = findInList(item.children!);
          if (found != null) return found;
        }
      }
      return null;
    }

    return findInList(_MenuItems);
  }

  bool isExpanded(String itemId) => _expandedStates[itemId] ?? false;

  bool isSelected(String itemId) => _selectedItemId == itemId;

  MenuItem? get selectedItem {
    if (_selectedItemId == null) return null;
    return findItemById(_selectedItemId!);
  }

  // ==================== NAVIGATION METHODS ====================
  void toggleExpanded(String itemId) {
    _expandedStates[itemId] = !isExpanded(itemId);
    notifyListeners();
  }

  void selectItem(String itemId, {bool closeDrawer = true}) {
    final MenuItem? item = findItemById(itemId);
    if (item == null) return;

    _selectedItemId = itemId;
    _currentRoute = item.routeName;

    if (closeDrawer) {
      _isDrawerOpen = false;
    }

    notifyListeners();
  }

  void navigateTo(String routeName) {
    _currentRoute = routeName;
    notifyListeners();
  }

  void goBack() {
    // Logic for going back in navigation history
    notifyListeners();
  }

  Widget? getCurrentPage(BuildContext context) {
    if (_selectedItemId == null) return const HomePage();

    final MenuItem? item = findItemById(_selectedItemId!);
    if (item == null) return const HomePage();

    // اولویت با pageBuilder است
    if (item.page != null) {
      return item.page;
    }

    // سپس با page مستقیم
    if (item.page != null) {
      return item.page!;
    }

    switch (item.routeName) {
      case '/home':
        return const ProfilePage();
      case '/products':
        return const ProfilePage();
      case '/categories':
        return const ProfilePage();
      case '/inventory':
        return const ProfilePage();
      case '/orders/pending':
        return const ProfilePage();
      case '/orders/completed':
        return const ProfilePage();
      case '/customers':
        return const ProfilePage();
      case '/reports':
        return const ProfilePage();
      case '/settings/profile':
        return const ProfilePage();
      case '/settings/security':
        return const ProfilePage();
      case '/settings/notifications':
        return const ProfilePage();
      case '/purchase/purchaseListPage':
        return const PurchaseListPage();
      case '/purchase/createPurchasePage':
        return const CreatePurchasePage();
      case '/signIn':
        return const SignInPage();
      default:
        return const ProfilePage();
    }
  }

  // ==================== THEME METHODS ====================
  void toggleTheme() {
    _themeConfig = _themeConfig.copyWith(
      themeMode: _themeConfig.themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light,
    );
    notifyListeners();
  }

  void setThemeMode(ThemeMode mode) {
    _themeConfig = _themeConfig.copyWith(themeMode: mode);
    notifyListeners();
  }

  void updatePrimaryColor(Color color) {
    _themeConfig = _themeConfig.copyWith(primaryColor: color);
    notifyListeners();
  }

  void updateSecondaryColor(Color color) {
    _themeConfig = _themeConfig.copyWith(secondaryColor: color);
    notifyListeners();
  }

  // ==================== UI STATE METHODS ====================
  void toggleDrawer() {
    _isDrawerOpen = !_isDrawerOpen;
    notifyListeners();
  }

  void setDrawerOpen(bool isOpen) {
    _isDrawerOpen = isOpen;
    notifyListeners();
  }

  void setLoading(bool loading) {
    _isLoading = loading;
    if (!loading) {
      _errorMessage = null;
    }
    notifyListeners();
  }

  void setError(String? message) {
    _errorMessage = message;
    notifyListeners();
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  // ==================== USER METHODS ====================
  void updateUserInfo({String? name, String? email, String? role}) {
    _userName = name ?? _userName;
    _userEmail = email ?? _userEmail;
    _userRole = role ?? _userRole;
    notifyListeners();
  }

  void logout() {
    _userName = null;
    _userEmail = null;
    _userRole = null;
    _selectedItemId = null;
    _currentRoute = '/home';
    _expandedStates.clear();
    notifyListeners();
  }

  void resetAll() {
    _expandedStates.clear();
    _selectedItemId = null;
    _currentRoute = '/home';
    _themeConfig = ThemeConfig();
    _isDrawerOpen = false;
    _isLoading = false;
    _errorMessage = null;
    _userName = null;
    _userEmail = null;
    _userRole = null;
    notifyListeners();
  }
}
