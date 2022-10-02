import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goldenhack/model/user.dart';
import 'package:goldenhack/pages/edit_profile_page.dart';
import 'package:goldenhack/pages/profileAvatar.dart';
import 'package:goldenhack/utils/user_preferences.dart';
import 'package:goldenhack/widget/appbar_widget.dart';
import 'package:goldenhack/widget/button_widget.dart';
import 'package:goldenhack/widget/numbers_widget.dart';
import 'package:goldenhack/widget/profile_widget.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) => Scaffold(
          appBar: buildAppBar(context, 'Profile'),
          body: Padding(
            padding: EdgeInsets.all(20),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                ProfileWidget(
                  imagePath: user.imagePath,
                  onClicked: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => EditProfilePage()),
                    );
                  },
                ),
                const SizedBox(height: 24),
                buildName(user),
                const SizedBox(height: 24),
                Center(child: buildUpgradeButton()),
                const SizedBox(height: 24),
                NumbersWidget(),
                const SizedBox(height: 48),
                buildAbout(user),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildUpgradeButton() => ButtonWidget(
        text: 'View Avatar',
        onClicked: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (ctx) => ProfileAvatar(
                      assetPath: 'assets/cute2.glb',
                      assetName: 'Smiley Blues')));
        },
      );

  Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              user.about,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
