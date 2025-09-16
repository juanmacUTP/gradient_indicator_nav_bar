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

  /// The color of the icon. Defaults to 'Colors.white',
  final Color iconColor;

  /// The color of the selected icon. Defaults to grey with opacity.
  final Color selectedIconColor;

  /// The size of the icons. Defaults to 30.
  final double iconSize;

  /// The height of the selection indicator. Defaults to `4.0`.
  final double indicatorHeight;

  /// The color of the indicator.
  /// Defaults to `Colors.white` if null.
  final Color? indicatorColor;

  /// The text style of the item labels.
  ///
  /// Defaults to `TextStyle(color: Colors.white)` if null.
  final TextStyle? textStyle;


  /// Creates a gradient bottom navigation bar with indicator support.
  ///
  /// The argument [items] must not be null and must have at least two items.
  ///
  /// If [gradient], [indicatorColor], [textStyle], or [height] are null,
  /// then their [GradientIndicatorNavBarTheme] values will be used. If the
  /// corresponding [GradientIndicatorNavBarTheme] property is null, then
  /// the default specified in the property's documentation will be used.
  ///
  /// The [currentIndex] argument must not be null and must be a valid index of [items].
  /// The [onChanged] callback is triggered when a new item is tapped.
  ///
  /// Typically used in the [Scaffold.bottomNavigationBar] property.
  ///
  const CustomNavBar({super.key,
    required this.items,
    this.onChanged,
    this.gradient,
    this.height = 60.0,
    this.iconColor = Colors.white,
    this.selectedIconColor = Colors.grey,
    this.iconSize = 30,
    this.indicatorHeight = 4.0,
    this.indicatorColor = Colors.white,
    this.textStyle
  });


  @override
  Widget build(BuildContext context) {
    bool iOS = Platform.isIOS;

    final controller = context.watch<NavBarController>();

    return Container(
      height: height,
      decoration: BoxDecoration(
        gradient: gradient,
      ),
      padding: const EdgeInsets.all(4),
      child: Padding(
        padding: iOS ? const EdgeInsets.only(bottom: 12.0, top: 4) : const EdgeInsets.all(8),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;
            final isSelected = controller.selectedIndex == index;

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
                    color: isSelected ? selectedIconColor.withAlpha(90) : iconColor,
                    size: iconSize,
                  ),
                  if(item.label != null)
                  Text(
                    item.label ?? '',
                    style: textStyle ??
                      const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                  ),
                  if (isSelected)
                    Container(
                      margin: const EdgeInsets.only(top: 2),
                      height: indicatorHeight,
                      width: 48,
                      color: indicatorColor,
                    )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}