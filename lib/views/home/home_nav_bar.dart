import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spacex/views/constants/app_routes.dart';
import 'package:flutter_spacex/views/constants/text_styles.dart';
import 'package:flutter_spacex/views/constants/ui_colors.dart';
import 'package:flutter_spacex/views/constants/ui_fonts.dart';
import 'package:go_router/go_router.dart';

class HomeNavBar extends StatelessWidget {
  final Widget child;

  const HomeNavBar({
    required this.child,
    Key? key,
  }) : super(key: key);

  int _selectedIndex(BuildContext context) {
    String location = GoRouterState.of(context).location;
    int index = 0;
    if (location.startsWith(AppRoutes.launches)) {
      index = 0;
    } else if (location.startsWith(AppRoutes.rockets)) {
      index = 1;
    }
    return index;
  }

  void _switchTab(BuildContext context, int index) {
    if (index == _selectedIndex(context)) {
      return;
    }

    switch (index) {
      case 0:
        context.go(AppRoutes.launches);
        break;
      case 1:
        context.go(AppRoutes.rockets);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          backgroundColor: const Color(UiColors.background),
          labelTextStyle: MaterialStateProperty.all(TextStyles.body()),
          iconTheme: MaterialStateProperty.all(
            const IconThemeData(
              color: Color(UiColors.contrastingLight),
            ),
          ),
        ),
        child: NavigationBar(
            destinations: const [
              NavigationDestination(
                  icon: Icon(Icons.rocket_launch), label: 'Launches'),
              NavigationDestination(icon: Icon(Icons.rocket), label: 'Rockets'),
              NavigationDestination(icon: Icon(Icons.info), label: 'Info'),
            ],
            selectedIndex: _selectedIndex(context),
            onDestinationSelected: (int index) => _switchTab(context, index)),
      ),
      body: child,
    );
  }
}
