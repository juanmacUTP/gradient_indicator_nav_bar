import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'nav_bar_item.dart';
import 'nav_bar_controller.dart';

class CustomNavBar extends StatelessWidget {
  /// The navigation items to display. Must not be null and must contain at least two items.
  final List<NavBarItem> items;

  /// Called when a new item is tapped.
  final ValueChanged<int>? onChanged;

  /// The background gradient of the navigation bar.
  ///
  /// Defaults to a [LinearGradient] with blue and green if null.
  final Gradient? gradient;

  /// The height of the navigation bar. Defaults to `60.0`.
  final double height;

  /// The color of the icon. Defaults to 'Colors.grey',
  final Color iconColor;

  /// The color of the selected icon. Defaults to white.
  final Color selectedIconColor;

  /// The size of the icons. Defaults to `30`.
  final double iconSize;

  /// The height of the selection indicator. Defaults to `4.0`.
  final double indicatorHeight;

  /// The color of the indicator.
  /// Defaults to `Colors.white` if null.
  final Color indicatorColor;

  /// The color of the item labels.
  ///
  /// Defaults to `Colors.grey` if null.
  final Color textColor;

  /// The color of the selected item labels.
  ///
  /// Defaults to `Colors.white` if null.
  final Color selectedTextColor;

  /// The size of the item label.
  ///
  /// Defaults to `12.0` if null.
  final double fontSize;

  const CustomNavBar({
    super.key,
    required this.items,
    this.onChanged,
    this.gradient = const LinearGradient(colors: [Colors.blue, Colors.green]),
    this.height = 80.0,
    this.iconColor = Colors.grey,
    this.selectedIconColor = Colors.white,
    this.iconSize = 30,
    this.indicatorHeight = 4.0,
    this.indicatorColor = Colors.white,
    this.textColor = Colors.grey,
    this.selectedTextColor = Colors.white,
    this.fontSize = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    bool iOS = Platform.isIOS;

    final controller = context.watch<NavBarController>();

    return Container(
      height: height,
      decoration: BoxDecoration(gradient: gradient),
      padding: const EdgeInsets.all(4),
      child: Padding(
        padding: iOS
            ? const EdgeInsets.only(bottom: 12.0, top: 4)
            : const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items.asMap().entries.map((entry) {
            int index = entry.key;
            NavBarItem item = entry.value;
            bool isSelected = controller.selectedIndex == index;

            return InkWell(
              onTap: () {
                controller.updateIndex(index);
                onChanged?.call(index);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    item.icon,
                    color: isSelected
                        ? selectedIconColor
                        : iconColor,
                    size: isSelected ? iconSize + 5 : iconSize,
                  ),
                  if (item.label != null)
                    Text(
                      item.label ?? '',
                      style: TextStyle(
                        color: isSelected ? selectedTextColor : textColor,
                        fontSize: isSelected ? fontSize : fontSize,
                      ),
                    ),
                  if (isSelected)
                    Container(
                      margin: const EdgeInsets.only(top: 2),
                      height: indicatorHeight,
                      width: 48,
                      color: indicatorColor,
                    ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
