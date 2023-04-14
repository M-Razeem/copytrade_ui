
import 'package:copytrade_ui/privacy.dart';
import 'package:copytrade_ui/profile/change%20password.dart';
import 'package:copytrade_ui/profile/edit%20profile.dart';
import 'package:copytrade_ui/profile/help%20center.dart';
import 'package:copytrade_ui/profile/settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'main.dart';
import 'notifications.dart';

List editProfile=[
  {
    "Name":"Edit Profile",
    "Icon":Icons.edit,
    "Navigation": EditProfile(),
  },
  {
    "Name":"Change Password",
    "Icon":Icons.lock_sharp,
    "Navigation": ChangePwd(),
  },
  {
    "Name":"Help Center",
    "Icon":Icons.help,
    "Navigation": HelpCenter(),
  },
  {
    "Name":"Settings",
    "Icon":Icons.settings_sharp,
    "Navigation": Settings1(),
  }
];

List setting=[
  {
    "Name" : "Notifications",
    "Icon" : Icon(Icons.notifications),
  },
  {
    "Name" : "Dark Mode",
    "Icon" : Icon(
        darkMode ? iconDark : iconLight,
      ),
    "Pressed" : () {
      darkMode = !darkMode;
      streamController.sink.add(1);
    },
  },
  {
    "Name" : "Terms of Services",
    "Icon" : Icon(Icons.arrow_forward_ios_sharp),
  },
  {
    "Name" : "Privacy Policy",
    "Icon" : Icon(Icons.arrow_forward_ios_sharp),
  },
  {
    "Name" : "Log out",
    "Icon" : Icon(Icons.logout_sharp),
  }
];