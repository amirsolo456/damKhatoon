import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khatoon_container/core/components/menu/domain/entities/menu_item.dart';
import 'package:provider/provider.dart';
import 'package:khatoon_container/app_notifier.dart';

class ExpandableMenu extends StatelessWidget {
  final bool isRail;
  const ExpandableMenu({super.key, required this.isRail});

  Widget _buildMenuItem(
    BuildContext context,
    MenuItem item,
    AppNotifier notifier,
  ) {
    final hasChildren = item.children?.isNotEmpty ?? false;
    final isExpanded = notifier.isExpanded(item.id);
    final isSelected = notifier.selectedItemId == item.id;
    final sidebarCollapsed = notifier.sidebarCollapsed;
    return Column(
      children: [
        // Main Menu Item
        Container(
          // constraints: const BoxConstraints(minWidth: 20),
          padding: const EdgeInsets.all(0),

          // margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: isSelected
                ? Theme.of(context).colorScheme.primary.withAlpha(100)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: isSelected
                ? Border.all(
                    color: Theme.of(context).colorScheme.primary.withAlpha(300),
                    width: 1,
                  )
                : null,
          ),
          child: Material(
            type: MaterialType.transparency,
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: hasChildren
                  ? () => notifier.toggleExpanded(item.id)
                  : () {
                      notifier.selectItem(item.id);
                      if (!isRail) Navigator.pop(context);
                    },
              child: Container(
                // constraints: const BoxConstraints(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    // آیکون
                    Container(
                      width: 36,
                      height: 36,
                      alignment: Alignment.center,
                      // constraints: const BoxConstraints(),
                      child: SafeArea(
                        minimum: const EdgeInsets.all(1),
                        child: Icon(
                          item.icon.icon,
                          size: 20,
                          color: isSelected
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(
                                  context,
                                ).colorScheme.onSurface.withAlpha(500),
                        ),
                      ),
                    ),

                    // متن (در حالت collapsed مخفی می‌شود)
                    if (!sidebarCollapsed) ...[
                      // const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          item.label,
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style: TextStyle(
                            overflow: TextOverflow.fade,

                            fontSize: 14,
                            fontWeight: isSelected
                                ? FontWeight.w600
                                : FontWeight.w400,
                            color: isSelected
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ),

                      // فلش برای آیتم‌های دارای فرزند
                      if (hasChildren) ...[
                        AnimatedRotation(
                          curve: Curves.easeInOut,
                          duration: const Duration(milliseconds: 300),
                          turns: isExpanded ? 0.5 : 0,
                          child: !sidebarCollapsed
                              ? SafeArea(
                                  minimum: const EdgeInsets.all(1),
                                  child: Icon(
                                    Icons.arrow_drop_down,
                                    applyTextScaling: true,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurface.withAlpha(200),
                                  ),
                                )
                              :const SizedBox(),
                        ),
                      ],
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),

        // زیرمنوها (در حالت collapsed مخفی می‌شوند)
        if (hasChildren && !sidebarCollapsed)
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: SizedBox(
              height: isExpanded ? null : 0,
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: item.children!.map((child) {
                    return _buildChildItem(context, child, notifier);
                  }).toList(),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildChildItem(
    BuildContext context,
    MenuItem child,
    AppNotifier notifier,
  ) {
    final isChildSelected = notifier.selectedItemId == child.id;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(left: 36, right: 12, bottom: 4),
      decoration: BoxDecoration(
        color: isChildSelected
            ? Theme.of(context).colorScheme.primary.withAlpha(100)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          hoverColor: Colors.black38,
          borderRadius: BorderRadius.circular(6),
          onTap: () {
            notifier.selectItem(child.id);
            if (!isRail) Navigator.pop(context);
          },
          child:  Container(
            height: 30,
            // constraints: const BoxConstraints(minWidth: 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              spacing: 10,
              children: [
                SafeArea(
                  minimum: const EdgeInsets.all(1),
                  child:  Icon(
                     child.icon.icon,
                    size: 16,
                    color: isChildSelected
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(
                            context,
                          ).colorScheme.onSurface.withAlpha(700),
                  ),
                ),
                Expanded(
                  child: Text(
                    child.label,
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                      height: 0.9,
                      fontSize: 13,
                      overflow: TextOverflow.fade,
                      fontWeight: isChildSelected
                          ? FontWeight.w500
                          : FontWeight.w400,
                      color: isChildSelected
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(
                              context,
                            ).colorScheme.onSurface.withAlpha(900),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context, AppNotifier notifier) {
    final sidebarCollapsed = notifier.sidebarCollapsed;

    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Theme.of(context).dividerColor.withAlpha(900)),
        ),
      ),
      child: sidebarCollapsed
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SafeArea(
                  minimum: const EdgeInsets.all(1),
                  child: IconButton(
                    onPressed: notifier.toggleSidebar,
                    icon: Icon(
                      Icons.menu_open,
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withAlpha(900),
                    ),
                    padding: EdgeInsets.zero,
                    // constraints: const BoxConstraints(),
                  ),
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                const Spacer(),
                SafeArea(
                  minimum: const EdgeInsets.all(1),
                  child: IconButton(
                    onPressed: notifier.toggleSidebar,
                    icon: Icon(
                      Icons.menu,
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withAlpha(400),
                    ),
                    tooltip: 'کوچک کردن منو',
                  ),
                ),

                if (notifier.userName != null)
                  SafeArea(
                    child: IconButton(
                      onPressed: notifier.logout,
                      icon: Icon(
                        Icons.logout,
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withAlpha(400),
                      ),
                      tooltip: 'خروج',
                    ),
                  ),
              ],
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<AppNotifier>(context);
    final sidebarCollapsed = notifier.sidebarCollapsed;

    return Consumer<AppNotifier>(
      builder: (context, notifier, child) {
        final menuItems = notifier.menuItems;
        final menuContent = Column(
          children: [
            const SizedBox(height: 16, width: 1),
            Expanded(
              child: MouseRegion(
                onEnter: (event) {
                  notifier.sidebarManually(false);
                },
                onExit: (event) {
                  notifier.sidebarManually(true);
                },
                child: CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      sliver: SliverList(
                        key: const Key('silver'),
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return _buildMenuItem(
                              context,
                              notifier.menuItems[index],
                              notifier,
                            );
                          },
                          addAutomaticKeepAlives: true,
                          childCount: notifier.menuItems.length,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            _buildFooter(context, notifier),
          ],
        );
        if (!isRail) {
          return Drawer(width: 280, child: SafeArea(child: menuContent));
        }
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInCirc,
          width: sidebarCollapsed ? 85 : 280,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border(
              right: BorderSide(
                color: Theme.of(context).dividerColor.withAlpha(50),
                width: 1,
              ),
            ),
          ),
          child: menuContent,
        );
      },
    );
  }
}
