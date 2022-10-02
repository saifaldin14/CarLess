import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goldenhack/pages/marketplace.dart';
import 'package:goldenhack/pages/profileAvatar.dart';
import 'package:goldenhack/themes.dart';
import 'package:goldenhack/utils/user_preferences.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

AppBar buildAppBar(BuildContext context) {
  final isDarkMode = Theme.of(context).brightness == Brightness.dark;
  final icon = MdiIcons.moonWaningCrescent;

  return AppBar(
    leading: BackButton(),
    backgroundColor: Colors.blue,
    elevation: 0,
    actions: [
      IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => MarketPlace()),
            );
          },
          icon: Icon(MdiIcons.shopping)),
      ThemeSwitcher(
        builder: (context) => IconButton(
          icon: Icon(icon),
          onPressed: () {
            final theme = isDarkMode ? MyThemes.lightTheme : MyThemes.darkTheme;

            final switcher = ThemeSwitcher.of(context);
            switcher.changeTheme(theme: theme);
          },
        ),
      ),
    ],
  );
}
