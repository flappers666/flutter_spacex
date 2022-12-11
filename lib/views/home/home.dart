import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spacex/views/constants/ui_colors.dart';
import 'package:flutter_spacex/views/constants/ui_fonts.dart';
import 'package:flutter_spacex/views/home/bloc/home_bloc.dart';
import 'package:flutter_spacex/views/home/bloc/home_event.dart';
import 'package:flutter_spacex/views/home/bloc/home_state.dart';

import '../launches/launches.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    const navBarItems = [
      BottomNavigationBarItem(
        icon: Icon(Icons.rocket_launch),
        label: 'Launches',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.rocket),
        label: 'Rockets',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.info),
        label: 'Info',
      ),
    ];

    var items = [];
    for (int i = 0; i < 20; i++) {
      items.add('hello');
    }

    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: const Color(UiColors.palette5),
          title: const Text(
            'SpaceX',
            style: TextStyle(
              fontFamily: UiFonts.headerFont,
              fontWeight: FontWeight.bold,
              color: Color(UiColors.contrastingLight),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: navBarItems,
          currentIndex: state.selectedTabIndex,
          selectedItemColor: const Color(UiColors.contrastingLight),
          unselectedItemColor: const Color(UiColors.contrastingMid),
          backgroundColor: const Color(UiColors.palette1),
          onTap: (int tabIndex) =>
              context.read<HomeBloc>().add(TabSelected(tabIndex: tabIndex)),
        ),
        body: IndexedStack(
          children: [
            Launches(),
            Container(),
            Container(),
          ],
        ),
      );
    });
  }
}
