import 'package:flutter/material.dart';
import 'package:flutter_spacex/views/constants/text_styles.dart';
import 'package:flutter_spacex/views/constants/ui_colors.dart';
import 'package:flutter_spacex/widgets/default_app_bar.dart';
import 'package:go_router/go_router.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: const DefaultAppBar(title: 'Info'),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: UiColors.defaultRadialGradient,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: Text(
                'Just playing about with Flutter and the SpaceX API!',
                style: TextStyles.body(),
              ),
            )
          ],
        ),
      ));
}
