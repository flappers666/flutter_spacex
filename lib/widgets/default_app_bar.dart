import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spacex/views/constants/text_styles.dart';
import 'package:flutter_spacex/views/constants/ui_colors.dart';
import 'package:go_router/go_router.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final void Function()? backFunc;
  const DefaultAppBar({required this.title, this.backFunc, super.key});

  @override
  Widget build(BuildContext context) => AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: const Color(UiColors.background),
        title: Text(title, style: TextStyles.heading()),
        leading: backFunc != null
            ? IconButton(
                icon: const Icon(Icons.chevron_left),
                iconSize: 30,
                onPressed: backFunc)
            : null,
      );

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
